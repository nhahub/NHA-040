using System.ComponentModel.DataAnnotations;

namespace Vendora.ViewModels
{
    public class PaymentMethodDto
    {
        [Required]
        public string PaymentType { get; set; }

        [Required]
        [StringLength(4)]
        public string LastFourDigits { get; set; }

        public string CardBrand { get; set; }

        [Range(1, 12)]
        public int ExpiryMonth { get; set; }

        [Range(2024, 2050)]
        public int ExpiryYear { get; set; }

        [Required]
        public string CardholderName { get; set; }

        public string PaymentToken { get; set; }

        public bool IsDefault { get; set; }

        public bool SaveForFuture { get; set; }
    }
}
