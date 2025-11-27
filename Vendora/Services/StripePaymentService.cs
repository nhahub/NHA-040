using Stripe;

namespace Vendora.Services
{
    public class StripePaymentService
    {
        private readonly string _secretKey;

        public StripePaymentService(IConfiguration configuration)
        {
            _secretKey = configuration["Stripe:SecretKey"];
            StripeConfiguration.ApiKey = _secretKey;
        }

        public async Task<string> CreatePaymentMethodAsync(string token, int clientId)
        {
            var service = new PaymentMethodService();
            var options = new PaymentMethodCreateOptions
            {
                Type = "card",
                Card = new PaymentMethodCardOptions
                {
                    Token = token,
                },
            };

            var paymentMethod = await service.CreateAsync(options);

            // Attach to customer
            await service.AttachAsync(paymentMethod.Id, new PaymentMethodAttachOptions
            {
                Customer = await GetOrCreateStripeCustomer(clientId),
            });

            return paymentMethod.Id;
        }

        public async Task<bool> ChargePaymentMethodAsync(string paymentMethodId, decimal amount, string currency = "usd")
        {
            var options = new PaymentIntentCreateOptions
            {
                Amount = (long)(amount * 100), // Convert to cents
                Currency = currency,
                PaymentMethod = paymentMethodId,
                Confirm = true,
            };

            var service = new PaymentIntentService();
            var paymentIntent = await service.CreateAsync(options);

            return paymentIntent.Status == "succeeded";
        }

        private async Task<string> GetOrCreateStripeCustomer(int clientId)
        {
            // Implement customer creation/retrieval logic
            return "customer_id";
        }
    }
}
