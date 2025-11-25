using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Vendora.Models;
using Vendora.ViewModels;

namespace Vendora.Controllers
{
    public class CartsController : Controller
    {
        private readonly AppDbContext _context;

        public CartsController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Carts
        public async Task<IActionResult> Index()
        {
            // TEMP: You already said you will later use logged in client
            int clientId = 1;

            var cart = await _context.Carts
                .Include(c => c.CartItems)
                    .ThenInclude(ci => ci.Variant)
                        .ThenInclude(v => v.Product)
                            .ThenInclude(p => p.ProductImages)
                .Include(c => c.CartItems)
                    .ThenInclude(ci => ci.Variant)
                        .ThenInclude(v => v.Size)
                .Include(c => c.CartItems)
                    .ThenInclude(ci => ci.Variant)
                        .ThenInclude(v => v.Color)
                .Include(c => c.CartItems)
                    .ThenInclude(ci => ci.Variant)
                        .ThenInclude(v => v.Material)
                .FirstOrDefaultAsync(c => c.ClientID == clientId);

            if (cart == null)
            {
                return View(new CartPageViewModel
                {
                    Items = new List<CartItemsViewModel>()
                });
            }

            var model = new CartPageViewModel
            {
                Items = cart.CartItems.Select(ci =>
                {
                    var product = ci.Variant.Product;
                    var variant = ci.Variant;

                    // Get product images
                    var images = ProductsController.imgHandler(product);
                    var primary = images.FirstOrDefault(i => i?.IsPrimary == true)?.ImageURL;
                    var fallback = images.FirstOrDefault(i => i != null)?.ImageURL;

                    // Build variant description (e.g. "Size: L / Color: Red / Material: Cotton")
                    var variantParts = new List<string>();

                    if (variant.Size != null)
                        variantParts.Add($"Size: {variant.Size.SizeName}");

                    if (variant.Color != null)
                        variantParts.Add($"Color: {variant.Color.ColorName}");

                    if (variant.Material != null)
                        variantParts.Add($"Material: {variant.Material.MaterialName}");

                    string variantDescription = variantParts.Count > 0
                        ? string.Join("/", variantParts)
                        : "Standard";

                    return new CartItemsViewModel
                    {
                        CartItemId = ci.CartItemId,
                        ProductName = product.ProductName,
                        VariantDescription = variantDescription,
                        UnitPrice = variant.Price, // Changed: Price now comes from variant
                        Quantity = ci.Quantity,
                        imgPath = primary ?? fallback
                    };
                })
                .ToList(),
            };

            return View(model);
        }

        // GET: Carts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cart = await _context.Carts
                .Include(c => c.Client)
                .FirstOrDefaultAsync(m => m.CartId == id);
            if (cart == null)
            {
                return NotFound();
            }

            return View(cart);
        }

        // GET: Carts/Create
        public IActionResult Create()
        {
            ViewData["ClientID"] = new SelectList(_context.Clients, "ClientID", "Email");
            return View();
        }

        // POST: Carts/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CartId,ClientID")] Cart cart)
        {
            if (ModelState.IsValid)
            {
                _context.Add(cart);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ClientID"] = new SelectList(_context.Clients, "ClientID", "Email", cart.ClientID);
            return View(cart);
        }

        // GET: Carts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cart = await _context.Carts.FindAsync(id);
            if (cart == null)
            {
                return NotFound();
            }
            ViewData["ClientID"] = new SelectList(_context.Clients, "ClientID", "Email", cart.ClientID);
            return View(cart);
        }

        // POST: Carts/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CartId,ClientID")] Cart cart)
        {
            if (id != cart.CartId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(cart);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CartExists(cart.CartId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ClientID"] = new SelectList(_context.Clients, "ClientID", "Email", cart.ClientID);
            return View(cart);
        }

        // GET: Carts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cart = await _context.Carts
                .Include(c => c.Client)
                .FirstOrDefaultAsync(m => m.CartId == id);
            if (cart == null)
            {
                return NotFound();
            }

            return View(cart);
        }

        // POST: Carts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var cart = await _context.Carts.FindAsync(id);
            if (cart != null)
            {
                _context.Carts.Remove(cart);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CartExists(int id)
        {
            return _context.Carts.Any(e => e.CartId == id);
        }
    }
}