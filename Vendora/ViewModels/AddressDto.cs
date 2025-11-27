using System.ComponentModel.DataAnnotations;

namespace Vendora.ViewModels
{
    public class AddressDto
    {
        [Required]
        public string FullName { get; set; }

        public string CompanyName { get; set; }

        [Required]
        public string FullDescription { get; set; } // Street address

        public string AddressLine2 { get; set; } // Apartment, suite, etc.

        [Required]
        public string City { get; set; }

        [Required]
        public string PostalCode { get; set; }

        [Required]
        public string Country { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [Phone]
        public string PhoneNumber { get; set; }

        public bool SaveForFuture { get; set; }
        public bool SetAsDefault { get; set; }

    }
}
