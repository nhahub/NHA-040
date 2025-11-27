using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Vendora.Controllers;
using Vendora.Models;
using Vendora.ViewModels;

public class BaseCartController : Controller
{
    protected readonly AppDbContext _context;

    public BaseCartController(AppDbContext context)
    {
        _context = context;
    }

    // Controllers/BaseCartController.cs
    protected async Task<CartPageViewModel> GetCartViewModel(int clientId)
    {
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
            return new CartPageViewModel
            {
                Items = new List<CartItemsViewModel>()
            };
        }

        var model = new CartPageViewModel
        {
            Items = cart.CartItems.Select(ci =>
            {
                var product = ci.Variant.Product;
                var variant = ci.Variant;

                var images = ProductsController.imgHandler(product);
                var primary = images.FirstOrDefault(i => i?.IsPrimary == true)?.ImageURL;
                var fallback = images.FirstOrDefault(i => i != null)?.ImageURL;

                var variantParts = new List<string>();

                if (variant.Size != null)
                    variantParts.Add($"Size: {variant.Size.SizeName}");

                if (variant.Color != null)
                    variantParts.Add($"Color: {variant.Color.ColorName}");

                if (variant.Material != null)
                    variantParts.Add($"Material: {variant.Material.MaterialName}");

                string variantDescription = variantParts.Count > 0
                    ? string.Join(", ", variantParts)
                    : "Standard";

                return new CartItemsViewModel
                {
                    CartItemId = ci.CartItemId,
                    VariantID = ci.VariantId, // Add this line
                    ProductName = product.ProductName,
                    VariantDescription = variantDescription,
                    UnitPrice = variant.Price,
                    Quantity = ci.Quantity,
                    imgPath = primary ?? fallback
                };
            })
            .ToList(),
        };

        return model;
    }
}