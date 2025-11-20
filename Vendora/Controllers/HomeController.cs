using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Vendora.Models;

namespace Vendora.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _db;
        public HomeController(AppDbContext db)
        {
            this._db = db;
        }

        public IActionResult Index()
        {
            return View();//_db.Users.ToList()
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
