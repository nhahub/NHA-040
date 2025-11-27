using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using Vendora.Models;
using Vendora.Services;
using Vendora.ViewModels;

namespace Vendora.Controllers
{
    public class PaymentController : BaseCartController
    {
        private readonly IPaymentService _paymentService;
        private readonly IConfiguration _configuration;

        public PaymentController(
            IPaymentService paymentService,
            AppDbContext context,
            IConfiguration configuration)
            : base(context)
        {
            _paymentService = paymentService;
            _configuration = configuration;
        }

        // GET: Payment/Checkout
        //[Authorize]
        public async Task<IActionResult> Checkout()
        {
            var clientId = 1; // TODO: Replace with actual authentication

            var cartViewModel = await GetCartViewModel(clientId);

            if (cartViewModel.Items == null || !cartViewModel.Items.Any())
            {
                TempData["Error"] = "Your cart is empty";
                return RedirectToAction("Index", "Carts");
            }

            // Get saved payment methods
            var savedMethods = await _paymentService.GetClientPaymentMethodsAsync(clientId);

            // Get saved addresses
            var savedAddresses = await _context.Addresses
                .Where(a => a.ClientID == clientId && !a.is_deleted)
                .OrderByDescending(a => a.is_default)
                .ThenByDescending(a => a.created_at)
                .ToListAsync();

            var checkoutViewModel = new CheckoutViewModel
            {
                SavedPaymentMethods = savedMethods ?? new List<PaymentMethod>(),
                SavedAddresses = savedAddresses ?? new List<Address>(),
                CartItems = cartViewModel.Items.Select(item => new CheckoutItemViewModel
                {
                    VariantID = item.VariantID,
                    ProductName = item.ProductName,
                    VariantDescription = item.VariantDescription,
                    UnitPrice = item.UnitPrice,
                    Quantity = item.Quantity,
                    ImagePath = item.imgPath
                }).ToList(),
                CartTotal = cartViewModel.CartTotal,
                NewPaymentMethod = new PaymentMethodDto(),
                NewAddress = new AddressDto()
            };

            ViewBag.StripePublicKey = _configuration["Stripe:PublicKey"];

            return View(checkoutViewModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ProcessCheckout(CheckoutViewModel model)
        {
            try
            {
                var clientId = 1; // TODO: Replace with actual authentication

                // Get cart
                var cart = await _context.Carts
                    .Include(c => c.CartItems)
                        .ThenInclude(ci => ci.Variant)
                            .ThenInclude(v => v.Product)
                    .FirstOrDefaultAsync(c => c.ClientID == clientId);

                if (cart == null || !cart.CartItems.Any())
                {
                    TempData["Error"] = "Your cart is empty";
                    return RedirectToAction("Index", "Carts");
                }

                int paymentMethodId = model.SelectedPaymentMethodId;
                int addressId = model.SelectedAddressId ?? 0;

                // Handle new payment method
                if (model.UseNewPaymentMethod)
                {
                    if (string.IsNullOrEmpty(model.NewPaymentMethod.PaymentToken))
                    {
                        ModelState.AddModelError("", "Payment method token is required");
                        return await ReloadCheckoutView(clientId);
                    }

                    var paymentMethod = await _paymentService.SavePaymentMethodAsync(
                        clientId,
                        model.NewPaymentMethod
                    );

                    paymentMethodId = paymentMethod.PaymentMethodID;
                }

                // Handle new address
                if (model.UseNewAddress)
                {
                    var newAddress = new Address
                    {
                        ClientID = clientId,
                        full_description = $"{model.NewAddress.FullDescription}, {model.NewAddress.AddressLine2}".Trim(',', ' '),
                        city = model.NewAddress.City,
                        postal_code = model.NewAddress.PostalCode,
                        country = model.NewAddress.Country,
                        is_default = model.NewAddress.SetAsDefault,
                        is_deleted = false,
                        created_at = DateTime.UtcNow
                    };

                    // If setting as default, unset others
                    if (newAddress.is_default==true)
                    {
                        var existingAddresses = await _context.Addresses
                            .Where(a => a.ClientID == clientId && a.is_default==true)
                            .ToListAsync();
                        existingAddresses.ForEach(a => a.is_default = false);
                    }

                    _context.Addresses.Add(newAddress);
                    await _context.SaveChangesAsync();

                    addressId = newAddress.address_id;
                }

                // Create order
                var order = new Order
                {
                    ClientID = clientId,
                    OrderDate = DateTime.UtcNow,
                    TotalOrder = cart.CartItems.Sum(ci => ci.Variant.Price * ci.Quantity),
                    Status = "Pending",
                    PaymentMethodID = paymentMethodId,
                    address_id = addressId,
                    OrderDetails = cart.CartItems.Select(ci => new OrderDetail
                    {
                        VariantID = ci.VariantId,
                        Quantity = ci.Quantity,
                        UnitPrice = ci.Variant.Price,
                        Status = "Pending"
                    }).ToList()
                };

                _context.Orders.Add(order);
                await _context.SaveChangesAsync();

                // Process payment
                var paymentSuccess = await _paymentService.ProcessPaymentAsync(
                    order.OrderID,
                    paymentMethodId
                );

                if (paymentSuccess)
                {
                    order.Status = "Confirmed";

                    // Update variant stock
                    foreach (var item in cart.CartItems)
                    {
                        var variant = item.Variant;
                        variant.StockQuantity -= item.Quantity;

                        if (variant.StockQuantity < 0)
                        {
                            throw new Exception($"Insufficient stock for {variant.Product.ProductName}");
                        }
                    }

                    // Clear cart
                    _context.CartItems.RemoveRange(cart.CartItems);

                    await _context.SaveChangesAsync();

                    TempData["Success"] = "Order placed successfully!";
                    return RedirectToAction("Index", "ThankYou", new { orderId = order.OrderID });
                }
                else
                {
                    _context.Orders.Remove(order);
                    await _context.SaveChangesAsync();

                    ModelState.AddModelError("", "Payment processing failed. Please try again.");
                    return await ReloadCheckoutView(clientId);
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", $"Error processing order: {ex.Message}");
                return await ReloadCheckoutView(1);
            }
        }


        private async Task<IActionResult> ReloadCheckoutView(int clientId)
        {
            var cartViewModel = await GetCartViewModel(clientId);
            var savedMethods = await _paymentService.GetClientPaymentMethodsAsync(clientId);
            var savedAddresses = await _context.Addresses
                .Where(a => a.ClientID == clientId && !a.is_deleted)
                .OrderByDescending(a => a.is_default==true)
                .ToListAsync();

            var checkoutViewModel = new CheckoutViewModel
            {
                SavedPaymentMethods = savedMethods ?? new List<PaymentMethod>(),
                SavedAddresses = savedAddresses ?? new List<Address>(),
                CartItems = cartViewModel.Items?.Select(item => new CheckoutItemViewModel
                {
                    VariantID = item.VariantID,
                    ProductName = item.ProductName,
                    VariantDescription = item.VariantDescription,
                    UnitPrice = item.UnitPrice,
                    Quantity = item.Quantity,
                    ImagePath = item.imgPath
                }).ToList() ?? new List<CheckoutItemViewModel>(),
                CartTotal = cartViewModel.CartTotal,
                NewPaymentMethod = new PaymentMethodDto(),
                NewAddress = new AddressDto()
            };

            ViewBag.StripePublicKey = _configuration["Stripe:PublicKey"];
            return View("Checkout", checkoutViewModel);
        }



        // GET: Payment/OrderConfirmation
        //[Authorize]
        public async Task<IActionResult> OrderConfirmation(int id)
        {
            var clientId = GetCurrentClientId();

            var order = await _context.Orders
                .Include(o => o.OrderDetails)
                    .ThenInclude(od => od.Variant)
                        .ThenInclude(v => v.Product)
                            .ThenInclude(p => p.ProductImages)
                .Include(o => o.OrderDetails)
                    .ThenInclude(od => od.Variant)
                        .ThenInclude(v => v.Size)
                .Include(o => o.OrderDetails)
                    .ThenInclude(od => od.Variant)
                        .ThenInclude(v => v.Color)
                .Include(o => o.OrderDetails)
                    .ThenInclude(od => od.Variant)
                        .ThenInclude(v => v.Material)
                .Include(o => o.PaymentMethod)
                .Include(o => o.Client)
                .FirstOrDefaultAsync(o => o.OrderID == id && o.ClientID == clientId);

            if (order == null)
            {
                return NotFound();
            }

            return View(order);
        }

        // Helper Methods
        private int GetCurrentClientId()
        {
            // Adjust based on how you store ClientId in claims
            var clientIdClaim = User.FindFirst("ClientId")?.Value
                             ?? User.FindFirst(ClaimTypes.NameIdentifier)?.Value;

            return int.Parse(clientIdClaim ?? "0");
        }
    }
}
