using Microsoft.AspNetCore.Mvc;

namespace Vendora.Controllers
{
    public class CheckOutController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
