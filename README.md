# Vendora – E‑commerce Platform

A full‑featured e‑commerce platform built with **ASP.NET Core MVC**, **Entity Framework Core**, and **Stripe** payment integration.

---

## 🚀 Features

- Product catalog with variants (size, color, material)  
- Shopping cart functionality  
- Secure checkout with **Stripe**  
- Saved payment methods  
- Shipping address management  
- Order creation, tracking & stock updates  
- Responsive UI (Bootstrap)  
- SQL Server–backed database using EF Core  

---

## 📋 Prerequisites

You need the following installed:

- **Visual Studio 2022/2026** or **VS Code**  
- **.NET 6 SDK**  
- **SQL Server** (Express or full version)  
- **SSMS** (optional but recommended)  
- **Git**

---

## ⚙️ Installation

### **1️⃣ Clone the repository**

```bash
git clone https://github.com/your-username/Vendora.git
cd Vendora
```

---

### **2️⃣ Set up the Database**

#### **Option A — Using SSMS**
1. Open **SQL Server Management Studio**  
2. Connect to your SQL instance (e.g., `(localdb)\MSSQLLocalDB`)  
3. Open → *Database.sql*  
4. Press **F5** to execute  
5. Ensure database **VendoraDB** is created  

#### **Option B — Using sqlcmd (CLI)**

```bash
sqlcmd -S localhost -i Database.sql
```

#### **Option C — Using Visual Studio**
1. Open **SQL Server Object Explorer**  
2. Connect → right‑click server → **New Query**  
3. Paste contents of *Database.sql*  
4. Execute  

---

### **3️⃣ Get your connection string**

Examples:

**SQL Server Express**
```
Server=localhost\SQLEXPRESS;Database=VendoraDB;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True
```

**LocalDB**
```
Server=(localdb)\MSSQLLocalDB;Database=VendoraDB;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True
```

**SQL Server (with credentials)**
```
Server=localhost;Database=VendoraDB;User Id=YOUR_USER;Password=YOUR_PASS;MultipleActiveResultSets=true;TrustServerCertificate=True
```

---

### **4️⃣ Update `appsettings.json`**

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\MSSQLLocalDB;Database=VendoraDB;Trusted_Connection=True;MultipleActiveResultSets=true;TrustServerCertificate=True"
  },
  "Stripe": {
    "PublicKey": "pk_test_xxxxxx",
    "SecretKey": "sk_test_xxxxxx"
  }
}
```

> ⚠️ **Never commit real Stripe keys to Git!**

---

### **5️⃣ Set up Stripe**

1. Create or log in at: https://dashboard.stripe.com  
2. Switch to **Test Mode**  
3. Copy **Publishable key** → starts with `pk_test_`  
4. Copy **Secret key** → starts with `sk_test_`  
5. Paste into `appsettings.json`

---

### **6️⃣ Restore NuGet packages**

```bash
dotnet restore
```

---

### **7️⃣ Build & Run**

```bash
dotnet build
dotnet run
```

App will launch at:

- **http://localhost:5000**
- **https://localhost:7000**

---

## 🧪 Testing

### **Stripe Test Cards**

| Card Number | Brand | Result |
|------------|--------|---------|
| 4242 4242 4242 4242 | Visa | ✅ Success |
| 4000 0025 0000 3155 | Visa | ⚠️ Requires Authentication |
| 4000 0000 0000 9995 | Visa | ❌ Declined |

Use any future expiry, any CVC, any ZIP.

### **Default Test User**

Authentication is not yet implemented — currently a hardcoded user (ID: `1`) is used.

---

## 📁 Project Structure

```
Vendora/
├── Controllers/
│   ├── PaymentController.cs
│   ├── CartsController.cs
│   ├── ProductsController.cs
│   └── ...
├── Models/
│   ├── Product.cs
│   ├── Order.cs
│   ├── PaymentMethod.cs
│   └── ...
├── Views/
│   ├── Payment/
│   ├── Carts/
│   └── Products/
├── Services/
│   ├── PaymentService.cs
│   └── ...
├── ViewModels/
├── Data/
│   └── AppDbContext.cs
├── wwwroot/
├── Database.sql
└── appsettings.json
```

---

## 🛠️ Required Settings Summary

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "YOUR_CONNECTION_STRING"
  },
  "Stripe": {
    "PublicKey": "pk_test_...",
    "SecretKey": "sk_test_..."
  }
}
```

---

## 🐛 Troubleshooting

### **Database not connecting**
- Ensure SQL Server is running  
- Verify your connection string  
- Make sure *Database.sql* executed successfully  

### **Stripe: “No authenticationScheme was specified”**
Authentication system is not yet implemented. This is normal.

### **Stripe: “Invalid API key”**
- Ensure keys start with `pk_test_` and `sk_test_`  
- Confirm you're in **Test Mode**  

### **Port conflicts**
Modify port in `Properties/launchSettings.json`:

```json
"applicationUrl": "https://localhost:7001;http://localhost:5001"
```

---

## 🚧 Known Limitations

- No authentication yet (uses user ID 1)  
- No admin panel  
- Email confirmation not implemented  

---

## 🤝 Contributing

1. Fork the repo  
2. Create a branch  
3. Commit your changes  
4. Push & open a pull request  

---

## 📝 License
This project is released under the **MIT License**.

---

## 👨‍💻 Author
**Mahmoud Hany Salem**

---

## 🙏 Acknowledgments
- Stripe  
- Bootstrap  
- Entity Framework Core  
- The open‑source community  
