using Microsoft.AspNetCore.Mvc;
using Vendora.Models;

namespace Vendora.Controllers
{
    public class ShopController : ProductsController
    {
        public ShopController(AppDbContext db) : base(db)
        {
        }
        public async Task<IActionResult> Index([FromQuery] int pageNum = 1)
        {
            ViewBag.pageNum= pageNum;
            return await GetWithPagination("Index",pageNum, 12);
        }
        public async Task<IActionResult> ProductDetails(int? id)
        {
            return await Details(id, "ProductDetails");
        }
    }
}
