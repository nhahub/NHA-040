using Microsoft.AspNetCore.Mvc;

namespace Vendora.Controllers
{
    public class ThankYouController : Controller
    {
        public IActionResult Index(int? orderId)
        {
            ViewBag.OrderId = orderId ?? TempData["OrderId"];
            return View();
        }
    }
}
