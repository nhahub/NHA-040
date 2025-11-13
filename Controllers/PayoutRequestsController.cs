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
    public class PayoutRequestsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public PayoutRequestsController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/PayoutRequests
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PayoutRequest>>> GetPayoutRequests()
        {
            return await _context.PayoutRequests.ToListAsync();
        }

        // GET: api/PayoutRequests/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PayoutRequest>> GetPayoutRequest(int id)
        {
            var payoutRequest = await _context.PayoutRequests.FindAsync(id);

            if (payoutRequest == null)
            {
                return NotFound();
            }

            return payoutRequest;
        }

        // PUT: api/PayoutRequests/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPayoutRequest(int id, PayoutRequest payoutRequest)
        {
            if (id != payoutRequest.payout_id)
            {
                return BadRequest();
            }

            _context.Entry(payoutRequest).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PayoutRequestExists(id))
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

        // POST: api/PayoutRequests
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<PayoutRequest>> PostPayoutRequest(PayoutRequest payoutRequest)
        {
            _context.PayoutRequests.Add(payoutRequest);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPayoutRequest", new { id = payoutRequest.payout_id }, payoutRequest);
        }

        // DELETE: api/PayoutRequests/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePayoutRequest(int id)
        {
            var payoutRequest = await _context.PayoutRequests.FindAsync(id);
            if (payoutRequest == null)
            {
                return NotFound();
            }

            _context.PayoutRequests.Remove(payoutRequest);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PayoutRequestExists(int id)
        {
            return _context.PayoutRequests.Any(e => e.payout_id == id);
        }
    }
}
