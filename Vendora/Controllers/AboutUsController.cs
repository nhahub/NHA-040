using Microsoft.AspNetCore.Mvc;

namespace Vendora.Controllers
{
    public class AboutUsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
