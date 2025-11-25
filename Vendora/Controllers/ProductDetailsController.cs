using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Vendora.Models;
using Vendora.ViewModels;
using System.Linq;
using System.Threading.Tasks;

namespace Vendora.Controllers
{
    public class ProductDetailsController : Controller
    {
        private readonly AppDbContext _context;

        public ProductDetailsController(AppDbContext context)
        {
            _context = context;
        }

        // GET: ProductDetails/Index/5
        public async Task<IActionResult> Index(int? id)
        {
            if (id == null)
                return NotFound();

            var product = await _context.Products
                .Include(p => p.Category)
                .Include(p => p.ProductImages)
                .Include(p => p.ProductVariants)
                    .ThenInclude(v => v.Size)
                .Include(p => p.ProductVariants)
                    .ThenInclude(v => v.Color)
                .Include(p => p.ProductVariants)
                    .ThenInclude(v => v.Material)
                .FirstOrDefaultAsync(p => p.ProductID == id && p.IsDeleted == false);

            if (product == null)
                return NotFound();

            // Process images
            var processedImages = ProductsController.imgHandler(product);
            List<string> imgs = processedImages.Select(i => i.ImageURL).ToList();

            // Extract distinct size options from variants
            var sizeOptions = product.ProductVariants
                .Where(v => v.Size != null)
                .Select(v => v.Size)
                .Distinct()
                .OrderBy(s => s.DisplayOrder)
                .ToList();

            // Extract distinct color options from variants
            var colorOptions = product.ProductVariants
                .Where(v => v.Color != null)
                .Select(v => v.Color)
                .Distinct()
                .OrderBy(c => c.DisplayOrder)
                .ToList();

            // Extract distinct material options from variants
            var materialOptions = product.ProductVariants
                .Where(v => v.Material != null)
                .Select(v => v.Material)
                .Distinct()
                .OrderBy(m => m.DisplayOrder)
                .ToList();

            // Build variant list for frontend
            var variantList = product.ProductVariants
                .Where(v => v.IsActive)
                .Select(v => new ProductVariantViewModel
                {
                    VariantId = v.VariantID,
                    SizeId = v.SizeID,
                    SizeName = v.Size?.SizeName,
                    ColorId = v.ColorID,
                    ColorName = v.Color?.ColorName,
                    ColorHexCode = v.Color?.HexCode,
                    MaterialId = v.MaterialID,
                    MaterialName = v.Material?.MaterialName,
                    Price = v.Price,
                    StockQuantity = v.StockQuantity,
                    IsActive = v.IsActive
                })
                .ToList();

            // Calculate total stock and price range
            var activeVariants = product.ProductVariants?.Where(v => v.IsActive).ToList() ?? new List<ProductVariant>();
            var totalStock = activeVariants.Sum(v => v.StockQuantity);
            var minPrice = activeVariants.Any() ? activeVariants.Min(v => v.Price) : product.BasePrice;
            var maxPrice = activeVariants.Any() ? activeVariants.Max(v => v.Price) : product.BasePrice;

            // Build ViewModel
            var viewModel = new ProductDetailsViewModel
            {
                ProductId = product.ProductID,
                ProductName = product.ProductName,
                Description = product.Description,
                ShortDescription = product.Description?.Length > 150
                    ? product.Description.Substring(0, 150) + "..."
                    : product.Description,
                BasePrice = product.BasePrice, // Changed from Price to BasePrice
                MainImage = processedImages.FirstOrDefault(img => img.IsPrimary == true)?.ImageURL
                            ?? processedImages.FirstOrDefault()?.ImageURL,
                Images = imgs,
                CategoryName = product.Category?.Name ?? "Uncategorized",

                // Options available for this product
                SizeOptions = sizeOptions,
                ColorOptions = colorOptions,
                MaterialOptions = materialOptions,

                // All variants with their details
                Variants = variantList
            };

            return View(viewModel);
        }
    }
}