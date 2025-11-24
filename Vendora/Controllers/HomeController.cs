using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using Vendora.Models;

namespace Vendora.Controllers
{
    public class HomeController : ProductsController
    {

        public HomeController(AppDbContext db) : base(db)
        {
        }

        public async Task<IActionResult> Index()
        {
           
            return await ProductIndex("Index");
        }
        
        public IActionResult Privacy()
        {
            return View();
        }

    }
}
