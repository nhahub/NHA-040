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
    public class VendorTransactionsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public VendorTransactionsController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/VendorTransactions
        [HttpGet]
        public async Task<ActionResult<IEnumerable<VendorTransaction>>> GetVendorTransactions()
        {
            return await _context.VendorTransactions.ToListAsync();
        }

        // GET: api/VendorTransactions/5
        [HttpGet("{id}")]
        public async Task<ActionResult<VendorTransaction>> GetVendorTransaction(int id)
        {
            var vendorTransaction = await _context.VendorTransactions.FindAsync(id);

            if (vendorTransaction == null)
            {
                return NotFound();
            }

            return vendorTransaction;
        }

        // PUT: api/VendorTransactions/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutVendorTransaction(int id, VendorTransaction vendorTransaction)
        {
            if (id != vendorTransaction.txn_id)
            {
                return BadRequest();
            }

            _context.Entry(vendorTransaction).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VendorTransactionExists(id))
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

        // POST: api/VendorTransactions
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<VendorTransaction>> PostVendorTransaction(VendorTransaction vendorTransaction)
        {
            _context.VendorTransactions.Add(vendorTransaction);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetVendorTransaction", new { id = vendorTransaction.txn_id }, vendorTransaction);
        }

        // DELETE: api/VendorTransactions/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteVendorTransaction(int id)
        {
            var vendorTransaction = await _context.VendorTransactions.FindAsync(id);
            if (vendorTransaction == null)
            {
                return NotFound();
            }

            _context.VendorTransactions.Remove(vendorTransaction);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool VendorTransactionExists(int id)
        {
            return _context.VendorTransactions.Any(e => e.txn_id == id);
        }
    }
}
