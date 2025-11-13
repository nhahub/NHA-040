using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Vendora.Models;

namespace Vendora.Controllers
{
    public class UserCreateDto
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

    }

    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : Controller
    {

        private readonly ILogger<HomeController> _logger;
        //private readonly AppDbContext _db;

        public HomeController(ILogger<HomeController> logger)//AppDbContext db
        {
        _logger = logger;
        //    this._db = db;
        }
        /*
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(_db.Users.ToList());
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            var user = _db.Users.Find(id);
            if (user == null)
                return NotFound();
            else
                return Ok(user);
        }

        [HttpPost]
        public IActionResult Create([FromBody] UserCreateDto dto)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);

            var user = new User
            {
                first_name = dto.FirstName,
                last_name = dto.LastName,
                email = dto.Email,
                password_hash = dto.Password,
            };

            _db.Users.Add(user);
            _db.SaveChanges();

            // Return 201 with location header pointing to the created resource
            return CreatedAtAction(nameof(GetById), new { id = user.user_id }, new
            {
                user.user_id,
                user.first_name,
                user.last_name,
                user.email
            });
        }
        */


        /*
            public IActionResult Index()
           {
               return View();
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
         */
    }
}
