using Microsoft.AspNetCore.Mvc;

namespace Vendora.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
