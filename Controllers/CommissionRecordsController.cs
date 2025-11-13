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
    public class CommissionRecordsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public CommissionRecordsController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/CommissionRecords
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CommissionRecord>>> GetCommissionRecords()
        {
            return await _context.CommissionRecords.ToListAsync();
        }

        // GET: api/CommissionRecords/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CommissionRecord>> GetCommissionRecord(int id)
        {
            var commissionRecord = await _context.CommissionRecords.FindAsync(id);

            if (commissionRecord == null)
            {
                return NotFound();
            }

            return commissionRecord;
        }

        // PUT: api/CommissionRecords/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCommissionRecord(int id, CommissionRecord commissionRecord)
        {
            if (id != commissionRecord.rec_id)
            {
                return BadRequest();
            }

            _context.Entry(commissionRecord).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CommissionRecordExists(id))
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

        // POST: api/CommissionRecords
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CommissionRecord>> PostCommissionRecord(CommissionRecord commissionRecord)
        {
            _context.CommissionRecords.Add(commissionRecord);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCommissionRecord", new { id = commissionRecord.rec_id }, commissionRecord);
        }

        // DELETE: api/CommissionRecords/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCommissionRecord(int id)
        {
            var commissionRecord = await _context.CommissionRecords.FindAsync(id);
            if (commissionRecord == null)
            {
                return NotFound();
            }

            _context.CommissionRecords.Remove(commissionRecord);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CommissionRecordExists(int id)
        {
            return _context.CommissionRecords.Any(e => e.rec_id == id);
        }
    }
}
