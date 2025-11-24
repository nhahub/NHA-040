using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Vendora.Models;
using Vendora.ViewModels;
using System.Linq;
using System.Threading.Tasks;
using Vendora.Controllers;
namespace Vendora.Controllers
{
    public class ProductDetailsController : Controller
    {
        private readonly AppDbContext _context;

        public ProductDetailsController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Products/Details/5
        public async Task<IActionResult> Index(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Category)
                .Include(p => p.ProductImages)
                .Include(p => p.ProductVariants)
                .FirstOrDefaultAsync(p => p.ProductID == id && p.IsDeleted==false);

            if (product == null)
            {
                return NotFound();
            }
            var temp= ProductsController.imgHandler(product);
            List<string> imgs = [];
            foreach(var i in temp)
            {
                imgs.Add(i.ImageURL);
            }
            var viewModel = new ProductDetailsViewModel
            {
                ProductId = product.ProductID,
                ProductName = product.ProductName,
                Description = product.Description,
                ShortDescription = product.Description?.Length > 150
                    ? product.Description.Substring(0, 150) + "..."
                    : product.Description,
                Price = product.Price,
                StockQuantity = product.ProductVariants?.Sum(v => v.StockQuantity) ?? 0,
                MainImage = temp.FirstOrDefault(img => img.IsPrimary==true)?.ImageURL ?? temp.FirstOrDefault(i => i != null)?.ImageURL,
                Images = imgs,
                CategoryName = product.Category?.Name ?? "Uncategorized",

                Variants = product.ProductVariants?.Where(v => v.IsActive==true)?.Select(v => new ProductVariantViewModel
                {
                    VariantId = v.VariantID,
                    VariantName = v.VariantName,
                    VariantValue = v.VariantValue,
                    StockQuantity = v.StockQuantity
                }).ToList(),
            };

            return View(viewModel);
        }

    }
}