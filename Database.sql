USE [master]
GO
/****** Object:  Database [Vendora]    Script Date: 11/27/2025 8:41:14 PM ******/
CREATE DATABASE [Vendora]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vendora', FILENAME = N'A:\apps\SQL Server\Installation\MSSQL16.MSSQLSERVER\MSSQL\DATA\Vendora.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vendora_log', FILENAME = N'A:\apps\SQL Server\Installation\MSSQL16.MSSQLSERVER\MSSQL\DATA\Vendora_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Vendora] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vendora].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vendora] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vendora] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vendora] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vendora] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vendora] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vendora] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vendora] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vendora] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vendora] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vendora] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vendora] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vendora] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vendora] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vendora] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vendora] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vendora] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vendora] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vendora] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vendora] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vendora] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vendora] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vendora] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vendora] SET RECOVERY FULL 
GO
ALTER DATABASE [Vendora] SET  MULTI_USER 
GO
ALTER DATABASE [Vendora] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vendora] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vendora] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vendora] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vendora] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vendora] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Vendora', N'ON'
GO
ALTER DATABASE [Vendora] SET QUERY_STORE = ON
GO
ALTER DATABASE [Vendora] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Vendora]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[full_description] [nvarchar](500) NOT NULL,
	[city] [nvarchar](200) NOT NULL,
	[postal_code] [nvarchar](50) NULL,
	[country] [nvarchar](100) NOT NULL,
	[is_default] [bit] NULL,
	[created_at] [datetime2](7) NULL,
	[is_deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartId] [int] NOT NULL,
	[VariantId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CartItemId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[CartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](120) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
	[HexCode] [char](7) NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Role] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedAt] [datetime2](7) NULL,
	[LastLoginAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[MaterialID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialName] [nvarchar](100) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[VariantID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Status] [nvarchar](60) NULL,
	[UnitPrice] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime2](7) NULL,
	[ClientID] [int] NOT NULL,
	[TotalOrder] [decimal](12, 2) NOT NULL,
	[Status] [nvarchar](60) NULL,
	[address_id] [int] NOT NULL,
	[PaymentMethodID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[PaymentMethodID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[PaymentType] [nvarchar](255) NOT NULL,
	[LastFourDigits] [nvarchar](4) NOT NULL,
	[CardBrand] [nvarchar](255) NOT NULL,
	[ExpiryMonth] [int] NULL,
	[ExpiryYear] [int] NULL,
	[CardholderName] [nvarchar](200) NOT NULL,
	[PaymentToken] [nvarchar](255) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[LastUsedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_PaymentMethods] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ImageURL] [nvarchar](500) NOT NULL,
	[AltText] [nvarchar](255) NULL,
	[IsPrimary] [bit] NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[BasePrice] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CategoryID] [int] NOT NULL,
	[IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariants]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariants](
	[VariantID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[SizeID] [int] NULL,
	[ColorID] [int] NULL,
	[MaterialID] [int] NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[StockQuantity] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VariantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromoCodes]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromoCodes](
	[PromoCodeId] [int] IDENTITY(1,1) NOT NULL,
	[exp_data] [datetime2](7) NULL,
	[discount] [decimal](3, 2) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PromoCodes] PRIMARY KEY CLUSTERED 
(
	[PromoCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplyOrderDetails]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplyOrderDetails](
	[SupplyOrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[SupplyOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](12, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplyOrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplyOrders]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplyOrders](
	[SupplyOrderID] [int] IDENTITY(1,1) NOT NULL,
	[SupplyDate] [datetime2](7) NOT NULL,
	[VendorID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Total] [decimal](12, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplyOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendors]    Script Date: 11/27/2025 8:41:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendors](
	[VendorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](20) NULL,
	[ApprovedAt] [datetime2](7) NULL,
	[Balance] [decimal](18, 2) NULL,
	[BankAccount] [nvarchar](60) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (1, 1, N'1 Main Street, Apt 2', N'Los Angeles', N'10100', N'USA', 0, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (2, 2, N'2 Main Street, Apt 3', N'Chicago', N'10200', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (3, 3, N'3 Main Street, Apt 4', N'Houston', N'10300', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (4, 4, N'4 Main Street, Apt 5', N'Phoenix', N'10400', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (5, 5, N'5 Main Street, Apt 6', N'Philadelphia', N'10500', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (6, 6, N'6 Main Street, Apt 7', N'San Antonio', N'10600', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (7, 7, N'7 Main Street, Apt 8', N'San Diego', N'10700', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (8, 8, N'8 Main Street, Apt 9', N'Dallas', N'10800', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (9, 9, N'9 Main Street, Apt 10', N'Austin', N'10900', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (10, 10, N'10 Main Street, Apt 11', N'New York', N'11000', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (11, 11, N'11 Main Street, Apt 12', N'Los Angeles', N'11100', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (12, 12, N'12 Main Street, Apt 13', N'Chicago', N'11200', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (13, 13, N'13 Main Street, Apt 14', N'Houston', N'11300', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (14, 14, N'14 Main Street, Apt 15', N'Phoenix', N'11400', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (15, 15, N'15 Main Street, Apt 16', N'Philadelphia', N'11500', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (16, 16, N'16 Main Street, Apt 17', N'San Antonio', N'11600', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (17, 17, N'17 Main Street, Apt 18', N'San Diego', N'11700', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (18, 18, N'18 Main Street, Apt 19', N'Dallas', N'11800', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (19, 19, N'19 Main Street, Apt 20', N'Austin', N'11900', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (20, 20, N'20 Main Street, Apt 1', N'New York', N'12000', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (21, 21, N'21 Main Street, Apt 2', N'Los Angeles', N'12100', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (22, 22, N'22 Main Street, Apt 3', N'Chicago', N'12200', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (23, 23, N'23 Main Street, Apt 4', N'Houston', N'12300', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (24, 24, N'24 Main Street, Apt 5', N'Phoenix', N'12400', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (25, 25, N'25 Main Street, Apt 6', N'Philadelphia', N'12500', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (26, 26, N'26 Main Street, Apt 7', N'San Antonio', N'12600', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (27, 27, N'27 Main Street, Apt 8', N'San Diego', N'12700', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (28, 28, N'28 Main Street, Apt 9', N'Dallas', N'12800', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (29, 29, N'29 Main Street, Apt 10', N'Austin', N'12900', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (30, 30, N'30 Main Street, Apt 11', N'New York', N'13000', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (31, 31, N'31 Main Street, Apt 12', N'Los Angeles', N'13100', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (32, 32, N'32 Main Street, Apt 13', N'Chicago', N'13200', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (33, 33, N'33 Main Street, Apt 14', N'Houston', N'13300', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (34, 34, N'34 Main Street, Apt 15', N'Phoenix', N'13400', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (35, 35, N'35 Main Street, Apt 16', N'Philadelphia', N'13500', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (36, 36, N'36 Main Street, Apt 17', N'San Antonio', N'13600', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (37, 37, N'37 Main Street, Apt 18', N'San Diego', N'13700', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (38, 38, N'38 Main Street, Apt 19', N'Dallas', N'13800', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (39, 39, N'39 Main Street, Apt 20', N'Austin', N'13900', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (40, 40, N'40 Main Street, Apt 1', N'New York', N'14000', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (41, 41, N'41 Main Street, Apt 2', N'Los Angeles', N'14100', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (42, 42, N'42 Main Street, Apt 3', N'Chicago', N'14200', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (43, 43, N'43 Main Street, Apt 4', N'Houston', N'14300', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (44, 44, N'44 Main Street, Apt 5', N'Phoenix', N'14400', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (45, 45, N'45 Main Street, Apt 6', N'Philadelphia', N'14500', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (46, 46, N'46 Main Street, Apt 7', N'San Antonio', N'14600', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (47, 47, N'47 Main Street, Apt 8', N'San Diego', N'14700', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (48, 48, N'48 Main Street, Apt 9', N'Dallas', N'14800', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (49, 49, N'49 Main Street, Apt 10', N'Austin', N'14900', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (50, 50, N'50 Main Street, Apt 11', N'New York', N'15000', N'USA', 1, CAST(N'2025-11-24T16:45:16.6033333' AS DateTime2), 0)
GO
INSERT [dbo].[Addresses] ([address_id], [ClientID], [full_description], [city], [postal_code], [country], [is_default], [created_at], [is_deleted]) VALUES (51, 1, N'57, Al Fath Street, Al Agamy, Alexandria, 21575, Egypt', N'Alexandria', N'5314126', N'Egypt', 1, CAST(N'2025-11-27T18:01:00.1448852' AS DateTime2), 0)
GO
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (1, 1)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (2, 2)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (3, 3)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (4, 4)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (5, 5)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (6, 6)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (7, 7)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (8, 8)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (9, 9)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (10, 10)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (11, 11)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (12, 12)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (13, 13)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (14, 14)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (15, 15)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (16, 16)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (17, 17)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (18, 18)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (19, 19)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (20, 20)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (21, 21)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (22, 22)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (23, 23)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (24, 24)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (25, 25)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (26, 26)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (27, 27)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (28, 28)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (29, 29)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (30, 30)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (31, 31)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (32, 32)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (33, 33)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (34, 34)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (35, 35)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (36, 36)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (37, 37)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (38, 38)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (39, 39)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (40, 40)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (41, 41)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (42, 42)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (43, 43)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (44, 44)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (45, 45)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (46, 46)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (47, 47)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (48, 48)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (49, 49)
GO
INSERT [dbo].[Carts] ([CartId], [ClientID]) VALUES (50, 50)
GO
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (1, N'Living Room', N'Sofas, coffee tables, TV stands, and living room essentials', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (2, N'Bedroom', N'Beds, nightstands, dressers, and bedroom furniture', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (3, N'Dining Room', N'Dining tables, chairs, and dining room sets', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (4, N'Office', N'Desks, office chairs, and home office furniture', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (5, N'Outdoor', N'Patio furniture, garden sets, and outdoor decor', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (6, N'Storage', N'Shelving units, cabinets, and storage solutions', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (7, N'Lighting', N'Lamps, chandeliers, and lighting fixtures', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (8, N'Decor', N'Mirrors, wall art, and decorative accessories', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (9, N'Kids', N'Children''s furniture and bedroom sets', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (10, N'Bathroom', N'Bathroom vanities, cabinets, and storage', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (11, N'Kitchen', N'Kitchen islands, bar stools, and pantry storage', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (12, N'Entryway', N'Console tables, coat racks, and entryway benches', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (13, N'Accent Furniture', N'Ottomans, poufs, and accent pieces', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (14, N'Media Storage', N'Bookcases, media consoles, and entertainment centers', 0)
GO
INSERT [dbo].[Categories] ([CategoryID], [Name], [Description], [IsDeleted]) VALUES (15, N'Seating', N'Chairs, benches, and seating options', 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (1, N'john.smith@email.com', N'hashed_password_1', N'John Smith', N'555-0101', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (2, N'emma.johnson@email.com', N'hashed_password_2', N'Emma Johnson', N'555-0102', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (3, N'michael.brown@email.com', N'hashed_password_3', N'Michael Brown', N'555-0103', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (4, N'sophia.davis@email.com', N'hashed_password_4', N'Sophia Davis', N'555-0104', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (5, N'william.miller@email.com', N'hashed_password_5', N'William Miller', N'555-0105', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (6, N'olivia.wilson@email.com', N'hashed_password_6', N'Olivia Wilson', N'555-0106', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (7, N'james.moore@email.com', N'hashed_password_7', N'James Moore', N'555-0107', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (8, N'ava.taylor@email.com', N'hashed_password_8', N'Ava Taylor', N'555-0108', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (9, N'robert.anderson@email.com', N'hashed_password_9', N'Robert Anderson', N'555-0109', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (10, N'isabella.thomas@email.com', N'hashed_password_10', N'Isabella Thomas', N'555-0110', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (11, N'david.jackson@email.com', N'hashed_password_11', N'David Jackson', N'555-0111', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (12, N'mia.white@email.com', N'hashed_password_12', N'Mia White', N'555-0112', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (13, N'joseph.harris@email.com', N'hashed_password_13', N'Joseph Harris', N'555-0113', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (14, N'charlotte.martin@email.com', N'hashed_password_14', N'Charlotte Martin', N'555-0114', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (15, N'daniel.thompson@email.com', N'hashed_password_15', N'Daniel Thompson', N'555-0115', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (16, N'amelia.garcia@email.com', N'hashed_password_16', N'Amelia Garcia', N'555-0116', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (17, N'matthew.martinez@email.com', N'hashed_password_17', N'Matthew Martinez', N'555-0117', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (18, N'harper.robinson@email.com', N'hashed_password_18', N'Harper Robinson', N'555-0118', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (19, N'christopher.clark@email.com', N'hashed_password_19', N'Christopher Clark', N'555-0119', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (20, N'evelyn.rodriguez@email.com', N'hashed_password_20', N'Evelyn Rodriguez', N'555-0120', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (21, N'andrew.lewis@email.com', N'hashed_password_21', N'Andrew Lewis', N'555-0121', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (22, N'abigail.lee@email.com', N'hashed_password_22', N'Abigail Lee', N'555-0122', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (23, N'joshua.walker@email.com', N'hashed_password_23', N'Joshua Walker', N'555-0123', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (24, N'emily.hall@email.com', N'hashed_password_24', N'Emily Hall', N'555-0124', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (25, N'ryan.allen@email.com', N'hashed_password_25', N'Ryan Allen', N'555-0125', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (26, N'elizabeth.young@email.com', N'hashed_password_26', N'Elizabeth Young', N'555-0126', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (27, N'nathan.hernandez@email.com', N'hashed_password_27', N'Nathan Hernandez', N'555-0127', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (28, N'madison.king@email.com', N'hashed_password_28', N'Madison King', N'555-0128', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (29, N'ethan.wright@email.com', N'hashed_password_29', N'Ethan Wright', N'555-0129', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (30, N'sofia.lopez@email.com', N'hashed_password_30', N'Sofia Lopez', N'555-0130', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (31, N'alexander.hill@email.com', N'hashed_password_31', N'Alexander Hill', N'555-0131', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (32, N'avery.scott@email.com', N'hashed_password_32', N'Avery Scott', N'555-0132', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (33, N'jacob.green@email.com', N'hashed_password_33', N'Jacob Green', N'555-0133', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (34, N'ella.adams@email.com', N'hashed_password_34', N'Ella Adams', N'555-0134', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (35, N'logan.baker@email.com', N'hashed_password_35', N'Logan Baker', N'555-0135', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (36, N'scarlett.gonzalez@email.com', N'hashed_password_36', N'Scarlett Gonzalez', N'555-0136', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (37, N'benjamin.nelson@email.com', N'hashed_password_37', N'Benjamin Nelson', N'555-0137', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (38, N'grace.carter@email.com', N'hashed_password_38', N'Grace Carter', N'555-0138', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (39, N'samuel.mitchell@email.com', N'hashed_password_39', N'Samuel Mitchell', N'555-0139', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (40, N'chloe.perez@email.com', N'hashed_password_40', N'Chloe Perez', N'555-0140', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (41, N'henry.roberts@email.com', N'hashed_password_41', N'Henry Roberts', N'555-0141', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (42, N'victoria.turner@email.com', N'hashed_password_42', N'Victoria Turner', N'555-0142', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (43, N'jack.phillips@email.com', N'hashed_password_43', N'Jack Phillips', N'555-0143', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (44, N'aria.campbell@email.com', N'hashed_password_44', N'Aria Campbell', N'555-0144', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (45, N'luke.parker@email.com', N'hashed_password_45', N'Luke Parker', N'555-0145', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (46, N'lily.evans@email.com', N'hashed_password_46', N'Lily Evans', N'555-0146', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (47, N'owen.edwards@email.com', N'hashed_password_47', N'Owen Edwards', N'555-0147', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (48, N'zoey.collins@email.com', N'hashed_password_48', N'Zoey Collins', N'555-0148', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (49, N'carter.stewart@email.com', N'hashed_password_49', N'Carter Stewart', N'555-0149', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
INSERT [dbo].[Clients] ([ClientID], [Email], [Password], [Name], [PhoneNumber], [CreatedAt], [IsDeleted]) VALUES (50, N'hannah.sanchez@email.com', N'hashed_password_50', N'Hannah Sanchez', N'555-0150', CAST(N'2025-11-24T16:45:16.6000000' AS DateTime2), 0)
GO
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (1, N'Black', N'#000000', 1)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (2, N'White', N'#FFFFFF', 2)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (3, N'Red', N'#FF0000', 3)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (4, N'Blue', N'#0000FF', 4)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (5, N'Green', N'#00FF00', 5)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (6, N'Navy', N'#000080', 6)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (7, N'Gray', N'#808080', 7)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (8, N'Walnut', N'#5D4037', 8)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (9, N'Oak', N'#BA8C63', 9)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (10, N'Mahogany', N'#C04000', 10)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (11, N'White Oak', N'#F5DEB3', 11)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (12, N'Espresso', N'#3C2415', 12)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (13, N'Charcoal', N'#36454F', 13)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (14, N'Cream', N'#FFFDD0', 14)
GO
INSERT [dbo].[Colors] ([ColorID], [ColorName], [HexCode], [DisplayOrder]) VALUES (15, N'Beige', N'#F5F5DC', 15)
GO
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (1, N'employee1@furni.com', N'hashed_password_1', N'Employee 1', N'Manager', 1, CAST(N'2025-11-14T16:45:16.6333333' AS DateTime2), CAST(N'2025-11-23T16:45:16.6333333' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (2, N'employee2@furni.com', N'hashed_password_2', N'Employee 2', N'Warehouse', 1, CAST(N'2025-11-04T16:45:16.6333333' AS DateTime2), CAST(N'2025-11-22T16:45:16.6333333' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (3, N'employee3@furni.com', N'hashed_password_3', N'Employee 3', N'Sales', 1, CAST(N'2025-10-25T16:45:16.6333333' AS DateTime2), CAST(N'2025-11-21T16:45:16.6333333' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (4, N'employee4@furni.com', N'hashed_password_4', N'Employee 4', N'Support', 1, CAST(N'2025-10-15T16:45:16.6333333' AS DateTime2), CAST(N'2025-11-20T16:45:16.6333333' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (5, N'employee5@furni.com', N'hashed_password_5', N'Employee 5', N'Admin', 1, CAST(N'2025-10-05T16:45:16.6333333' AS DateTime2), CAST(N'2025-11-19T16:45:16.6333333' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (6, N'employee6@furni.com', N'hashed_password_6', N'Employee 6', N'Manager', 1, CAST(N'2025-09-25T16:45:16.6333333' AS DateTime2), CAST(N'2025-11-18T16:45:16.6333333' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (7, N'employee7@furni.com', N'hashed_password_7', N'Employee 7', N'Warehouse', 1, CAST(N'2025-09-15T16:45:16.6333333' AS DateTime2), CAST(N'2025-11-24T16:45:16.6333333' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (8, N'employee8@furni.com', N'hashed_password_8', N'Employee 8', N'Sales', 1, CAST(N'2025-09-05T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-23T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (9, N'employee9@furni.com', N'hashed_password_9', N'Employee 9', N'Support', 1, CAST(N'2025-08-26T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-22T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (10, N'employee10@furni.com', N'hashed_password_10', N'Employee 10', N'Admin', 1, CAST(N'2025-08-16T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-21T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (11, N'employee11@furni.com', N'hashed_password_11', N'Employee 11', N'Manager', 1, CAST(N'2025-08-06T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-20T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (12, N'employee12@furni.com', N'hashed_password_12', N'Employee 12', N'Warehouse', 1, CAST(N'2025-07-27T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-19T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (13, N'employee13@furni.com', N'hashed_password_13', N'Employee 13', N'Sales', 1, CAST(N'2025-07-17T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-18T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (14, N'employee14@furni.com', N'hashed_password_14', N'Employee 14', N'Support', 1, CAST(N'2025-07-07T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-24T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (15, N'employee15@furni.com', N'hashed_password_15', N'Employee 15', N'Admin', 1, CAST(N'2025-06-27T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-23T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (16, N'employee16@furni.com', N'hashed_password_16', N'Employee 16', N'Manager', 1, CAST(N'2025-06-17T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-22T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (17, N'employee17@furni.com', N'hashed_password_17', N'Employee 17', N'Warehouse', 1, CAST(N'2025-06-07T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-21T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (18, N'employee18@furni.com', N'hashed_password_18', N'Employee 18', N'Sales', 1, CAST(N'2025-05-28T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-20T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (19, N'employee19@furni.com', N'hashed_password_19', N'Employee 19', N'Support', 1, CAST(N'2025-05-18T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-19T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (20, N'employee20@furni.com', N'hashed_password_20', N'Employee 20', N'Admin', 1, CAST(N'2025-05-08T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-18T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (21, N'employee21@furni.com', N'hashed_password_21', N'Employee 21', N'Manager', 1, CAST(N'2025-04-28T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-24T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (22, N'employee22@furni.com', N'hashed_password_22', N'Employee 22', N'Warehouse', 1, CAST(N'2025-04-18T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-23T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (23, N'employee23@furni.com', N'hashed_password_23', N'Employee 23', N'Sales', 1, CAST(N'2025-04-08T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-22T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (24, N'employee24@furni.com', N'hashed_password_24', N'Employee 24', N'Support', 1, CAST(N'2025-03-29T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-21T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (25, N'employee25@furni.com', N'hashed_password_25', N'Employee 25', N'Admin', 1, CAST(N'2025-03-19T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-20T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (26, N'employee26@furni.com', N'hashed_password_26', N'Employee 26', N'Manager', 1, CAST(N'2025-03-09T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-19T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (27, N'employee27@furni.com', N'hashed_password_27', N'Employee 27', N'Warehouse', 1, CAST(N'2025-02-27T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-18T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (28, N'employee28@furni.com', N'hashed_password_28', N'Employee 28', N'Sales', 1, CAST(N'2025-02-17T16:45:16.6366667' AS DateTime2), CAST(N'2025-11-24T16:45:16.6366667' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (29, N'employee29@furni.com', N'hashed_password_29', N'Employee 29', N'Support', 1, CAST(N'2025-02-07T16:45:16.6400000' AS DateTime2), CAST(N'2025-11-23T16:45:16.6400000' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (30, N'employee30@furni.com', N'hashed_password_30', N'Employee 30', N'Admin', 1, CAST(N'2025-01-28T16:45:16.6400000' AS DateTime2), CAST(N'2025-11-22T16:45:16.6400000' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (31, N'employee31@furni.com', N'hashed_password_31', N'Employee 31', N'Manager', 1, CAST(N'2025-01-18T16:45:16.6400000' AS DateTime2), CAST(N'2025-11-21T16:45:16.6400000' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (32, N'employee32@furni.com', N'hashed_password_32', N'Employee 32', N'Warehouse', 1, CAST(N'2025-01-08T16:45:16.6400000' AS DateTime2), CAST(N'2025-11-20T16:45:16.6400000' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (33, N'employee33@furni.com', N'hashed_password_33', N'Employee 33', N'Sales', 1, CAST(N'2024-12-29T16:45:16.6400000' AS DateTime2), CAST(N'2025-11-19T16:45:16.6400000' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (34, N'employee34@furni.com', N'hashed_password_34', N'Employee 34', N'Support', 1, CAST(N'2024-12-19T16:45:16.6400000' AS DateTime2), CAST(N'2025-11-18T16:45:16.6400000' AS DateTime2))
GO
INSERT [dbo].[Employees] ([EmployeeID], [Email], [Password], [Name], [Role], [IsActive], [CreatedAt], [LastLoginAt]) VALUES (35, N'employee35@furni.com', N'hashed_password_35', N'Employee 35', N'Admin', 1, CAST(N'2024-12-09T16:45:16.6400000' AS DateTime2), CAST(N'2025-11-24T16:45:16.6400000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (1, N'Cotton', 1)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (2, N'Polyester', 2)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (3, N'Cotton Blend', 3)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (4, N'Wool', 4)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (5, N'Linen', 5)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (6, N'Silk', 6)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (7, N'Leather', 7)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (8, N'Velvet', 8)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (9, N'Wood', 9)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (10, N'Metal', 10)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (11, N'Glass', 11)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (12, N'Fabric', 12)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (13, N'Solid Wood', 13)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (14, N'MDF', 14)
GO
INSERT [dbo].[Materials] ([MaterialID], [MaterialName], [DisplayOrder]) VALUES (15, N'Teak', 15)
GO
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (1, 8, 41, 1, N'Delivered', CAST(699.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (2, 50, 16, 3, N'Delivered', CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (3, 48, 23, 2, N'Delivered', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (4, 35, 22, 1, N'Pending', CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (5, 45, 34, 2, N'Shipped', CAST(179.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (6, 3, 40, 1, N'Processing', CAST(59.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (7, 17, 13, 3, N'Delivered', CAST(649.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (8, 27, 37, 1, N'Delivered', CAST(99.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (9, 7, 22, 2, N'Delivered', CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (10, 21, 7, 2, N'Delivered', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (11, 15, 12, 2, N'Shipped', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (12, 5, 7, 3, N'Pending', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (13, 8, 27, 3, N'Delivered', CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (14, 9, 38, 3, N'Shipped', CAST(49.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (15, 24, 13, 1, N'Processing', CAST(649.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (16, 12, 7, 2, N'Pending', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (17, 14, 27, 1, N'Delivered', CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (18, 27, 44, 2, N'Delivered', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (19, 30, 6, 2, N'Delivered', CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (20, 8, 45, 1, N'Delivered', CAST(89.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (21, 43, 26, 3, N'Processing', CAST(199.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (22, 45, 28, 1, N'Shipped', CAST(79.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (23, 16, 23, 3, N'Delivered', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (24, 14, 22, 2, N'Delivered', CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (25, 27, 29, 3, N'Delivered', CAST(229.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (26, 34, 15, 2, N'Processing', CAST(199.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (27, 28, 25, 1, N'Delivered', CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (28, 12, 26, 1, N'Pending', CAST(199.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (29, 23, 9, 2, N'Delivered', CAST(329.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (30, 49, 23, 1, N'Pending', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (31, 18, 14, 2, N'Delivered', CAST(299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (32, 22, 18, 2, N'Shipped', CAST(699.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (33, 23, 49, 3, N'Delivered', CAST(59.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (34, 48, 42, 1, N'Delivered', CAST(399.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (35, 25, 39, 1, N'Delivered', CAST(299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (36, 29, 20, 3, N'Delivered', CAST(329.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (37, 36, 13, 2, N'Shipped', CAST(649.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (38, 29, 2, 3, N'Delivered', CAST(599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (39, 14, 12, 2, N'Delivered', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (40, 13, 48, 1, N'Delivered', CAST(79.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (41, 26, 1, 2, N'Delivered', CAST(1299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (42, 13, 46, 3, N'Delivered', CAST(549.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (43, 33, 44, 2, N'Delivered', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (44, 26, 23, 1, N'Delivered', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (45, 34, 37, 3, N'Processing', CAST(99.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (46, 1, 17, 2, N'Delivered', CAST(399.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (47, 21, 14, 3, N'Delivered', CAST(299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (48, 3, 9, 1, N'Processing', CAST(329.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (49, 9, 5, 2, N'Shipped', CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (50, 32, 33, 2, N'Pending', CAST(89.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (51, 36, 1, 1, N'Shipped', CAST(1299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (52, 28, 1, 3, N'Delivered', CAST(1299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (53, 26, 42, 2, N'Delivered', CAST(399.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (54, 27, 47, 2, N'Delivered', CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (55, 11, 27, 3, N'Delivered', CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (56, 14, 11, 2, N'Delivered', CAST(799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (57, 37, 31, 2, N'Pending', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (58, 7, 25, 2, N'Delivered', CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (59, 45, 22, 2, N'Shipped', CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (60, 30, 23, 2, N'Delivered', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (61, 25, 50, 1, N'Delivered', CAST(119.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (62, 16, 6, 1, N'Delivered', CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (63, 32, 29, 2, N'Pending', CAST(229.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (64, 4, 33, 2, N'Delivered', CAST(89.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (65, 11, 41, 3, N'Delivered', CAST(699.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (66, 7, 10, 3, N'Delivered', CAST(799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (67, 42, 10, 1, N'Pending', CAST(799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (68, 19, 31, 1, N'Shipped', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (69, 33, 49, 1, N'Delivered', CAST(59.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (70, 3, 17, 2, N'Processing', CAST(399.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (71, 30, 19, 3, N'Delivered', CAST(179.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (72, 11, 25, 1, N'Delivered', CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (73, 17, 17, 2, N'Delivered', CAST(399.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (74, 39, 20, 3, N'Delivered', CAST(329.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (75, 41, 5, 2, N'Delivered', CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (76, 13, 33, 1, N'Delivered', CAST(89.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (77, 40, 15, 2, N'Delivered', CAST(199.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (78, 17, 48, 3, N'Delivered', CAST(79.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (79, 27, 42, 3, N'Delivered', CAST(399.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (80, 3, 38, 3, N'Processing', CAST(49.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (81, 20, 11, 1, N'Delivered', CAST(799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (82, 16, 9, 3, N'Delivered', CAST(329.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (83, 49, 40, 1, N'Pending', CAST(59.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (84, 24, 19, 3, N'Processing', CAST(179.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (85, 9, 41, 2, N'Shipped', CAST(699.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (86, 5, 34, 1, N'Pending', CAST(179.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (87, 11, 46, 2, N'Delivered', CAST(549.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (88, 7, 42, 1, N'Delivered', CAST(399.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (89, 40, 14, 2, N'Delivered', CAST(299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (90, 22, 6, 3, N'Shipped', CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (91, 2, 36, 2, N'Delivered', CAST(159.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (92, 26, 48, 1, N'Delivered', CAST(79.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (93, 25, 36, 2, N'Delivered', CAST(159.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (94, 30, 28, 2, N'Delivered', CAST(79.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (95, 47, 44, 2, N'Shipped', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (96, 37, 47, 2, N'Pending', CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (97, 35, 44, 2, N'Pending', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (98, 21, 12, 1, N'Delivered', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (99, 6, 6, 1, N'Delivered', CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (100, 20, 24, 1, N'Delivered', CAST(189.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (101, 5, 44, 2, N'Pending', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (102, 1, 43, 2, N'Delivered', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (103, 18, 29, 3, N'Delivered', CAST(229.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (104, 44, 2, 2, N'Delivered', CAST(599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (105, 35, 35, 2, N'Pending', CAST(139.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (106, 30, 21, 2, N'Delivered', CAST(1099.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (107, 29, 31, 3, N'Delivered', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (108, 22, 27, 2, N'Shipped', CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (109, 24, 40, 1, N'Processing', CAST(59.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (110, 42, 42, 1, N'Pending', CAST(399.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (111, 47, 28, 2, N'Shipped', CAST(79.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (112, 10, 12, 2, N'Delivered', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (113, 22, 16, 2, N'Shipped', CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (114, 33, 18, 2, N'Delivered', CAST(699.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (115, 31, 35, 3, N'Delivered', CAST(139.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (116, 5, 9, 3, N'Pending', CAST(329.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (117, 49, 11, 1, N'Pending', CAST(799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (118, 12, 23, 2, N'Pending', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (119, 6, 1, 1, N'Delivered', CAST(1299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (120, 32, 42, 1, N'Pending', CAST(399.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (121, 3, 48, 1, N'Processing', CAST(79.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (122, 46, 34, 2, N'Shipped', CAST(179.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (123, 15, 39, 3, N'Shipped', CAST(299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (124, 29, 49, 3, N'Delivered', CAST(59.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (125, 17, 45, 1, N'Delivered', CAST(89.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (126, 28, 23, 1, N'Delivered', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (127, 20, 3, 3, N'Delivered', CAST(349.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (128, 25, 34, 1, N'Delivered', CAST(179.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (129, 39, 47, 3, N'Delivered', CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (130, 18, 49, 3, N'Delivered', CAST(59.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (131, 23, 10, 2, N'Delivered', CAST(799.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (132, 34, 8, 1, N'Processing', CAST(549.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (133, 11, 16, 3, N'Delivered', CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (134, 40, 47, 2, N'Delivered', CAST(149.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (135, 44, 5, 2, N'Delivered', CAST(449.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (136, 17, 12, 2, N'Delivered', CAST(129.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (137, 2, 14, 1, N'Delivered', CAST(299.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (138, 25, 23, 2, N'Delivered', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (139, 50, 37, 1, N'Delivered', CAST(99.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (140, 30, 46, 1, N'Delivered', CAST(549.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (141, 12, 21, 3, N'Pending', CAST(1099.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (142, 24, 24, 2, N'Processing', CAST(189.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (143, 16, 45, 3, N'Delivered', CAST(89.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (144, 17, 35, 1, N'Delivered', CAST(139.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (145, 1, 46, 3, N'Delivered', CAST(549.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (146, 29, 41, 3, N'Delivered', CAST(699.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (147, 48, 32, 3, N'Delivered', CAST(499.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (148, 12, 6, 1, N'Pending', CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (149, 45, 17, 1, N'Shipped', CAST(399.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (150, 49, 43, 2, N'Pending', CAST(249.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (151, 51, 2, 2, N'Pending', CAST(306.56 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (152, 51, 217, 3, N'Pending', CAST(599.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (153, 51, 6, 3, N'Pending', CAST(426.44 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (154, 52, 7, 3, N'Pending', CAST(423.62 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (155, 52, 27, 3, N'Pending', CAST(642.22 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (156, 52, 218, 5, N'Pending', CAST(899.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (157, 53, 18, 2, N'Pending', CAST(227.03 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (158, 53, 6, 2, N'Pending', CAST(426.44 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailsID], [OrderID], [VariantID], [Quantity], [Status], [UnitPrice]) VALUES (159, 54, 6, 1, N'Pending', CAST(426.44 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (1, CAST(N'2025-08-17T16:45:16.6600000' AS DateTime2), 35, CAST(2949.93 AS Decimal(12, 2)), N'Delivered', 35, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (2, CAST(N'2025-08-13T16:45:16.6600000' AS DateTime2), 7, CAST(619.97 AS Decimal(12, 2)), N'Delivered', 7, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (3, CAST(N'2025-10-27T16:45:16.6600000' AS DateTime2), 38, CAST(1419.92 AS Decimal(12, 2)), N'Processing', 38, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (4, CAST(N'2025-11-17T16:45:16.6600000' AS DateTime2), 48, CAST(179.98 AS Decimal(12, 2)), N'Delivered', 48, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (5, CAST(N'2025-11-10T16:45:16.6600000' AS DateTime2), 36, CAST(2179.91 AS Decimal(12, 2)), N'Pending', 36, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (6, CAST(N'2025-08-20T16:45:16.6600000' AS DateTime2), 46, CAST(2199.98 AS Decimal(12, 2)), N'Delivered', 46, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (7, CAST(N'2025-08-27T16:45:16.6600000' AS DateTime2), 11, CAST(3999.92 AS Decimal(12, 2)), N'Delivered', 11, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (8, CAST(N'2025-09-07T16:45:16.6600000' AS DateTime2), 33, CAST(1239.95 AS Decimal(12, 2)), N'Delivered', 33, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (9, CAST(N'2025-10-07T16:45:16.6600000' AS DateTime2), 1, CAST(2449.93 AS Decimal(12, 2)), N'Shipped', 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (10, CAST(N'2025-08-16T16:45:16.6600000' AS DateTime2), 27, CAST(259.98 AS Decimal(12, 2)), N'Delivered', 27, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (11, CAST(N'2025-10-04T16:45:16.6600000' AS DateTime2), 8, CAST(6499.88 AS Decimal(12, 2)), N'Delivered', 8, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (12, CAST(N'2025-11-11T16:45:16.6600000' AS DateTime2), 32, CAST(5399.91 AS Decimal(12, 2)), N'Pending', 32, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (13, CAST(N'2025-10-06T16:45:16.6600000' AS DateTime2), 17, CAST(1819.95 AS Decimal(12, 2)), N'Delivered', 17, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (14, CAST(N'2025-11-08T16:45:16.6600000' AS DateTime2), 39, CAST(2909.93 AS Decimal(12, 2)), N'Delivered', 39, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (15, CAST(N'2025-10-04T16:45:16.6600000' AS DateTime2), 31, CAST(1159.95 AS Decimal(12, 2)), N'Shipped', 31, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (16, CAST(N'2025-11-06T16:45:16.6600000' AS DateTime2), 21, CAST(2909.90 AS Decimal(12, 2)), N'Delivered', 21, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (17, CAST(N'2025-10-16T16:45:16.6600000' AS DateTime2), 26, CAST(3479.88 AS Decimal(12, 2)), N'Delivered', 26, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (18, CAST(N'2025-10-05T16:45:16.6600000' AS DateTime2), 45, CAST(1469.92 AS Decimal(12, 2)), N'Delivered', 45, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (19, CAST(N'2025-07-31T16:45:16.6600000' AS DateTime2), 49, CAST(129.99 AS Decimal(12, 2)), N'Shipped', 49, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (20, CAST(N'2025-09-16T16:45:16.6600000' AS DateTime2), 18, CAST(2039.95 AS Decimal(12, 2)), N'Delivered', 18, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (21, CAST(N'2025-08-27T16:45:16.6600000' AS DateTime2), 24, CAST(1529.94 AS Decimal(12, 2)), N'Delivered', 24, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (22, CAST(N'2025-10-19T16:45:16.6600000' AS DateTime2), 4, CAST(6199.91 AS Decimal(12, 2)), N'Shipped', 4, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (23, CAST(N'2025-10-01T16:45:16.6600000' AS DateTime2), 5, CAST(2439.93 AS Decimal(12, 2)), N'Delivered', 5, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (24, CAST(N'2025-08-21T16:45:16.6600000' AS DateTime2), 19, CAST(1629.93 AS Decimal(12, 2)), N'Processing', 19, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (25, CAST(N'2025-09-06T16:45:16.6600000' AS DateTime2), 15, CAST(1419.93 AS Decimal(12, 2)), N'Delivered', 15, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (26, CAST(N'2025-10-08T16:45:16.6600000' AS DateTime2), 40, CAST(3729.94 AS Decimal(12, 2)), N'Delivered', 40, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (27, CAST(N'2025-10-23T16:45:16.6600000' AS DateTime2), 14, CAST(2549.89 AS Decimal(12, 2)), N'Delivered', 14, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (28, CAST(N'2025-07-29T16:45:16.6600000' AS DateTime2), 3, CAST(4299.95 AS Decimal(12, 2)), N'Delivered', 3, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (29, CAST(N'2025-09-28T16:45:16.6600000' AS DateTime2), 29, CAST(5459.85 AS Decimal(12, 2)), N'Delivered', 29, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (30, CAST(N'2025-09-09T16:45:16.6600000' AS DateTime2), 30, CAST(5749.88 AS Decimal(12, 2)), N'Delivered', 30, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (31, CAST(N'2025-10-02T16:45:16.6600000' AS DateTime2), 50, CAST(419.97 AS Decimal(12, 2)), N'Delivered', 50, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (32, CAST(N'2025-11-18T16:45:16.6600000' AS DateTime2), 20, CAST(1039.95 AS Decimal(12, 2)), N'Pending', 20, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (33, CAST(N'2025-09-12T16:45:16.6600000' AS DateTime2), 42, CAST(1719.95 AS Decimal(12, 2)), N'Delivered', 42, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (34, CAST(N'2025-11-03T16:45:16.6600000' AS DateTime2), 16, CAST(1249.94 AS Decimal(12, 2)), N'Processing', 16, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (35, CAST(N'2025-09-21T16:45:16.6600000' AS DateTime2), 9, CAST(989.95 AS Decimal(12, 2)), N'Pending', 9, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (36, CAST(N'2025-08-17T16:45:16.6600000' AS DateTime2), 28, CAST(2599.97 AS Decimal(12, 2)), N'Shipped', 28, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (37, CAST(N'2025-11-12T16:45:16.6600000' AS DateTime2), 43, CAST(559.96 AS Decimal(12, 2)), N'Pending', 43, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (38, CAST(N'2025-11-05T16:45:16.6600000' AS DateTime2), 34, CAST(0.00 AS Decimal(12, 2)), N'Delivered', 34, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (39, CAST(N'2025-08-01T16:45:16.6600000' AS DateTime2), 23, CAST(1439.94 AS Decimal(12, 2)), N'Delivered', 23, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (40, CAST(N'2025-11-18T16:45:16.6600000' AS DateTime2), 22, CAST(1299.94 AS Decimal(12, 2)), N'Delivered', 22, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (41, CAST(N'2025-08-05T16:45:16.6600000' AS DateTime2), 10, CAST(899.98 AS Decimal(12, 2)), N'Delivered', 10, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (42, CAST(N'2025-11-09T16:45:16.6600000' AS DateTime2), 25, CAST(1199.98 AS Decimal(12, 2)), N'Pending', 25, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (43, CAST(N'2025-10-29T16:45:16.6600000' AS DateTime2), 44, CAST(599.97 AS Decimal(12, 2)), N'Processing', 44, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (44, CAST(N'2025-09-28T16:45:16.6600000' AS DateTime2), 37, CAST(2099.96 AS Decimal(12, 2)), N'Delivered', 37, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (45, CAST(N'2025-11-11T16:45:16.6600000' AS DateTime2), 2, CAST(1739.94 AS Decimal(12, 2)), N'Shipped', 2, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (46, CAST(N'2025-11-10T16:45:16.6600000' AS DateTime2), 13, CAST(359.98 AS Decimal(12, 2)), N'Shipped', 13, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (47, CAST(N'2025-10-01T16:45:16.6600000' AS DateTime2), 41, CAST(419.96 AS Decimal(12, 2)), N'Shipped', 41, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (48, CAST(N'2025-11-02T16:45:16.6600000' AS DateTime2), 6, CAST(2399.94 AS Decimal(12, 2)), N'Delivered', 6, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (49, CAST(N'2025-10-18T16:45:16.6600000' AS DateTime2), 47, CAST(1609.95 AS Decimal(12, 2)), N'Pending', 47, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (50, CAST(N'2025-08-05T16:45:16.6600000' AS DateTime2), 12, CAST(2799.96 AS Decimal(12, 2)), N'Delivered', 12, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (51, CAST(N'2025-11-27T17:35:25.9354984' AS DateTime2), 1, CAST(3692.41 AS Decimal(12, 2)), N'Confirmed', 1, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (52, CAST(N'2025-11-27T17:51:43.0229611' AS DateTime2), 1, CAST(7697.47 AS Decimal(12, 2)), N'Confirmed', 1, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (53, CAST(N'2025-11-27T17:59:50.7850304' AS DateTime2), 1, CAST(1306.94 AS Decimal(12, 2)), N'Confirmed', 1, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [ClientID], [TotalOrder], [Status], [address_id], [PaymentMethodID]) VALUES (54, CAST(N'2025-11-27T18:01:00.1806856' AS DateTime2), 1, CAST(426.44 AS Decimal(12, 2)), N'Confirmed', 51, 1)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 
GO
INSERT [dbo].[PaymentMethods] ([PaymentMethodID], [ClientID], [PaymentType], [LastFourDigits], [CardBrand], [ExpiryMonth], [ExpiryYear], [CardholderName], [PaymentToken], [IsDefault], [IsActive], [CreatedDate], [LastUsedDate]) VALUES (1, 1, N'CreditCard', N'4242', N'visa', 12, 2026, N'Mahmoud Hany', N'pm_1SY96GKGgQvOSjidvuLfFaFQ', 0, 1, CAST(N'2025-11-27T17:35:25.7036703' AS DateTime2), CAST(N'2025-11-27T18:01:01.2002312' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (1, 1, N'product-1.png', N'Modern L-Shape Sofa Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (2, 2, N'product-2.png', N'Classic Leather Armchair Main Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (3, 3, N'product-3.png', N'Industrial Coffee Table Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (4, 4, N'product-4.png', N'Mid-Century TV Stand Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (5, 5, N'product-5.png', N'Velvet Accent Chair Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (6, 6, N'product-6.png', N'King Size Platform Bed Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (7, 7, N'product-7.png', N'Solid Oak Nightstand Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (8, 8, N'product-5.png', N'6-Drawer Dresser Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (9, 9, N'product-3.png', N'Tufted Velvet Headboard Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (10, 10, N'product-1.png', N'Queen Storage Bed Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (11, 11, N'product-4.png', N'Extendable Dining Table Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (12, 12, N'product-7.png', N'Upholstered Dining Chair Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (13, 13, N'product-2.png', N'Glass Top Dining Table Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (14, 14, N'product-1.png', N'Farmhouse Dining Bench Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (15, 15, N'product-6.png', N'Bar Stool Set Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (16, 16, N'product-5.png', N'Executive Office Desk Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (17, 17, N'product-3.png', N'Ergonomic Office Chair Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (18, 18, N'product-1.png', N'Adjustable Standing Desk Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (19, 19, N'product-7.png', N'Rolling File Cabinet Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (20, 20, N'product-2.png', N'Bookcase with Doors Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (21, 21, N'product-7.png', N'Outdoor Patio Set Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (22, 22, N'product-6.png', N'Wicker Lounge Chair Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (23, 23, N'product-5.png', N'Garden Bench Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (24, 24, N'product-24-main.jpg', N'Patio Umbrella Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (25, 25, N'product-1.jpg', N'Outdoor Storage Box Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (26, 26, N'product-26-main.jpg', N'5-Tier Bookshelf Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (27, 27, N'product-27-main.jpg', N'Storage Ottoman Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (28, 28, N'product-6.png', N'Floating Wall Shelves Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (29, 29, N'product-29-main.jpg', N'Entryway Shoe Cabinet Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (30, 30, N'product-30-main.jpg', N'Modular Cube Storage Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (31, 31, N'product-31-main.jpg', N'Modern Floor Lamp Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (32, 32, N'product-32-main.jpg', N'Crystal Chandelier Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (33, 33, N'product-33-main.jpg', N'Table Lamp Set Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (34, 34, N'product-34-main.jpg', N'Track Lighting Kit Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (35, 35, N'product-35-main.jpg', N'Pendant Light Fixture Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (36, 36, N'product-36-main.jpg', N'Full-Length Mirror Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (37, 37, N'product-37-main.jpg', N'Wall Art Canvas Set Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (38, 38, N'product-38-main.jpg', N'Decorative Vase Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (39, 39, N'product-39-main.jpg', N'Area Rug 8x10 Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (40, 40, N'product-40-main.jpg', N'Throw Pillow Set Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (41, 41, N'product-41-main.jpg', N'Kids Bunk Bed Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (42, 42, N'product-42-main.jpg', N'Toddler Storage Bed Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (43, 43, N'product-43-main.jpg', N'Children Study Desk Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (44, 44, N'product-44-main.jpg', N'Toy Storage Organizer Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (45, 45, N'product-45-main.jpg', N'Kids Bookshelf Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (46, 46, N'product-46-main.jpg', N'Bathroom Vanity Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (47, 47, N'product-47-main.jpg', N'Medicine Cabinet Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (48, 48, N'product-48-main.jpg', N'Bathroom Storage Cart Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (49, 49, N'product-49-main.jpg', N'Towel Rack Set Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (50, 50, N'product-50-main.jpg', N'Over-Toilet Storage Main Image', 1)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (51, 1, N'product-1.png', N'Modern L-Shape Sofa Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (52, 2, N'product-5.png', N'Classic Leather Armchair Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (53, 3, N'product-1.png', N'Industrial Coffee Table Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (54, 4, N'product-4-detail.jpg', N'Mid-Century TV Stand Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (55, 5, N'product-5-detail.jpg', N'Velvet Accent Chair Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (56, 6, N'product-6-detail.jpg', N'King Size Platform Bed Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (57, 7, N'product-7-detail.jpg', N'Solid Oak Nightstand Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (58, 8, N'product-8-detail.jpg', N'6-Drawer Dresser Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (59, 9, N'product-9-detail.jpg', N'Tufted Velvet Headboard Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (60, 10, N'product-10-detail.jpg', N'Queen Storage Bed Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (61, 11, N'product-11-detail.jpg', N'Extendable Dining Table Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (62, 12, N'product-12-detail.jpg', N'Upholstered Dining Chair Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (63, 13, N'product-13-detail.jpg', N'Glass Top Dining Table Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (64, 14, N'product-14-detail.jpg', N'Farmhouse Dining Bench Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (65, 15, N'product-15-detail.jpg', N'Bar Stool Set Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (66, 16, N'product-16-detail.jpg', N'Executive Office Desk Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (67, 17, N'product-17-detail.jpg', N'Ergonomic Office Chair Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (68, 18, N'product-18-detail.jpg', N'Adjustable Standing Desk Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (69, 19, N'product-19-detail.jpg', N'Rolling File Cabinet Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (70, 20, N'product-20-detail.jpg', N'Bookcase with Doors Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (71, 21, N'product-21-detail.jpg', N'Outdoor Patio Set Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (72, 22, N'product-22-detail.jpg', N'Wicker Lounge Chair Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (73, 23, N'product-23-detail.jpg', N'Garden Bench Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (74, 24, N'product-24-detail.jpg', N'Patio Umbrella Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (75, 25, N'product-25-detail.jpg', N'Outdoor Storage Box Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (76, 26, N'product-26-detail.jpg', N'5-Tier Bookshelf Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (77, 27, N'product-27-detail.jpg', N'Storage Ottoman Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (78, 28, N'product-28-detail.jpg', N'Floating Wall Shelves Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (79, 29, N'product-29-detail.jpg', N'Entryway Shoe Cabinet Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (80, 30, N'product-30-detail.jpg', N'Modular Cube Storage Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (81, 31, N'product-31-detail.jpg', N'Modern Floor Lamp Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (82, 32, N'product-32-detail.jpg', N'Crystal Chandelier Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (83, 33, N'product-33-detail.jpg', N'Table Lamp Set Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (84, 34, N'product-34-detail.jpg', N'Track Lighting Kit Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (85, 35, N'product-35-detail.jpg', N'Pendant Light Fixture Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (86, 36, N'product-36-detail.jpg', N'Full-Length Mirror Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (87, 37, N'product-37-detail.jpg', N'Wall Art Canvas Set Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (88, 38, N'product-38-detail.jpg', N'Decorative Vase Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (89, 39, N'product-39-detail.jpg', N'Area Rug 8x10 Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (90, 40, N'product-40-detail.jpg', N'Throw Pillow Set Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (91, 41, N'product-41-detail.jpg', N'Kids Bunk Bed Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (92, 42, N'product-42-detail.jpg', N'Toddler Storage Bed Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (93, 43, N'product-43-detail.jpg', N'Children Study Desk Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (94, 44, N'product-44-detail.jpg', N'Toy Storage Organizer Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (95, 45, N'product-45-detail.jpg', N'Kids Bookshelf Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (96, 46, N'product-46-detail.jpg', N'Bathroom Vanity Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (97, 47, N'product-47-detail.jpg', N'Medicine Cabinet Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (98, 48, N'product-48-detail.jpg', N'Bathroom Storage Cart Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (99, 49, N'product-49-detail.jpg', N'Towel Rack Set Detail Image', 0)
GO
INSERT [dbo].[ProductImages] ([ImageID], [ProductID], [ImageURL], [AltText], [IsPrimary]) VALUES (100, 50, N'product-50-detail.jpg', N'Over-Toilet Storage Detail Image', 0)
GO
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (1, N'Modern L-Shape Sofa', CAST(1299.99 AS Decimal(18, 2)), N'Spacious L-shaped sectional with premium fabric', 1, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (2, N'Classic Leather Armchair', CAST(599.99 AS Decimal(18, 2)), N'Genuine leather armchair with tufted back', 1, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (3, N'Industrial Coffee Table', CAST(349.99 AS Decimal(18, 2)), N'Solid wood coffee table with metal frame', 1, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (4, N'Mid-Century TV Stand', CAST(479.99 AS Decimal(18, 2)), N'Walnut finish TV console with storage', 1, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (5, N'Velvet Accent Chair', CAST(449.99 AS Decimal(18, 2)), N'Luxurious velvet chair with gold legs', 1, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (6, N'King Size Platform Bed', CAST(899.99 AS Decimal(18, 2)), N'Modern platform bed with upholstered headboard', 2, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (7, N'Solid Oak Nightstand', CAST(249.99 AS Decimal(18, 2)), N'Two-drawer nightstand with USB ports', 2, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (8, N'6-Drawer Dresser', CAST(549.99 AS Decimal(18, 2)), N'Spacious dresser with soft-close drawers', 2, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (9, N'Tufted Velvet Headboard', CAST(329.99 AS Decimal(18, 2)), N'Luxurious velvet upholstered headboard', 2, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (10, N'Queen Storage Bed', CAST(799.99 AS Decimal(18, 2)), N'Bed frame with built-in storage drawers', 2, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (11, N'Extendable Dining Table', CAST(799.99 AS Decimal(18, 2)), N'Seats 6-8 people, extends to 96 inches', 3, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (12, N'Upholstered Dining Chair', CAST(129.99 AS Decimal(18, 2)), N'Padded dining chair with wooden legs', 3, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (13, N'Glass Top Dining Table', CAST(649.99 AS Decimal(18, 2)), N'Tempered glass top with chrome base', 3, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (14, N'Farmhouse Dining Bench', CAST(299.99 AS Decimal(18, 2)), N'Rustic solid wood bench', 3, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (15, N'Bar Stool Set', CAST(199.99 AS Decimal(18, 2)), N'Set of 2 adjustable height bar stools', 3, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (16, N'Executive Office Desk', CAST(899.99 AS Decimal(18, 2)), N'L-shaped desk with built-in storage', 4, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (17, N'Ergonomic Office Chair', CAST(399.99 AS Decimal(18, 2)), N'Mesh back chair with lumbar support', 4, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (18, N'Adjustable Standing Desk', CAST(699.99 AS Decimal(18, 2)), N'Electric height-adjustable desk', 4, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (19, N'Rolling File Cabinet', CAST(179.99 AS Decimal(18, 2)), N'Three-drawer mobile cabinet with locks', 4, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (20, N'Bookcase with Doors', CAST(329.99 AS Decimal(18, 2)), N'Five-shelf bookcase with glass doors', 4, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (21, N'Outdoor Patio Set', CAST(1099.99 AS Decimal(18, 2)), N'Weather-resistant 5-piece dining set', 5, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (22, N'Wicker Lounge Chair', CAST(449.99 AS Decimal(18, 2)), N'Comfortable outdoor lounger with cushions', 5, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (23, N'Garden Bench', CAST(249.99 AS Decimal(18, 2)), N'Teak wood outdoor bench', 5, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (24, N'Patio Umbrella', CAST(189.99 AS Decimal(18, 2)), N'9ft cantilever patio umbrella', 5, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (25, N'Outdoor Storage Box', CAST(149.99 AS Decimal(18, 2)), N'Waterproof deck storage container', 5, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (26, N'5-Tier Bookshelf', CAST(199.99 AS Decimal(18, 2)), N'Open concept ladder-style bookcase', 6, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (27, N'Storage Ottoman', CAST(149.99 AS Decimal(18, 2)), N'Multi-functional storage ottoman', 6, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (28, N'Floating Wall Shelves', CAST(79.99 AS Decimal(18, 2)), N'Set of 3 decorative wall shelves', 6, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (29, N'Entryway Shoe Cabinet', CAST(229.99 AS Decimal(18, 2)), N'Slim shoe storage with flip-down doors', 6, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (30, N'Modular Cube Storage', CAST(159.99 AS Decimal(18, 2)), N'9-cube organizer with fabric bins', 6, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (31, N'Modern Floor Lamp', CAST(129.99 AS Decimal(18, 2)), N'Adjustable arc floor lamp with LED', 7, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (32, N'Crystal Chandelier', CAST(499.99 AS Decimal(18, 2)), N'Elegant chandelier with 8 lights', 7, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (33, N'Table Lamp Set', CAST(89.99 AS Decimal(18, 2)), N'Set of 2 matching bedside lamps', 7, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (34, N'Track Lighting Kit', CAST(179.99 AS Decimal(18, 2)), N'Adjustable LED track lighting', 7, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (35, N'Pendant Light Fixture', CAST(139.99 AS Decimal(18, 2)), N'Industrial-style hanging pendant', 7, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (36, N'Full-Length Mirror', CAST(159.99 AS Decimal(18, 2)), N'Freestanding floor mirror with frame', 8, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (37, N'Wall Art Canvas Set', CAST(99.99 AS Decimal(18, 2)), N'Set of 3 abstract canvas prints', 8, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (38, N'Decorative Vase', CAST(49.99 AS Decimal(18, 2)), N'Ceramic vase with geometric pattern', 8, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (39, N'Area Rug 8x10', CAST(299.99 AS Decimal(18, 2)), N'Soft plush area rug, multiple colors', 8, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (40, N'Throw Pillow Set', CAST(59.99 AS Decimal(18, 2)), N'Set of 4 decorative throw pillows', 8, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (41, N'Kids Bunk Bed', CAST(699.99 AS Decimal(18, 2)), N'Twin-over-full bunk bed with ladder', 9, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (42, N'Toddler Storage Bed', CAST(399.99 AS Decimal(18, 2)), N'Low-profile bed with underbed drawers', 9, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (43, N'Children Study Desk', CAST(249.99 AS Decimal(18, 2)), N'Adjustable height kids desk and chair', 9, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (44, N'Toy Storage Organizer', CAST(129.99 AS Decimal(18, 2)), N'Multi-bin toy storage unit', 9, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (45, N'Kids Bookshelf', CAST(89.99 AS Decimal(18, 2)), N'Colorful bookcase for children', 9, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (46, N'Bathroom Vanity', CAST(549.99 AS Decimal(18, 2)), N'36-inch vanity with marble countertop', 10, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (47, N'Medicine Cabinet', CAST(149.99 AS Decimal(18, 2)), N'Mirrored wall-mounted medicine cabinet', 10, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (48, N'Bathroom Storage Cart', CAST(79.99 AS Decimal(18, 2)), N'Rolling storage cart with shelves', 10, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (49, N'Towel Rack Set', CAST(59.99 AS Decimal(18, 2)), N'Wall-mounted towel bar set', 10, 0)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [BasePrice], [Description], [CategoryID], [IsDeleted]) VALUES (50, N'Over-Toilet Storage', CAST(119.99 AS Decimal(18, 2)), N'Space-saving bathroom organizer', 10, 0)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductVariants] ON 
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (1, 3, 8, 4, 5, CAST(482.74 AS Decimal(10, 2)), 41, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (2, 3, 9, 9, 4, CAST(306.56 AS Decimal(10, 2)), 52, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (3, 3, 2, 11, 9, CAST(465.54 AS Decimal(10, 2)), 14, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (4, 3, 12, 4, 10, CAST(344.21 AS Decimal(10, 2)), 51, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (5, 3, 13, 8, 13, CAST(473.42 AS Decimal(10, 2)), 11, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (6, 3, 4, 8, 2, CAST(426.44 AS Decimal(10, 2)), 1, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (7, 3, 2, 9, 8, CAST(423.62 AS Decimal(10, 2)), 33, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (8, 4, 13, 11, 14, CAST(605.22 AS Decimal(10, 2)), 8, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (9, 4, 5, 13, 1, CAST(466.42 AS Decimal(10, 2)), 30, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (10, 4, 1, 11, 10, CAST(552.51 AS Decimal(10, 2)), 53, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (11, 5, 4, 2, 8, CAST(557.08 AS Decimal(10, 2)), 6, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (12, 5, 3, 8, 4, CAST(574.03 AS Decimal(10, 2)), 51, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (13, 5, 10, 13, 1, CAST(564.18 AS Decimal(10, 2)), 7, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (14, 5, 6, 1, 3, CAST(410.17 AS Decimal(10, 2)), 5, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (15, 5, 8, 6, 10, CAST(478.50 AS Decimal(10, 2)), 41, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (16, 5, 1, 4, 9, CAST(570.18 AS Decimal(10, 2)), 28, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (17, 7, 13, 11, 5, CAST(367.61 AS Decimal(10, 2)), 8, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (18, 7, 10, 6, 13, CAST(227.03 AS Decimal(10, 2)), 34, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (19, 7, 1, 6, 12, CAST(235.75 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (20, 7, 12, 7, 14, CAST(220.92 AS Decimal(10, 2)), 37, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (21, 7, 11, 15, 4, CAST(221.88 AS Decimal(10, 2)), 6, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (22, 7, 5, 10, 12, CAST(270.58 AS Decimal(10, 2)), 11, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (23, 7, 11, 2, 11, CAST(347.15 AS Decimal(10, 2)), 34, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (24, 8, 8, 9, 4, CAST(601.76 AS Decimal(10, 2)), 6, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (25, 8, 9, 10, 15, CAST(531.64 AS Decimal(10, 2)), 9, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (26, 8, 11, 15, 15, CAST(622.40 AS Decimal(10, 2)), 52, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (27, 8, 1, 9, 5, CAST(642.22 AS Decimal(10, 2)), 16, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (28, 8, 1, 9, 12, CAST(558.76 AS Decimal(10, 2)), 28, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (29, 9, 10, 13, 7, CAST(299.30 AS Decimal(10, 2)), 15, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (30, 9, 6, 13, 6, CAST(468.37 AS Decimal(10, 2)), 28, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (31, 9, 12, 3, 9, CAST(362.84 AS Decimal(10, 2)), 31, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (32, 9, 12, 1, 15, CAST(378.17 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (33, 9, 1, 3, 15, CAST(352.73 AS Decimal(10, 2)), 38, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (34, 9, 12, 6, 15, CAST(349.09 AS Decimal(10, 2)), 30, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (35, 10, 12, 13, 12, CAST(893.93 AS Decimal(10, 2)), 17, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (36, 10, 9, 14, 6, CAST(829.50 AS Decimal(10, 2)), 5, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (37, 10, 7, 5, 15, CAST(934.42 AS Decimal(10, 2)), 17, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (38, 10, 2, 12, 15, CAST(753.92 AS Decimal(10, 2)), 32, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (39, 10, 10, 13, 4, CAST(844.41 AS Decimal(10, 2)), 42, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (40, 10, 13, 15, 11, CAST(896.32 AS Decimal(10, 2)), 36, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (41, 10, 13, 14, 1, CAST(834.35 AS Decimal(10, 2)), 32, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (42, 11, 9, 11, 12, CAST(853.10 AS Decimal(10, 2)), 16, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (43, 11, 3, 3, 1, CAST(797.69 AS Decimal(10, 2)), 34, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (44, 11, 1, 14, 3, CAST(801.49 AS Decimal(10, 2)), 17, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (45, 11, 11, 4, 11, CAST(792.93 AS Decimal(10, 2)), 6, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (46, 12, 4, 9, 8, CAST(144.29 AS Decimal(10, 2)), 7, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (47, 12, 2, 10, 3, CAST(136.68 AS Decimal(10, 2)), 45, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (48, 12, 8, 7, 14, CAST(184.89 AS Decimal(10, 2)), 43, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (49, 14, 3, 7, 8, CAST(288.63 AS Decimal(10, 2)), 27, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (50, 14, 2, 2, 4, CAST(447.41 AS Decimal(10, 2)), 33, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (51, 14, 9, 14, 11, CAST(384.13 AS Decimal(10, 2)), 38, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (52, 14, 12, 1, 11, CAST(390.83 AS Decimal(10, 2)), 39, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (53, 14, 3, 2, 13, CAST(385.07 AS Decimal(10, 2)), 19, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (54, 14, 9, 10, 7, CAST(442.25 AS Decimal(10, 2)), 13, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (55, 14, 12, 2, 2, CAST(320.66 AS Decimal(10, 2)), 20, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (56, 16, 13, 1, 2, CAST(1034.97 AS Decimal(10, 2)), 19, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (57, 16, 9, 1, 15, CAST(908.60 AS Decimal(10, 2)), 33, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (58, 16, 4, 9, 1, CAST(887.05 AS Decimal(10, 2)), 43, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (59, 16, 1, 9, 12, CAST(1029.06 AS Decimal(10, 2)), 18, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (60, 16, 8, 6, 5, CAST(932.94 AS Decimal(10, 2)), 31, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (61, 16, 8, 11, 2, CAST(944.68 AS Decimal(10, 2)), 36, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (62, 16, 4, 14, 2, CAST(1008.89 AS Decimal(10, 2)), 45, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (63, 18, 11, 9, 12, CAST(692.06 AS Decimal(10, 2)), 42, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (64, 18, 3, 12, 3, CAST(699.53 AS Decimal(10, 2)), 22, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (65, 18, 12, 15, 5, CAST(693.61 AS Decimal(10, 2)), 15, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (66, 18, 10, 8, 12, CAST(836.25 AS Decimal(10, 2)), 28, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (67, 18, 4, 5, 5, CAST(760.29 AS Decimal(10, 2)), 7, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (68, 18, 9, 14, 2, CAST(681.60 AS Decimal(10, 2)), 47, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (69, 19, 6, 13, 12, CAST(157.58 AS Decimal(10, 2)), 43, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (70, 19, 7, 11, 4, CAST(181.30 AS Decimal(10, 2)), 30, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (71, 19, 3, 3, 5, CAST(309.14 AS Decimal(10, 2)), 19, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (72, 19, 6, 1, 13, CAST(289.18 AS Decimal(10, 2)), 11, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (73, 19, 2, 9, 13, CAST(310.68 AS Decimal(10, 2)), 10, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (74, 20, 8, 15, 15, CAST(325.55 AS Decimal(10, 2)), 51, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (75, 20, 9, 15, 2, CAST(324.42 AS Decimal(10, 2)), 52, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (76, 20, 10, 12, 1, CAST(389.90 AS Decimal(10, 2)), 30, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (77, 20, 3, 3, 1, CAST(463.97 AS Decimal(10, 2)), 42, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (78, 20, 10, 10, 3, CAST(474.80 AS Decimal(10, 2)), 29, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (79, 20, 5, 3, 7, CAST(295.67 AS Decimal(10, 2)), 22, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (80, 21, 10, 5, 5, CAST(1141.48 AS Decimal(10, 2)), 22, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (81, 21, 3, 3, 1, CAST(1075.06 AS Decimal(10, 2)), 37, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (82, 21, 7, 14, 14, CAST(1050.74 AS Decimal(10, 2)), 48, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (83, 21, 4, 7, 12, CAST(1150.63 AS Decimal(10, 2)), 48, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (84, 21, 8, 8, 10, CAST(1225.21 AS Decimal(10, 2)), 8, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (85, 21, 10, 14, 11, CAST(1188.45 AS Decimal(10, 2)), 22, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (86, 21, 13, 14, 3, CAST(1239.62 AS Decimal(10, 2)), 26, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (87, 22, 3, 15, 4, CAST(446.73 AS Decimal(10, 2)), 29, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (88, 22, 7, 3, 9, CAST(562.19 AS Decimal(10, 2)), 37, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (89, 22, 11, 14, 12, CAST(470.62 AS Decimal(10, 2)), 11, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (90, 22, 3, 1, 4, CAST(444.50 AS Decimal(10, 2)), 43, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (91, 22, 1, 14, 11, CAST(588.44 AS Decimal(10, 2)), 45, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (92, 22, 10, 15, 2, CAST(457.27 AS Decimal(10, 2)), 23, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (93, 22, 5, 5, 15, CAST(560.54 AS Decimal(10, 2)), 36, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (94, 23, 11, 5, 6, CAST(219.85 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (95, 23, 8, 14, 1, CAST(230.51 AS Decimal(10, 2)), 24, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (96, 23, 7, 9, 14, CAST(301.85 AS Decimal(10, 2)), 10, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (97, 23, 9, 2, 13, CAST(349.99 AS Decimal(10, 2)), 31, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (98, 23, 4, 13, 12, CAST(310.90 AS Decimal(10, 2)), 15, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (99, 23, 8, 13, 6, CAST(219.85 AS Decimal(10, 2)), 11, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (100, 23, 4, 12, 1, CAST(227.63 AS Decimal(10, 2)), 54, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (101, 25, 9, 12, 3, CAST(123.26 AS Decimal(10, 2)), 33, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (102, 25, 10, 14, 14, CAST(254.25 AS Decimal(10, 2)), 13, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (103, 25, 7, 6, 14, CAST(252.03 AS Decimal(10, 2)), 22, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (104, 25, 13, 11, 10, CAST(123.57 AS Decimal(10, 2)), 24, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (105, 25, 1, 15, 1, CAST(280.65 AS Decimal(10, 2)), 10, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (106, 25, 8, 4, 13, CAST(201.36 AS Decimal(10, 2)), 26, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (107, 25, 1, 13, 10, CAST(221.87 AS Decimal(10, 2)), 25, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (108, 26, 13, 11, 3, CAST(329.48 AS Decimal(10, 2)), 49, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (109, 26, 8, 2, 5, CAST(204.71 AS Decimal(10, 2)), 40, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (110, 26, 1, 14, 10, CAST(244.15 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (111, 26, 1, 8, 12, CAST(185.01 AS Decimal(10, 2)), 41, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (112, 27, 6, 1, 3, CAST(197.21 AS Decimal(10, 2)), 35, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (113, 27, 11, 1, 14, CAST(276.33 AS Decimal(10, 2)), 35, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (114, 27, 11, 12, 1, CAST(118.77 AS Decimal(10, 2)), 21, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (115, 27, 5, 1, 1, CAST(231.58 AS Decimal(10, 2)), 32, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (116, 27, 8, 14, 2, CAST(128.84 AS Decimal(10, 2)), 6, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (117, 27, 1, 6, 13, CAST(267.63 AS Decimal(10, 2)), 54, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (118, 28, 7, 4, 11, CAST(79.29 AS Decimal(10, 2)), 37, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (119, 28, 5, 13, 9, CAST(47.58 AS Decimal(10, 2)), 30, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (120, 28, 9, 8, 5, CAST(136.28 AS Decimal(10, 2)), 32, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (121, 28, 10, 13, 11, CAST(36.22 AS Decimal(10, 2)), 52, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (122, 28, 11, 2, 8, CAST(47.95 AS Decimal(10, 2)), 18, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (123, 29, 2, 1, 12, CAST(251.92 AS Decimal(10, 2)), 41, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (124, 29, 3, 15, 10, CAST(347.95 AS Decimal(10, 2)), 53, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (125, 29, 7, 1, 10, CAST(304.82 AS Decimal(10, 2)), 44, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (126, 29, 2, 15, 2, CAST(288.05 AS Decimal(10, 2)), 16, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (127, 29, 5, 14, 9, CAST(195.29 AS Decimal(10, 2)), 35, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (128, 29, 1, 6, 8, CAST(361.91 AS Decimal(10, 2)), 22, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (129, 29, 8, 12, 15, CAST(295.28 AS Decimal(10, 2)), 10, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (130, 30, 9, 7, 11, CAST(161.10 AS Decimal(10, 2)), 26, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (131, 30, 3, 2, 11, CAST(228.34 AS Decimal(10, 2)), 5, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (132, 30, 12, 13, 14, CAST(164.69 AS Decimal(10, 2)), 31, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (133, 30, 10, 9, 8, CAST(188.75 AS Decimal(10, 2)), 8, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (134, 30, 3, 6, 6, CAST(117.66 AS Decimal(10, 2)), 16, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (135, 30, 11, 1, 6, CAST(193.71 AS Decimal(10, 2)), 28, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (136, 31, 13, 13, 15, CAST(187.38 AS Decimal(10, 2)), 11, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (137, 31, 7, 1, 12, CAST(95.99 AS Decimal(10, 2)), 10, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (138, 31, 9, 10, 1, CAST(119.75 AS Decimal(10, 2)), 14, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (139, 31, 3, 11, 12, CAST(246.55 AS Decimal(10, 2)), 31, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (140, 32, 9, 11, 8, CAST(640.53 AS Decimal(10, 2)), 25, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (141, 32, 7, 9, 6, CAST(552.10 AS Decimal(10, 2)), 47, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (142, 32, 6, 11, 2, CAST(584.05 AS Decimal(10, 2)), 21, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (143, 32, 1, 8, 2, CAST(532.40 AS Decimal(10, 2)), 39, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (144, 32, 2, 15, 7, CAST(624.39 AS Decimal(10, 2)), 36, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (145, 32, 4, 10, 6, CAST(568.10 AS Decimal(10, 2)), 53, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (146, 32, 9, 2, 6, CAST(590.49 AS Decimal(10, 2)), 49, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (147, 33, 11, 8, 3, CAST(151.24 AS Decimal(10, 2)), 42, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (148, 33, 7, 12, 4, CAST(129.49 AS Decimal(10, 2)), 43, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (149, 33, 2, 6, 2, CAST(137.84 AS Decimal(10, 2)), 45, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (150, 33, 3, 4, 11, CAST(86.12 AS Decimal(10, 2)), 53, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (151, 33, 12, 12, 7, CAST(187.76 AS Decimal(10, 2)), 28, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (152, 33, 1, 8, 8, CAST(153.38 AS Decimal(10, 2)), 37, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (153, 34, 6, 1, 1, CAST(204.56 AS Decimal(10, 2)), 20, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (154, 34, 7, 11, 1, CAST(317.82 AS Decimal(10, 2)), 25, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (155, 34, 5, 15, 9, CAST(153.96 AS Decimal(10, 2)), 19, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (156, 34, 7, 15, 12, CAST(167.91 AS Decimal(10, 2)), 8, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (157, 34, 6, 6, 4, CAST(252.51 AS Decimal(10, 2)), 23, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (158, 34, 6, 1, 7, CAST(183.83 AS Decimal(10, 2)), 12, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (159, 34, 7, 11, 9, CAST(252.00 AS Decimal(10, 2)), 11, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (160, 35, 10, 11, 8, CAST(103.56 AS Decimal(10, 2)), 52, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (161, 35, 2, 12, 11, CAST(158.22 AS Decimal(10, 2)), 9, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (162, 35, 9, 7, 12, CAST(177.49 AS Decimal(10, 2)), 16, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (163, 35, 9, 7, 14, CAST(166.18 AS Decimal(10, 2)), 33, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (164, 35, 4, 15, 9, CAST(115.55 AS Decimal(10, 2)), 21, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (165, 36, 1, 3, 5, CAST(176.70 AS Decimal(10, 2)), 30, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (166, 36, 4, 2, 11, CAST(196.67 AS Decimal(10, 2)), 12, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (167, 36, 8, 10, 10, CAST(153.97 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (168, 38, 11, 11, 4, CAST(143.13 AS Decimal(10, 2)), 17, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (169, 38, 6, 8, 12, CAST(75.70 AS Decimal(10, 2)), 15, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (170, 38, 13, 12, 2, CAST(121.68 AS Decimal(10, 2)), 29, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (171, 38, 13, 1, 14, CAST(172.61 AS Decimal(10, 2)), 23, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (172, 38, 1, 1, 11, CAST(77.50 AS Decimal(10, 2)), 15, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (173, 38, 1, 13, 13, CAST(119.22 AS Decimal(10, 2)), 54, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (174, 38, 8, 12, 15, CAST(55.30 AS Decimal(10, 2)), 37, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (175, 39, 6, 2, 12, CAST(426.46 AS Decimal(10, 2)), 32, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (176, 39, 3, 1, 5, CAST(329.75 AS Decimal(10, 2)), 10, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (177, 39, 12, 9, 10, CAST(400.96 AS Decimal(10, 2)), 17, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (178, 39, 1, 14, 11, CAST(297.56 AS Decimal(10, 2)), 31, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (179, 39, 7, 5, 12, CAST(325.94 AS Decimal(10, 2)), 36, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (180, 39, 4, 15, 6, CAST(256.56 AS Decimal(10, 2)), 12, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (181, 39, 6, 11, 8, CAST(326.16 AS Decimal(10, 2)), 38, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (182, 40, 2, 11, 15, CAST(156.41 AS Decimal(10, 2)), 45, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (183, 40, 6, 1, 12, CAST(30.54 AS Decimal(10, 2)), 15, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (184, 40, 6, 9, 3, CAST(170.67 AS Decimal(10, 2)), 5, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (185, 40, 3, 15, 15, CAST(108.21 AS Decimal(10, 2)), 31, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (186, 40, 11, 9, 5, CAST(141.80 AS Decimal(10, 2)), 12, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (187, 40, 12, 2, 8, CAST(80.71 AS Decimal(10, 2)), 9, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (188, 40, 5, 9, 3, CAST(13.73 AS Decimal(10, 2)), 7, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (189, 43, 11, 13, 6, CAST(207.14 AS Decimal(10, 2)), 51, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (190, 43, 8, 11, 3, CAST(314.99 AS Decimal(10, 2)), 52, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (191, 43, 3, 4, 3, CAST(354.10 AS Decimal(10, 2)), 42, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (192, 43, 2, 3, 1, CAST(397.14 AS Decimal(10, 2)), 29, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (193, 44, 8, 9, 14, CAST(102.52 AS Decimal(10, 2)), 22, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (194, 44, 8, 2, 6, CAST(255.10 AS Decimal(10, 2)), 31, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (195, 44, 11, 8, 1, CAST(158.86 AS Decimal(10, 2)), 6, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (196, 44, 3, 9, 2, CAST(246.19 AS Decimal(10, 2)), 48, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (197, 44, 12, 11, 5, CAST(127.85 AS Decimal(10, 2)), 26, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (198, 44, 3, 11, 11, CAST(198.86 AS Decimal(10, 2)), 20, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (199, 48, 2, 4, 10, CAST(55.37 AS Decimal(10, 2)), 48, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (200, 48, 10, 2, 5, CAST(182.76 AS Decimal(10, 2)), 53, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (201, 48, 12, 5, 4, CAST(52.89 AS Decimal(10, 2)), 40, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (202, 48, 9, 9, 13, CAST(108.11 AS Decimal(10, 2)), 5, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (203, 48, 12, 3, 12, CAST(85.01 AS Decimal(10, 2)), 16, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (204, 48, 12, 7, 13, CAST(210.60 AS Decimal(10, 2)), 36, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (205, 48, 1, 10, 7, CAST(200.27 AS Decimal(10, 2)), 17, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (206, 49, 10, 13, 13, CAST(81.42 AS Decimal(10, 2)), 14, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (207, 49, 5, 13, 4, CAST(51.82 AS Decimal(10, 2)), 33, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (208, 49, 7, 6, 1, CAST(177.02 AS Decimal(10, 2)), 20, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (209, 49, 11, 5, 3, CAST(206.12 AS Decimal(10, 2)), 20, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (210, 49, 5, 4, 5, CAST(209.61 AS Decimal(10, 2)), 46, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (211, 50, 5, 1, 2, CAST(156.49 AS Decimal(10, 2)), 37, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (212, 50, 2, 2, 15, CAST(85.05 AS Decimal(10, 2)), 35, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (213, 50, 4, 8, 2, CAST(232.86 AS Decimal(10, 2)), 25, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (214, 50, 3, 2, 7, CAST(269.03 AS Decimal(10, 2)), 25, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (215, 50, 9, 7, 7, CAST(92.92 AS Decimal(10, 2)), 40, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (216, 1, NULL, NULL, NULL, CAST(1299.99 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (217, 2, NULL, NULL, NULL, CAST(599.99 AS Decimal(10, 2)), 47, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (218, 6, NULL, NULL, NULL, CAST(899.99 AS Decimal(10, 2)), 45, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (219, 13, NULL, NULL, NULL, CAST(649.99 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (220, 15, NULL, NULL, NULL, CAST(199.99 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (221, 17, NULL, NULL, NULL, CAST(399.99 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (222, 24, NULL, NULL, NULL, CAST(189.99 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (223, 37, NULL, NULL, NULL, CAST(99.99 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (224, 41, NULL, NULL, NULL, CAST(699.99 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (225, 42, NULL, NULL, NULL, CAST(399.99 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (226, 45, NULL, NULL, NULL, CAST(89.99 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (227, 46, NULL, NULL, NULL, CAST(549.99 AS Decimal(10, 2)), 50, 1)
GO
INSERT [dbo].[ProductVariants] ([VariantID], [ProductID], [SizeID], [ColorID], [MaterialID], [Price], [StockQuantity], [IsActive]) VALUES (228, 47, NULL, NULL, NULL, CAST(149.99 AS Decimal(10, 2)), 50, 1)
GO
SET IDENTITY_INSERT [dbo].[ProductVariants] OFF
GO
SET IDENTITY_INSERT [dbo].[Sizes] ON 
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (1, N'XS', 1)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (2, N'S', 2)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (3, N'M', 3)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (4, N'L', 4)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (5, N'XL', 5)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (6, N'XXL', 6)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (7, N'Twin', 7)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (8, N'Full', 8)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (9, N'Queen', 9)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (10, N'King', 10)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (11, N'Small', 11)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (12, N'Medium', 12)
GO
INSERT [dbo].[Sizes] ([SizeID], [SizeName], [DisplayOrder]) VALUES (13, N'Large', 13)
GO
SET IDENTITY_INSERT [dbo].[Sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[SupplyOrderDetails] ON 
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1, 44, 46, 27, CAST(318.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (2, 35, 20, 23, CAST(191.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (3, 36, 42, 30, CAST(231.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (4, 5, 36, 16, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (5, 29, 17, 15, CAST(231.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (6, 18, 36, 36, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (7, 43, 22, 37, CAST(260.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (8, 15, 36, 24, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (9, 10, 8, 30, CAST(318.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (10, 42, 27, 18, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (11, 13, 9, 32, CAST(191.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (12, 29, 23, 12, CAST(144.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (13, 31, 22, 12, CAST(260.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (14, 4, 42, 14, CAST(231.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (15, 32, 25, 33, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (16, 4, 31, 22, CAST(75.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (17, 19, 21, 19, CAST(637.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (18, 22, 43, 34, CAST(144.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (19, 40, 21, 27, CAST(637.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (20, 29, 50, 28, CAST(69.59 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (21, 45, 37, 20, CAST(57.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (22, 34, 31, 35, CAST(75.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (23, 15, 15, 36, CAST(115.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (24, 6, 21, 16, CAST(637.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (25, 11, 21, 18, CAST(637.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (26, 25, 5, 25, CAST(260.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (27, 47, 30, 36, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (28, 11, 33, 30, CAST(52.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (29, 46, 18, 34, CAST(405.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (30, 39, 14, 31, CAST(173.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (31, 2, 43, 31, CAST(144.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (32, 37, 14, 24, CAST(173.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (33, 47, 14, 27, CAST(173.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (34, 8, 7, 36, CAST(144.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (35, 2, 1, 21, CAST(753.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (36, 50, 24, 14, CAST(110.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (37, 17, 28, 15, CAST(46.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (38, 11, 14, 13, CAST(173.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (39, 48, 30, 23, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (40, 15, 12, 29, CAST(75.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (41, 23, 46, 34, CAST(318.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (42, 7, 42, 16, CAST(231.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (43, 39, 1, 34, CAST(753.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (44, 11, 22, 11, CAST(260.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (45, 41, 43, 26, CAST(144.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (46, 36, 1, 29, CAST(753.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (47, 31, 20, 12, CAST(191.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (48, 29, 44, 38, CAST(75.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (49, 20, 21, 24, CAST(637.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (50, 19, 16, 38, CAST(521.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (51, 33, 17, 11, CAST(231.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (52, 28, 34, 38, CAST(104.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (53, 31, 34, 16, CAST(104.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (54, 25, 15, 23, CAST(115.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (55, 36, 44, 10, CAST(75.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (56, 22, 49, 26, CAST(34.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (57, 35, 31, 11, CAST(75.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (58, 41, 2, 27, CAST(347.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (59, 14, 25, 19, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (60, 18, 20, 36, CAST(191.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (61, 45, 32, 16, CAST(289.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (62, 23, 25, 28, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (63, 36, 48, 34, CAST(46.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (64, 8, 49, 22, CAST(34.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (65, 19, 17, 11, CAST(231.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (66, 39, 28, 24, CAST(46.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (67, 32, 42, 13, CAST(231.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (68, 21, 38, 36, CAST(28.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (69, 34, 26, 35, CAST(115.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (70, 4, 15, 31, CAST(115.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (71, 39, 45, 22, CAST(52.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (72, 25, 30, 35, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (73, 43, 14, 33, CAST(173.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (74, 35, 40, 36, CAST(34.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (75, 9, 42, 15, CAST(231.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (76, 44, 26, 39, CAST(115.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (77, 25, 29, 17, CAST(133.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (78, 26, 16, 23, CAST(521.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (79, 20, 22, 18, CAST(260.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (80, 32, 12, 12, CAST(75.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (81, 6, 25, 20, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (82, 29, 20, 26, CAST(191.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (83, 8, 50, 21, CAST(69.59 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (84, 17, 20, 15, CAST(191.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (85, 34, 28, 13, CAST(46.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (86, 4, 3, 19, CAST(202.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (87, 11, 12, 16, CAST(75.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (88, 33, 24, 26, CAST(110.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (89, 33, 3, 33, CAST(202.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (90, 46, 25, 13, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (91, 14, 37, 13, CAST(57.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (92, 43, 31, 23, CAST(75.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (93, 37, 8, 33, CAST(318.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (94, 8, 14, 11, CAST(173.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (95, 12, 18, 32, CAST(405.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (96, 6, 39, 30, CAST(173.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (97, 34, 27, 38, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (98, 4, 9, 11, CAST(191.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (99, 36, 30, 33, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (100, 10, 36, 27, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (101, 27, 16, 34, CAST(521.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (102, 7, 46, 35, CAST(318.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (103, 45, 43, 16, CAST(144.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (104, 30, 6, 22, CAST(521.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (105, 49, 9, 22, CAST(191.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (106, 29, 34, 26, CAST(104.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (107, 25, 41, 38, CAST(405.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (108, 49, 10, 33, CAST(463.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (109, 9, 8, 11, CAST(318.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (110, 1, 17, 29, CAST(231.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (111, 5, 13, 30, CAST(376.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (112, 7, 1, 23, CAST(753.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (113, 14, 5, 30, CAST(260.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (114, 14, 24, 15, CAST(110.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (115, 18, 3, 12, CAST(202.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (116, 46, 21, 24, CAST(637.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (117, 12, 20, 25, CAST(191.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (118, 32, 6, 16, CAST(521.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (119, 25, 50, 20, CAST(69.59 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (120, 8, 24, 20, CAST(110.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (121, 37, 4, 21, CAST(278.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (122, 40, 40, 26, CAST(34.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (123, 31, 6, 12, CAST(521.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (124, 16, 22, 35, CAST(260.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (125, 31, 29, 15, CAST(133.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (126, 29, 37, 28, CAST(57.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (127, 24, 18, 13, CAST(405.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (128, 47, 28, 21, CAST(46.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (129, 28, 9, 16, CAST(191.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (130, 13, 27, 24, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (131, 20, 6, 22, CAST(521.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (132, 10, 13, 21, CAST(376.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (133, 36, 16, 33, CAST(521.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (134, 20, 30, 39, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (135, 6, 10, 32, CAST(463.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (136, 36, 38, 25, CAST(28.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (137, 25, 49, 31, CAST(34.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (138, 49, 33, 36, CAST(52.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (139, 31, 40, 26, CAST(34.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (140, 3, 30, 23, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (141, 6, 34, 24, CAST(104.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (142, 37, 27, 35, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (143, 3, 27, 32, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (144, 31, 38, 11, CAST(28.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (145, 31, 16, 30, CAST(521.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (146, 31, 31, 20, CAST(75.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (147, 47, 36, 11, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (148, 7, 30, 25, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (149, 22, 16, 16, CAST(521.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (150, 20, 45, 34, CAST(52.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (151, 17, 17, 18, CAST(231.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (152, 29, 30, 21, CAST(92.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (153, 1, 19, 27, CAST(104.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (154, 5, 47, 15, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (155, 1, 11, 39, CAST(463.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (156, 38, 8, 34, CAST(318.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (157, 14, 45, 21, CAST(52.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (158, 35, 41, 32, CAST(405.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (159, 45, 49, 18, CAST(34.79 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (160, 49, 47, 37, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (161, 41, 26, 20, CAST(115.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (162, 35, 26, 11, CAST(115.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (163, 42, 22, 26, CAST(260.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (164, 23, 27, 11, CAST(86.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (165, 7, 18, 10, CAST(405.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (166, 46, 29, 22, CAST(133.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (167, 22, 39, 35, CAST(173.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (168, 25, 37, 29, CAST(57.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (169, 49, 26, 15, CAST(115.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (170, 22, 34, 24, CAST(104.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (171, 17, 3, 17, CAST(202.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (172, 33, 39, 25, CAST(173.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (173, 18, 41, 20, CAST(405.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (174, 4, 33, 34, CAST(52.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (175, 26, 23, 37, CAST(144.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (176, 41, 24, 13, CAST(110.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (177, 8, 28, 38, CAST(46.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (178, 17, 45, 37, CAST(52.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (179, 33, 16, 13, CAST(521.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (180, 35, 29, 35, CAST(133.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (181, 49, 15, 38, CAST(115.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (182, 25, 46, 27, CAST(318.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (183, 28, 39, 27, CAST(173.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (184, 4, 10, 26, CAST(463.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (185, 36, 35, 24, CAST(81.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (186, 42, 2, 14, CAST(347.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (187, 24, 46, 33, CAST(318.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (188, 11, 35, 27, CAST(81.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (189, 21, 28, 25, CAST(46.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (190, 37, 43, 12, CAST(144.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (191, 13, 21, 29, CAST(637.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (192, 17, 1, 15, CAST(753.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (193, 12, 41, 15, CAST(405.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (194, 27, 41, 36, CAST(405.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (195, 39, 37, 30, CAST(57.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (196, 31, 45, 28, CAST(52.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (197, 44, 43, 23, CAST(144.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (198, 40, 2, 12, CAST(347.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (199, 43, 12, 12, CAST(75.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrderDetails] ([SupplyOrderDetailID], [SupplyOrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (200, 28, 26, 23, CAST(115.99 AS Decimal(12, 2)))
GO
SET IDENTITY_INSERT [dbo].[SupplyOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[SupplyOrders] ON 
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (1, CAST(N'2025-11-14T16:45:16.6833333' AS DateTime2), 7, 2, CAST(27641.85 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (2, CAST(N'2025-11-22T16:45:16.6833333' AS DateTime2), 49, 7, CAST(20328.48 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (3, CAST(N'2025-08-13T16:45:16.6833333' AS DateTime2), 42, 2, CAST(4917.85 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (4, CAST(N'2025-08-29T16:45:16.6833333' AS DateTime2), 45, 25, CAST(28302.43 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (5, CAST(N'2025-07-04T16:45:16.6833333' AS DateTime2), 38, 32, CAST(14099.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (6, CAST(N'2025-10-25T16:45:16.6833333' AS DateTime2), 42, 25, CAST(34520.38 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (7, CAST(N'2025-07-22T16:45:16.6833333' AS DateTime2), 30, 11, CAST(38597.91 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (8, CAST(N'2025-07-09T16:45:16.6833333' AS DateTime2), 31, 30, CAST(13326.92 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (9, CAST(N'2025-08-20T16:45:16.6833333' AS DateTime2), 38, 27, CAST(6988.74 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (10, CAST(N'2025-07-21T16:45:16.6833333' AS DateTime2), 24, 2, CAST(19991.82 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (11, CAST(N'2025-06-18T16:45:16.6833333' AS DateTime2), 32, 5, CAST(21580.65 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (12, CAST(N'2025-08-21T16:45:16.6833333' AS DateTime2), 42, 30, CAST(23866.28 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (13, CAST(N'2025-06-14T16:45:16.6833333' AS DateTime2), 3, 32, CAST(26713.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (14, CAST(N'2025-10-07T16:45:16.6833333' AS DateTime2), 11, 35, CAST(12985.22 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (15, CAST(N'2025-10-29T16:45:16.6833333' AS DateTime2), 9, 11, CAST(8588.91 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (16, CAST(N'2025-07-28T16:45:16.6833333' AS DateTime2), 21, 32, CAST(9134.65 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (17, CAST(N'2025-08-22T16:45:16.6833333' AS DateTime2), 24, 12, CAST(24434.23 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (18, CAST(N'2025-06-15T16:45:16.6833333' AS DateTime2), 23, 2, CAST(20786.16 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (19, CAST(N'2025-07-18T16:45:16.6833333' AS DateTime2), 35, 25, CAST(34509.32 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (20, CAST(N'2025-08-23T16:45:16.6833333' AS DateTime2), 49, 11, CAST(36886.63 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (21, CAST(N'2025-08-07T16:45:16.6833333' AS DateTime2), 14, 31, CAST(2203.39 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (22, CAST(N'2025-08-24T16:45:16.6833333' AS DateTime2), 2, 15, CAST(22781.05 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (23, CAST(N'2025-06-26T16:45:16.6833333' AS DateTime2), 29, 10, CAST(14238.27 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (24, CAST(N'2025-06-12T16:45:16.6833333' AS DateTime2), 36, 35, CAST(15804.54 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (25, CAST(N'2025-11-13T16:45:16.6833333' AS DateTime2), 33, 1, CAST(42900.15 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (26, CAST(N'2025-07-17T16:45:16.6833333' AS DateTime2), 4, 25, CAST(17370.40 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (27, CAST(N'2025-05-29T16:45:16.6833333' AS DateTime2), 6, 20, CAST(32363.30 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (28, CAST(N'2025-08-16T16:45:16.6833333' AS DateTime2), 27, 16, CAST(14394.56 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (29, CAST(N'2025-10-09T16:45:16.6833333' AS DateTime2), 38, 26, CAST(21295.66 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (30, CAST(N'2025-10-28T16:45:16.6833333' AS DateTime2), 33, 25, CAST(11483.78 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (31, CAST(N'2025-07-02T16:45:16.6833333' AS DateTime2), 45, 1, CAST(35215.78 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (32, CAST(N'2025-06-04T16:45:16.6833333' AS DateTime2), 48, 6, CAST(15143.06 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (33, CAST(N'2025-06-19T16:45:16.6833333' AS DateTime2), 11, 6, CAST(23251.12 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (34, CAST(N'2025-06-09T16:45:16.6833333' AS DateTime2), 9, 31, CAST(10606.99 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (35, CAST(N'2025-07-02T16:45:16.6833333' AS DateTime2), 35, 20, CAST(25419.92 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (36, CAST(N'2025-11-14T16:45:16.6833333' AS DateTime2), 40, 10, CAST(54117.62 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (37, CAST(N'2025-09-06T16:45:16.6833333' AS DateTime2), 21, 17, CAST(25333.15 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (38, CAST(N'2025-07-19T16:45:16.6833333' AS DateTime2), 28, 5, CAST(10845.66 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (39, CAST(N'2025-08-05T16:45:16.6833333' AS DateTime2), 46, 35, CAST(35030.59 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (40, CAST(N'2025-09-17T16:45:16.6833333' AS DateTime2), 24, 1, CAST(22306.15 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (41, CAST(N'2025-06-03T16:45:16.6833333' AS DateTime2), 29, 21, CAST(16917.74 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (42, CAST(N'2025-09-11T16:45:16.6833333' AS DateTime2), 9, 1, CAST(13223.42 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (43, CAST(N'2025-09-27T16:45:16.6833333' AS DateTime2), 34, 17, CAST(18036.95 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (44, CAST(N'2025-07-30T16:45:16.6833333' AS DateTime2), 31, 10, CAST(16471.11 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (45, CAST(N'2025-06-03T16:45:16.6833333' AS DateTime2), 13, 27, CAST(8745.70 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (46, CAST(N'2025-07-19T16:45:16.6833333' AS DateTime2), 19, 17, CAST(33180.87 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (47, CAST(N'2025-11-24T16:45:16.6833333' AS DateTime2), 18, 30, CAST(10033.05 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (48, CAST(N'2025-08-08T16:45:16.6833333' AS DateTime2), 27, 11, CAST(2134.17 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (49, CAST(N'2025-07-14T16:45:16.6833333' AS DateTime2), 33, 10, CAST(30767.19 AS Decimal(12, 2)))
GO
INSERT [dbo].[SupplyOrders] ([SupplyOrderID], [SupplyDate], [VendorID], [EmployeeID], [Total]) VALUES (50, CAST(N'2025-07-18T16:45:16.6833333' AS DateTime2), 9, 27, CAST(1542.66 AS Decimal(12, 2)))
GO
SET IDENTITY_INSERT [dbo].[SupplyOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendors] ON 
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (1, N'Vendor Company 1', N'555-0001', N'Active', CAST(N'2025-11-23T16:45:16.6266667' AS DateTime2), CAST(10500.00 AS Decimal(18, 2)), N'ACC-00001', N'100 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (2, N'Vendor Company 2', N'555-0002', N'Active', CAST(N'2025-11-22T16:45:16.6266667' AS DateTime2), CAST(11000.00 AS Decimal(18, 2)), N'ACC-00002', N'200 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (3, N'Vendor Company 3', N'555-0003', N'Active', CAST(N'2025-11-21T16:45:16.6266667' AS DateTime2), CAST(11500.00 AS Decimal(18, 2)), N'ACC-00003', N'300 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (4, N'Vendor Company 4', N'555-0004', N'Active', CAST(N'2025-11-20T16:45:16.6266667' AS DateTime2), CAST(12000.00 AS Decimal(18, 2)), N'ACC-00004', N'400 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (5, N'Vendor Company 5', N'555-0005', N'Active', CAST(N'2025-11-19T16:45:16.6266667' AS DateTime2), CAST(12500.00 AS Decimal(18, 2)), N'ACC-00005', N'500 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (6, N'Vendor Company 6', N'555-0006', N'Active', CAST(N'2025-11-18T16:45:16.6266667' AS DateTime2), CAST(13000.00 AS Decimal(18, 2)), N'ACC-00006', N'600 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (7, N'Vendor Company 7', N'555-0007', N'Active', CAST(N'2025-11-17T16:45:16.6266667' AS DateTime2), CAST(13500.00 AS Decimal(18, 2)), N'ACC-00007', N'700 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (8, N'Vendor Company 8', N'555-0008', N'Active', CAST(N'2025-11-16T16:45:16.6266667' AS DateTime2), CAST(14000.00 AS Decimal(18, 2)), N'ACC-00008', N'800 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (9, N'Vendor Company 9', N'555-0009', N'Active', CAST(N'2025-11-15T16:45:16.6266667' AS DateTime2), CAST(14500.00 AS Decimal(18, 2)), N'ACC-00009', N'900 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (10, N'Vendor Company 10', N'555-0010', N'Active', CAST(N'2025-11-14T16:45:16.6266667' AS DateTime2), CAST(15000.00 AS Decimal(18, 2)), N'ACC-00010', N'1000 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (11, N'Vendor Company 11', N'555-0011', N'Active', CAST(N'2025-11-13T16:45:16.6266667' AS DateTime2), CAST(15500.00 AS Decimal(18, 2)), N'ACC-00011', N'1100 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (12, N'Vendor Company 12', N'555-0012', N'Active', CAST(N'2025-11-12T16:45:16.6266667' AS DateTime2), CAST(16000.00 AS Decimal(18, 2)), N'ACC-00012', N'1200 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (13, N'Vendor Company 13', N'555-0013', N'Active', CAST(N'2025-11-11T16:45:16.6266667' AS DateTime2), CAST(16500.00 AS Decimal(18, 2)), N'ACC-00013', N'1300 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (14, N'Vendor Company 14', N'555-0014', N'Active', CAST(N'2025-11-10T16:45:16.6266667' AS DateTime2), CAST(17000.00 AS Decimal(18, 2)), N'ACC-00014', N'1400 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (15, N'Vendor Company 15', N'555-0015', N'Active', CAST(N'2025-11-09T16:45:16.6266667' AS DateTime2), CAST(17500.00 AS Decimal(18, 2)), N'ACC-00015', N'1500 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (16, N'Vendor Company 16', N'555-0016', N'Active', CAST(N'2025-11-08T16:45:16.6266667' AS DateTime2), CAST(18000.00 AS Decimal(18, 2)), N'ACC-00016', N'1600 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (17, N'Vendor Company 17', N'555-0017', N'Active', CAST(N'2025-11-07T16:45:16.6266667' AS DateTime2), CAST(18500.00 AS Decimal(18, 2)), N'ACC-00017', N'1700 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (18, N'Vendor Company 18', N'555-0018', N'Active', CAST(N'2025-11-06T16:45:16.6266667' AS DateTime2), CAST(19000.00 AS Decimal(18, 2)), N'ACC-00018', N'1800 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (19, N'Vendor Company 19', N'555-0019', N'Active', CAST(N'2025-11-05T16:45:16.6300000' AS DateTime2), CAST(19500.00 AS Decimal(18, 2)), N'ACC-00019', N'1900 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (20, N'Vendor Company 20', N'555-0020', N'Active', CAST(N'2025-11-04T16:45:16.6300000' AS DateTime2), CAST(20000.00 AS Decimal(18, 2)), N'ACC-00020', N'2000 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (21, N'Vendor Company 21', N'555-0021', N'Active', CAST(N'2025-11-03T16:45:16.6300000' AS DateTime2), CAST(20500.00 AS Decimal(18, 2)), N'ACC-00021', N'2100 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (22, N'Vendor Company 22', N'555-0022', N'Active', CAST(N'2025-11-02T16:45:16.6300000' AS DateTime2), CAST(21000.00 AS Decimal(18, 2)), N'ACC-00022', N'2200 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (23, N'Vendor Company 23', N'555-0023', N'Active', CAST(N'2025-11-01T16:45:16.6300000' AS DateTime2), CAST(21500.00 AS Decimal(18, 2)), N'ACC-00023', N'2300 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (24, N'Vendor Company 24', N'555-0024', N'Active', CAST(N'2025-10-31T16:45:16.6300000' AS DateTime2), CAST(22000.00 AS Decimal(18, 2)), N'ACC-00024', N'2400 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (25, N'Vendor Company 25', N'555-0025', N'Active', CAST(N'2025-10-30T16:45:16.6300000' AS DateTime2), CAST(22500.00 AS Decimal(18, 2)), N'ACC-00025', N'2500 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (26, N'Vendor Company 26', N'555-0026', N'Active', CAST(N'2025-10-29T16:45:16.6300000' AS DateTime2), CAST(23000.00 AS Decimal(18, 2)), N'ACC-00026', N'2600 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (27, N'Vendor Company 27', N'555-0027', N'Active', CAST(N'2025-10-28T16:45:16.6300000' AS DateTime2), CAST(23500.00 AS Decimal(18, 2)), N'ACC-00027', N'2700 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (28, N'Vendor Company 28', N'555-0028', N'Active', CAST(N'2025-10-27T16:45:16.6300000' AS DateTime2), CAST(24000.00 AS Decimal(18, 2)), N'ACC-00028', N'2800 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (29, N'Vendor Company 29', N'555-0029', N'Active', CAST(N'2025-10-26T16:45:16.6300000' AS DateTime2), CAST(24500.00 AS Decimal(18, 2)), N'ACC-00029', N'2900 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (30, N'Vendor Company 30', N'555-0030', N'Active', CAST(N'2025-10-25T16:45:16.6300000' AS DateTime2), CAST(25000.00 AS Decimal(18, 2)), N'ACC-00030', N'3000 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (31, N'Vendor Company 31', N'555-0031', N'Active', CAST(N'2025-10-24T16:45:16.6300000' AS DateTime2), CAST(25500.00 AS Decimal(18, 2)), N'ACC-00031', N'3100 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (32, N'Vendor Company 32', N'555-0032', N'Active', CAST(N'2025-10-23T16:45:16.6300000' AS DateTime2), CAST(26000.00 AS Decimal(18, 2)), N'ACC-00032', N'3200 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (33, N'Vendor Company 33', N'555-0033', N'Active', CAST(N'2025-10-22T16:45:16.6300000' AS DateTime2), CAST(26500.00 AS Decimal(18, 2)), N'ACC-00033', N'3300 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (34, N'Vendor Company 34', N'555-0034', N'Active', CAST(N'2025-10-21T16:45:16.6300000' AS DateTime2), CAST(27000.00 AS Decimal(18, 2)), N'ACC-00034', N'3400 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (35, N'Vendor Company 35', N'555-0035', N'Active', CAST(N'2025-10-20T16:45:16.6300000' AS DateTime2), CAST(27500.00 AS Decimal(18, 2)), N'ACC-00035', N'3500 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (36, N'Vendor Company 36', N'555-0036', N'Active', CAST(N'2025-10-19T16:45:16.6300000' AS DateTime2), CAST(28000.00 AS Decimal(18, 2)), N'ACC-00036', N'3600 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (37, N'Vendor Company 37', N'555-0037', N'Active', CAST(N'2025-10-18T16:45:16.6300000' AS DateTime2), CAST(28500.00 AS Decimal(18, 2)), N'ACC-00037', N'3700 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (38, N'Vendor Company 38', N'555-0038', N'Active', CAST(N'2025-10-17T16:45:16.6300000' AS DateTime2), CAST(29000.00 AS Decimal(18, 2)), N'ACC-00038', N'3800 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (39, N'Vendor Company 39', N'555-0039', N'Active', CAST(N'2025-10-16T16:45:16.6300000' AS DateTime2), CAST(29500.00 AS Decimal(18, 2)), N'ACC-00039', N'3900 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (40, N'Vendor Company 40', N'555-0040', N'Active', CAST(N'2025-10-15T16:45:16.6300000' AS DateTime2), CAST(30000.00 AS Decimal(18, 2)), N'ACC-00040', N'4000 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (41, N'Vendor Company 41', N'555-0041', N'Active', CAST(N'2025-10-14T16:45:16.6333333' AS DateTime2), CAST(30500.00 AS Decimal(18, 2)), N'ACC-00041', N'4100 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (42, N'Vendor Company 42', N'555-0042', N'Active', CAST(N'2025-10-13T16:45:16.6333333' AS DateTime2), CAST(31000.00 AS Decimal(18, 2)), N'ACC-00042', N'4200 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (43, N'Vendor Company 43', N'555-0043', N'Active', CAST(N'2025-10-12T16:45:16.6333333' AS DateTime2), CAST(31500.00 AS Decimal(18, 2)), N'ACC-00043', N'4300 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (44, N'Vendor Company 44', N'555-0044', N'Active', CAST(N'2025-10-11T16:45:16.6333333' AS DateTime2), CAST(32000.00 AS Decimal(18, 2)), N'ACC-00044', N'4400 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (45, N'Vendor Company 45', N'555-0045', N'Active', CAST(N'2025-10-10T16:45:16.6333333' AS DateTime2), CAST(32500.00 AS Decimal(18, 2)), N'ACC-00045', N'4500 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (46, N'Vendor Company 46', N'555-0046', N'Active', CAST(N'2025-10-09T16:45:16.6333333' AS DateTime2), CAST(33000.00 AS Decimal(18, 2)), N'ACC-00046', N'4600 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (47, N'Vendor Company 47', N'555-0047', N'Active', CAST(N'2025-10-08T16:45:16.6333333' AS DateTime2), CAST(33500.00 AS Decimal(18, 2)), N'ACC-00047', N'4700 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (48, N'Vendor Company 48', N'555-0048', N'Active', CAST(N'2025-10-07T16:45:16.6333333' AS DateTime2), CAST(34000.00 AS Decimal(18, 2)), N'ACC-00048', N'4800 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (49, N'Vendor Company 49', N'555-0049', N'Active', CAST(N'2025-10-06T16:45:16.6333333' AS DateTime2), CAST(34500.00 AS Decimal(18, 2)), N'ACC-00049', N'4900 Supplier Rd, City, State 12345')
GO
INSERT [dbo].[Vendors] ([VendorID], [Name], [Phone], [Status], [ApprovedAt], [Balance], [BankAccount], [Address]) VALUES (50, N'Vendor Company 50', N'555-0050', N'Active', CAST(N'2025-10-05T16:45:16.6333333' AS DateTime2), CAST(35000.00 AS Decimal(18, 2)), N'ACC-00050', N'5000 Supplier Rd, City, State 12345')
GO
SET IDENTITY_INSERT [dbo].[Vendors] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Colors_ColorName]    Script Date: 11/27/2025 8:41:14 PM ******/
ALTER TABLE [dbo].[Colors] ADD  CONSTRAINT [UQ_Colors_ColorName] UNIQUE NONCLUSTERED 
(
	[ColorName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Materials_MaterialName]    Script Date: 11/27/2025 8:41:14 PM ******/
ALTER TABLE [dbo].[Materials] ADD  CONSTRAINT [UQ_Materials_MaterialName] UNIQUE NONCLUSTERED 
(
	[MaterialName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_OrderID]    Script Date: 11/27/2025 8:41:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderID] ON [dbo].[OrderDetails]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryID]    Script Date: 11/27/2025 8:41:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryID] ON [dbo].[Products]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_ProductVariants_Combination]    Script Date: 11/27/2025 8:41:14 PM ******/
ALTER TABLE [dbo].[ProductVariants] ADD  CONSTRAINT [UQ_ProductVariants_Combination] UNIQUE NONCLUSTERED 
(
	[ProductID] ASC,
	[SizeID] ASC,
	[ColorID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVariants_IsActive]    Script Date: 11/27/2025 8:41:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductVariants_IsActive] ON [dbo].[ProductVariants]
(
	[IsActive] ASC
)
INCLUDE([ProductID],[StockQuantity]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductVariants_ProductID]    Script Date: 11/27/2025 8:41:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductVariants_ProductID] ON [dbo].[ProductVariants]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Sizes_SizeName]    Script Date: 11/27/2025 8:41:14 PM ******/
ALTER TABLE [dbo].[Sizes] ADD  CONSTRAINT [UQ_Sizes_SizeName] UNIQUE NONCLUSTERED 
(
	[SizeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses] ADD  CONSTRAINT [DF_Addresses_IsDefault]  DEFAULT ((0)) FOR [is_default]
GO
ALTER TABLE [dbo].[Addresses] ADD  CONSTRAINT [DF_Addresses_CreatedAt]  DEFAULT (sysutcdatetime()) FOR [created_at]
GO
ALTER TABLE [dbo].[Addresses] ADD  CONSTRAINT [DF_Addresses_is_deleted]  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [DF_Categories_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_CreatedAt]  DEFAULT (sysutcdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Clients] ADD  CONSTRAINT [DF_Clients_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Colors] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Employees] ADD  CONSTRAINT [DF_Employees_CreatedAt]  DEFAULT (sysutcdatetime()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Materials] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (sysdatetime()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[PaymentMethods] ADD  CONSTRAINT [DF_PaymentMethods_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
ALTER TABLE [dbo].[PaymentMethods] ADD  CONSTRAINT [DF_PaymentMethods_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PaymentMethods] ADD  CONSTRAINT [DF_PaymentMethods_CreatedDate]  DEFAULT (sysdatetime()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductImages] ADD  CONSTRAINT [DF_ProductImages_IsPrimary]  DEFAULT ((0)) FOR [IsPrimary]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductVariants] ADD  DEFAULT ((0)) FOR [StockQuantity]
GO
ALTER TABLE [dbo].[ProductVariants] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[PromoCodes] ADD  CONSTRAINT [DF_PromoCodes_exp_data]  DEFAULT (dateadd(month,(3),sysdatetime())) FOR [exp_data]
GO
ALTER TABLE [dbo].[Sizes] ADD  DEFAULT ((0)) FOR [DisplayOrder]
GO
ALTER TABLE [dbo].[Vendors] ADD  DEFAULT (sysdatetime()) FOR [ApprovedAt]
GO
ALTER TABLE [dbo].[Vendors] ADD  CONSTRAINT [DF_Vendors_Balance]  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Clients1] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Clients1]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([CartId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_ProductVariants] FOREIGN KEY([VariantId])
REFERENCES [dbo].[ProductVariants] ([VariantID])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_ProductVariants]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Clients]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_ProductVariants] FOREIGN KEY([VariantID])
REFERENCES [dbo].[ProductVariants] ([VariantID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_ProductVariants]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_PaymentMethods] FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[PaymentMethods] ([PaymentMethodID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_PaymentMethods]
GO
ALTER TABLE [dbo].[PaymentMethods]  WITH CHECK ADD  CONSTRAINT [FK_PaymentMethods_Clients] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[PaymentMethods] CHECK CONSTRAINT [FK_PaymentMethods_Clients]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariants_Colors] FOREIGN KEY([ColorID])
REFERENCES [dbo].[Colors] ([ColorID])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [FK_ProductVariants_Colors]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariants_Materials] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Materials] ([MaterialID])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [FK_ProductVariants_Materials]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariants_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [FK_ProductVariants_Products]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [FK_ProductVariants_Sizes] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Sizes] ([SizeID])
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [FK_ProductVariants_Sizes]
GO
ALTER TABLE [dbo].[SupplyOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_SupplyOrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[SupplyOrderDetails] CHECK CONSTRAINT [FK_SupplyOrderDetails_Products]
GO
ALTER TABLE [dbo].[SupplyOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_SupplyOrderDetails_SupplyOrders] FOREIGN KEY([SupplyOrderID])
REFERENCES [dbo].[SupplyOrders] ([SupplyOrderID])
GO
ALTER TABLE [dbo].[SupplyOrderDetails] CHECK CONSTRAINT [FK_SupplyOrderDetails_SupplyOrders]
GO
ALTER TABLE [dbo].[SupplyOrders]  WITH CHECK ADD  CONSTRAINT [FK_SupplyOrders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[SupplyOrders] CHECK CONSTRAINT [FK_SupplyOrders_Employees]
GO
ALTER TABLE [dbo].[SupplyOrders]  WITH CHECK ADD  CONSTRAINT [FK_SupplyOrders_Vendors] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendors] ([VendorID])
GO
ALTER TABLE [dbo].[SupplyOrders] CHECK CONSTRAINT [FK_SupplyOrders_Vendors]
GO
ALTER TABLE [dbo].[Colors]  WITH CHECK ADD  CONSTRAINT [CK_Colors_HexCode] CHECK  (([HexCode] IS NULL OR [HexCode] like '#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]'))
GO
ALTER TABLE [dbo].[Colors] CHECK CONSTRAINT [CK_Colors_HexCode]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [CK_ProductVariants_Price] CHECK  (([Price]>=(0)))
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [CK_ProductVariants_Price]
GO
ALTER TABLE [dbo].[ProductVariants]  WITH CHECK ADD  CONSTRAINT [CK_ProductVariants_StockQuantity] CHECK  (([StockQuantity]>=(0)))
GO
ALTER TABLE [dbo].[ProductVariants] CHECK CONSTRAINT [CK_ProductVariants_StockQuantity]
GO
USE [master]
GO
ALTER DATABASE [Vendora] SET  READ_WRITE 
GO
