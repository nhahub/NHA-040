using Vendora.ViewModels;
namespace Vendora.ViewModels
{
    public class CartPageViewModel
    {
        public List<CartItemsViewModel> Items { get; set; }
        public decimal CartTotal => Items.Sum(i => i.TotalPrice);
    }
}
