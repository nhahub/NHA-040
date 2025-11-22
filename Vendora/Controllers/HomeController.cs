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
            return View(_db.Employees.ToList());
        }

        public IActionResult Privacy()
        {
            return View();
        }

    }
}
