using Microsoft.EntityFrameworkCore;
using Vendora.Models;
using Vendora.ViewModels;
namespace Vendora.Services
{
    public class PaymentService : IPaymentService
    {
        private readonly AppDbContext _context;
        private readonly IConfiguration _configuration;

        public PaymentService(AppDbContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }

        public async Task<PaymentMethod> SavePaymentMethodAsync(int clientId, PaymentMethodDto dto)
        {
            // If setting as default, unset other defaults
            if (dto.IsDefault)
            {
                var existingMethods = await _context.PaymentMethods
                    .Where(pm => pm.ClientID == clientId && pm.IsDefault)
                    .ToListAsync();

                existingMethods.ForEach(pm => pm.IsDefault = false);
            }

            var paymentMethod = new PaymentMethod
            {
                ClientID = clientId,
                PaymentType = dto.PaymentType,
                LastFourDigits = dto.LastFourDigits,
                CardBrand = dto.CardBrand,
                ExpiryMonth = dto.ExpiryMonth,
                ExpiryYear = dto.ExpiryYear,
                CardholderName = dto.CardholderName,
                PaymentToken = dto.PaymentToken, // Should be encrypted
                IsDefault = dto.IsDefault,
                IsActive = true,
                CreatedDate = DateTime.UtcNow
            };

            _context.PaymentMethods.Add(paymentMethod);
            await _context.SaveChangesAsync();

            return paymentMethod;
        }

        public async Task<List<PaymentMethod>> GetClientPaymentMethodsAsync(int clientId)
        {
            return await _context.PaymentMethods
                .Where(pm => pm.ClientID == clientId && pm.IsActive)
                .OrderByDescending(pm => pm.IsDefault)
                .ThenByDescending(pm => pm.LastUsedDate)
                .ToListAsync();
        }

        public async Task<PaymentMethod> GetPaymentMethodAsync(int paymentMethodId)
        {
            return await _context.PaymentMethods
                .FirstOrDefaultAsync(pm => pm.PaymentMethodID == paymentMethodId && pm.IsActive);
        }

        public async Task<bool> SetDefaultPaymentMethodAsync(int paymentMethodId, int clientId)
        {
            // Unset all defaults
            var allMethods = await _context.PaymentMethods
                .Where(pm => pm.ClientID == clientId)
                .ToListAsync();

            allMethods.ForEach(pm => pm.IsDefault = false);

            // Set new default
            var method = allMethods.FirstOrDefault(pm => pm.PaymentMethodID == paymentMethodId);
            if (method != null)
            {
                method.IsDefault = true;
                await _context.SaveChangesAsync();
                return true;
            }

            return false;
        }

        public async Task<bool> DeletePaymentMethodAsync(int paymentMethodId, int clientId)
        {
            var method = await _context.PaymentMethods
                .FirstOrDefaultAsync(pm => pm.PaymentMethodID == paymentMethodId && pm.ClientID == clientId);

            if (method != null)
            {
                method.IsActive = false; // Soft delete
                await _context.SaveChangesAsync();
                return true;
            }

            return false;
        }

        public async Task<bool> ProcessPaymentAsync(int orderId, int paymentMethodId)
        {
            var order = await _context.Orders.FindAsync(orderId);
            var paymentMethod = await _context.PaymentMethods.FindAsync(paymentMethodId);

            if (order == null || paymentMethod == null)
                return false;

            // TODO: Actually charge the card using Stripe
            // For now, just mark as successful for testing

            try
            {
                // In real implementation, you would:
                // 1. Create a Stripe PaymentIntent
                // 2. Charge the saved payment method token
                // 3. Handle payment confirmation

                // For testing, simulate success:
                await Task.Delay(1000); // Simulate API call

                // Update payment method last used date
                paymentMethod.LastUsedDate = DateTime.UtcNow;

                // Link payment method to order
                order.PaymentMethodID = paymentMethodId;

                await _context.SaveChangesAsync();

                return true; // Payment "succeeded"
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Payment processing error: {ex.Message}");
                return false;
            }
        }
    }
}
