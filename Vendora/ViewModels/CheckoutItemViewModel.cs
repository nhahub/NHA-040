namespace Vendora.ViewModels
{
    public class CheckoutItemViewModel
    {
        public int VariantID { get; set; }
        public string ProductName { get; set; }
        public string VariantDescription { get; set; }
        public decimal UnitPrice { get; set; }
        public int Quantity { get; set; }
        public decimal TotalPrice => UnitPrice * Quantity;
        public string ImagePath { get; set; }
    }
}
