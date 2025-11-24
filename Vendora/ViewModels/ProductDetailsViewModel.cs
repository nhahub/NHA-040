namespace Vendora.ViewModels
{
    public class ProductDetailsViewModel
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public string ShortDescription { get; set; }
        public decimal Price { get; set; }
        public int StockQuantity { get; set; }
        public string MainImage { get; set; }
        public List<string> Images { get; set; }
        public string CategoryName { get; set; }

        public List<ProductVariantViewModel> Variants { get; set; }

        // Related Products
}
}
