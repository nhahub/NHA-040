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
    public class CommissionRulesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public CommissionRulesController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/CommissionRules
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CommissionRule>>> GetCommissionRules()
        {
            return await _context.CommissionRules.ToListAsync();
        }

        // GET: api/CommissionRules/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CommissionRule>> GetCommissionRule(int id)
        {
            var commissionRule = await _context.CommissionRules.FindAsync(id);

            if (commissionRule == null)
            {
                return NotFound();
            }

            return commissionRule;
        }

        // PUT: api/CommissionRules/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCommissionRule(int id, CommissionRule commissionRule)
        {
            if (id != commissionRule.rule_id)
            {
                return BadRequest();
            }

            _context.Entry(commissionRule).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CommissionRuleExists(id))
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

        // POST: api/CommissionRules
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CommissionRule>> PostCommissionRule(CommissionRule commissionRule)
        {
            _context.CommissionRules.Add(commissionRule);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCommissionRule", new { id = commissionRule.rule_id }, commissionRule);
        }

        // DELETE: api/CommissionRules/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCommissionRule(int id)
        {
            var commissionRule = await _context.CommissionRules.FindAsync(id);
            if (commissionRule == null)
            {
                return NotFound();
            }

            _context.CommissionRules.Remove(commissionRule);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CommissionRuleExists(int id)
        {
            return _context.CommissionRules.Any(e => e.rule_id == id);
        }
    }
}
