using Microsoft.AspNetCore.Mvc;
using Vendora.Models;
using Vendora.ViewModels;

namespace Vendora.Controllers
{
    public class CheckOutController : BaseCartController
    {
        public CheckOutController(AppDbContext context) : base(context)
        {
        }

        public async Task<IActionResult> Index()
        {
            int clientId = 1;
            var model = await GetCartViewModel(clientId);

            if (model.Items == null || !model.Items.Any())
            {
                TempData["Error"] = "Your cart is empty.";
                return RedirectToAction("Index", "Carts");
            }

            return View(model);
        }
    }
}
