using Vendora.Models;

namespace Vendora.ViewModels
{
    public class ProductVariantViewModel
    {
        public int VariantId { get; set; }
        public int? SizeId { get; set; }
        public string SizeName { get; set; }
        public int? ColorId { get; set; }
        public string ColorName { get; set; }
        public string ColorHexCode { get; set; }
        public int? MaterialId { get; set; }
        public string MaterialName { get; set; }
        public decimal Price { get; set; }
        public int StockQuantity { get; set; }
        public bool IsActive { get; set; }
        public bool IsAvailable => IsActive && StockQuantity > 0;
    }
}