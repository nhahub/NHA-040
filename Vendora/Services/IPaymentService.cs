using Vendora.Models;
using Vendora.ViewModels;
namespace Vendora.Services
{
    public interface IPaymentService
    {
        Task<PaymentMethod> SavePaymentMethodAsync(int clientId, PaymentMethodDto dto);
        Task<List<PaymentMethod>> GetClientPaymentMethodsAsync(int clientId);
        Task<PaymentMethod> GetPaymentMethodAsync(int paymentMethodId);
        Task<bool> SetDefaultPaymentMethodAsync(int paymentMethodId, int clientId);
        Task<bool> DeletePaymentMethodAsync(int paymentMethodId, int clientId);
        Task<bool> ProcessPaymentAsync(int orderId, int paymentMethodId);
    }
}
