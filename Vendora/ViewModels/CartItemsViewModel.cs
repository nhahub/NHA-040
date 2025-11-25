using Vendora.Models;

namespace Vendora.ViewModels
{
    public class CartItemsViewModel
    {
        public int CartItemId { get; set; }
        public string ProductName { get; set; }
        public string VariantDescription { get; set; }
        public decimal UnitPrice { get; set; }
        public int Quantity { get; set; }
        public string imgPath { get; set; }
        public decimal TotalPrice => UnitPrice * Quantity;
    }
}
