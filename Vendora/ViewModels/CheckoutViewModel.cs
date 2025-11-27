using Vendora.Models;

namespace Vendora.ViewModels
{
    public class CheckoutViewModel
    {
        public int? OrderId { get; set; }
        public Order Order { get; set; }

        // Payment Methods
        public List<PaymentMethod> SavedPaymentMethods { get; set; }
        public int SelectedPaymentMethodId { get; set; }
        public bool UseNewPaymentMethod { get; set; }
        public PaymentMethodDto NewPaymentMethod { get; set; }

        // Cart Items
        public List<CheckoutItemViewModel> CartItems { get; set; }
        public decimal CartTotal { get; set; }

        // Address Management - NEW
        public List<Address> SavedAddresses { get; set; }
        public int? SelectedAddressId { get; set; }
        public bool UseNewAddress { get; set; }
        public AddressDto NewAddress { get; set; }

        // Optional fields
        public string OrderNotes { get; set; }
        public string CouponCode { get; set; }
    }
}
