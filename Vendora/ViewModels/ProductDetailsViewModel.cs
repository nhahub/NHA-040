using Vendora.Models;

namespace Vendora.ViewModels
{
    public class ProductDetailsViewModel
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public string ShortDescription { get; set; }
        public decimal BasePrice { get; set; } 
        public string MainImage { get; set; }
        public List<string> Images { get; set; }
        public string CategoryName { get; set; }

        // Available options for this product
        public List<Size> SizeOptions { get; set; }
        public List<Color> ColorOptions { get; set; }
        public List<Material> MaterialOptions { get; set; }

        // All variants for this product
        public List<ProductVariantViewModel> Variants { get; set; }

        // Related Products (you can add this later)
        // public List<Product> RelatedProducts { get; set; }
    }
}