using Vendora.ViewModels;
namespace Vendora.ViewModels
{
    public class CartPageViewModel
    {
        public int CartId { get; set; }
        public List<CartItemsViewModel> Items { get; set; }
        public decimal CartTotal => Items.Sum(i => i.TotalPrice);
    }
}
