using Microsoft.AspNetCore.Mvc;
using Vendora.Models;

namespace Vendora.Controllers
{
    public class ServicesController : ProductsController
    {
        public ServicesController(AppDbContext db) : base(db)
        {
        }
        public async Task<IActionResult> Index()
        {

            return await ProductIndex("Index");
        }
    }
}
