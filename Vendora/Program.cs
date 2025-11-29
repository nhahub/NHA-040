using Microsoft.EntityFrameworkCore;
using Vendora.Models;
using Vendora.Services;

namespace Vendora
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();

            // Add DbContext
            builder.Services.AddDbContext<AppDbContext>(options =>
            {
                options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
            });

            // Register Payment Service
            builder.Services.AddScoped<IPaymentService, PaymentService>();
            //identity
            // Add authentication (if you need it)
            // builder.Services.AddAuthentication(/* your auth config */);

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles(); // Changed from MapStaticAssets
            app.UseRouting();

            app.UseAuthentication(); // Add this if using authentication
            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
}