using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Vendora.Models;

namespace Vendora.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VendorUsersController : ControllerBase
    {
        private readonly AppDbContext _context;

        public VendorUsersController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/VendorUsers
        [HttpGet]
        public async Task<ActionResult<IEnumerable<VendorUser>>> GetVendorUsers()
        {
            return await _context.VendorUsers.ToListAsync();
        }

        // GET: api/VendorUsers/5
        [HttpGet("{id}")]
        public async Task<ActionResult<VendorUser>> GetVendorUser(int id)
        {
            var vendorUser = await _context.VendorUsers.FindAsync(id);

            if (vendorUser == null)
            {
                return NotFound();
            }

            return vendorUser;
        }

        // PUT: api/VendorUsers/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutVendorUser(int id, VendorUser vendorUser)
        {
            if (id != vendorUser.id)
            {
                return BadRequest();
            }

            _context.Entry(vendorUser).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VendorUserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/VendorUsers
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<VendorUser>> PostVendorUser(VendorUser vendorUser)
        {
            _context.VendorUsers.Add(vendorUser);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetVendorUser", new { id = vendorUser.id }, vendorUser);
        }

        // DELETE: api/VendorUsers/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteVendorUser(int id)
        {
            var vendorUser = await _context.VendorUsers.FindAsync(id);
            if (vendorUser == null)
            {
                return NotFound();
            }

            _context.VendorUsers.Remove(vendorUser);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool VendorUserExists(int id)
        {
            return _context.VendorUsers.Any(e => e.id == id);
        }
    }
}
