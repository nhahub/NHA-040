-- ============================================
-- COMPLETE FURNITURE E-COMMERCE SAMPLE DATA
-- Run this to populate ALL tables
-- ============================================

PRINT 'Starting complete data creation...';
PRINT '========================================';

-- ============================================
-- 1. CATEGORIES (15 categories)
-- ============================================
IF NOT EXISTS (SELECT 1 FROM Categories)
BEGIN
    INSERT INTO Categories (Name, Description, IsDeleted) VALUES
    ('Living Room', 'Sofas, coffee tables, TV stands, and living room essentials', 0),
    ('Bedroom', 'Beds, nightstands, dressers, and bedroom furniture', 0),
    ('Dining Room', 'Dining tables, chairs, and dining room sets', 0),
    ('Office', 'Desks, office chairs, and home office furniture', 0),
    ('Outdoor', 'Patio furniture, garden sets, and outdoor decor', 0),
    ('Storage', 'Shelving units, cabinets, and storage solutions', 0),
    ('Lighting', 'Lamps, chandeliers, and lighting fixtures', 0),
    ('Decor', 'Mirrors, wall art, and decorative accessories', 0),
    ('Kids', 'Children''s furniture and bedroom sets', 0),
    ('Bathroom', 'Bathroom vanities, cabinets, and storage', 0),
    ('Kitchen', 'Kitchen islands, bar stools, and pantry storage', 0),
    ('Entryway', 'Console tables, coat racks, and entryway benches', 0),
    ('Accent Furniture', 'Ottomans, poufs, and accent pieces', 0),
    ('Media Storage', 'Bookcases, media consoles, and entertainment centers', 0),
    ('Seating', 'Chairs, benches, and seating options', 0);
    PRINT 'Categories created: ' + CAST(@@ROWCOUNT AS VARCHAR);
END
ELSE
    PRINT 'Categories already exist, skipping...';

-- ============================================
-- 2. CLIENTS (50 customers) - Only if empty
-- ============================================
IF NOT EXISTS (SELECT 1 FROM Clients)
BEGIN
    INSERT INTO Clients (Email, Password, Name, PhoneNumber, CreatedAt, IsDeleted) VALUES
    ('john.smith@email.com', 'hashed_password_1', 'John Smith', '555-0101', GETDATE(), 0),
    ('emma.johnson@email.com', 'hashed_password_2', 'Emma Johnson', '555-0102', GETDATE(), 0),
    ('michael.brown@email.com', 'hashed_password_3', 'Michael Brown', '555-0103', GETDATE(), 0),
    ('sophia.davis@email.com', 'hashed_password_4', 'Sophia Davis', '555-0104', GETDATE(), 0),
    ('william.miller@email.com', 'hashed_password_5', 'William Miller', '555-0105', GETDATE(), 0),
    ('olivia.wilson@email.com', 'hashed_password_6', 'Olivia Wilson', '555-0106', GETDATE(), 0),
    ('james.moore@email.com', 'hashed_password_7', 'James Moore', '555-0107', GETDATE(), 0),
    ('ava.taylor@email.com', 'hashed_password_8', 'Ava Taylor', '555-0108', GETDATE(), 0),
    ('robert.anderson@email.com', 'hashed_password_9', 'Robert Anderson', '555-0109', GETDATE(), 0),
    ('isabella.thomas@email.com', 'hashed_password_10', 'Isabella Thomas', '555-0110', GETDATE(), 0),
    ('david.jackson@email.com', 'hashed_password_11', 'David Jackson', '555-0111', GETDATE(), 0),
    ('mia.white@email.com', 'hashed_password_12', 'Mia White', '555-0112', GETDATE(), 0),
    ('joseph.harris@email.com', 'hashed_password_13', 'Joseph Harris', '555-0113', GETDATE(), 0),
    ('charlotte.martin@email.com', 'hashed_password_14', 'Charlotte Martin', '555-0114', GETDATE(), 0),
    ('daniel.thompson@email.com', 'hashed_password_15', 'Daniel Thompson', '555-0115', GETDATE(), 0),
    ('amelia.garcia@email.com', 'hashed_password_16', 'Amelia Garcia', '555-0116', GETDATE(), 0),
    ('matthew.martinez@email.com', 'hashed_password_17', 'Matthew Martinez', '555-0117', GETDATE(), 0),
    ('harper.robinson@email.com', 'hashed_password_18', 'Harper Robinson', '555-0118', GETDATE(), 0),
    ('christopher.clark@email.com', 'hashed_password_19', 'Christopher Clark', '555-0119', GETDATE(), 0),
    ('evelyn.rodriguez@email.com', 'hashed_password_20', 'Evelyn Rodriguez', '555-0120', GETDATE(), 0),
    ('andrew.lewis@email.com', 'hashed_password_21', 'Andrew Lewis', '555-0121', GETDATE(), 0),
    ('abigail.lee@email.com', 'hashed_password_22', 'Abigail Lee', '555-0122', GETDATE(), 0),
    ('joshua.walker@email.com', 'hashed_password_23', 'Joshua Walker', '555-0123', GETDATE(), 0),
    ('emily.hall@email.com', 'hashed_password_24', 'Emily Hall', '555-0124', GETDATE(), 0),
    ('ryan.allen@email.com', 'hashed_password_25', 'Ryan Allen', '555-0125', GETDATE(), 0),
    ('elizabeth.young@email.com', 'hashed_password_26', 'Elizabeth Young', '555-0126', GETDATE(), 0),
    ('nathan.hernandez@email.com', 'hashed_password_27', 'Nathan Hernandez', '555-0127', GETDATE(), 0),
    ('madison.king@email.com', 'hashed_password_28', 'Madison King', '555-0128', GETDATE(), 0),
    ('ethan.wright@email.com', 'hashed_password_29', 'Ethan Wright', '555-0129', GETDATE(), 0),
    ('sofia.lopez@email.com', 'hashed_password_30', 'Sofia Lopez', '555-0130', GETDATE(), 0),
    ('alexander.hill@email.com', 'hashed_password_31', 'Alexander Hill', '555-0131', GETDATE(), 0),
    ('avery.scott@email.com', 'hashed_password_32', 'Avery Scott', '555-0132', GETDATE(), 0),
    ('jacob.green@email.com', 'hashed_password_33', 'Jacob Green', '555-0133', GETDATE(), 0),
    ('ella.adams@email.com', 'hashed_password_34', 'Ella Adams', '555-0134', GETDATE(), 0),
    ('logan.baker@email.com', 'hashed_password_35', 'Logan Baker', '555-0135', GETDATE(), 0),
    ('scarlett.gonzalez@email.com', 'hashed_password_36', 'Scarlett Gonzalez', '555-0136', GETDATE(), 0),
    ('benjamin.nelson@email.com', 'hashed_password_37', 'Benjamin Nelson', '555-0137', GETDATE(), 0),
    ('grace.carter@email.com', 'hashed_password_38', 'Grace Carter', '555-0138', GETDATE(), 0),
    ('samuel.mitchell@email.com', 'hashed_password_39', 'Samuel Mitchell', '555-0139', GETDATE(), 0),
    ('chloe.perez@email.com', 'hashed_password_40', 'Chloe Perez', '555-0140', GETDATE(), 0),
    ('henry.roberts@email.com', 'hashed_password_41', 'Henry Roberts', '555-0141', GETDATE(), 0),
    ('victoria.turner@email.com', 'hashed_password_42', 'Victoria Turner', '555-0142', GETDATE(), 0),
    ('jack.phillips@email.com', 'hashed_password_43', 'Jack Phillips', '555-0143', GETDATE(), 0),
    ('aria.campbell@email.com', 'hashed_password_44', 'Aria Campbell', '555-0144', GETDATE(), 0),
    ('luke.parker@email.com', 'hashed_password_45', 'Luke Parker', '555-0145', GETDATE(), 0),
    ('lily.evans@email.com', 'hashed_password_46', 'Lily Evans', '555-0146', GETDATE(), 0),
    ('owen.edwards@email.com', 'hashed_password_47', 'Owen Edwards', '555-0147', GETDATE(), 0),
    ('zoey.collins@email.com', 'hashed_password_48', 'Zoey Collins', '555-0148', GETDATE(), 0),
    ('carter.stewart@email.com', 'hashed_password_49', 'Carter Stewart', '555-0149', GETDATE(), 0),
    ('hannah.sanchez@email.com', 'hashed_password_50', 'Hannah Sanchez', '555-0150', GETDATE(), 0);
    PRINT 'Clients created: ' + CAST(@@ROWCOUNT AS VARCHAR);
END
ELSE
    PRINT 'Clients already exist, skipping...';

-- ============================================
-- 3. ADDRESSES (One per client)
-- ============================================
IF NOT EXISTS (SELECT 1 FROM Addresses)
BEGIN
    INSERT INTO Addresses (ClientID, full_description, city, postal_code, country, is_default, created_at)
    SELECT 
        ClientID,
        CAST(ClientID AS VARCHAR) + ' Main Street, Apt ' + CAST((ClientID % 20) + 1 AS VARCHAR),
        CASE (ClientID % 10)
            WHEN 0 THEN 'New York'
            WHEN 1 THEN 'Los Angeles'
            WHEN 2 THEN 'Chicago'
            WHEN 3 THEN 'Houston'
            WHEN 4 THEN 'Phoenix'
            WHEN 5 THEN 'Philadelphia'
            WHEN 6 THEN 'San Antonio'
            WHEN 7 THEN 'San Diego'
            WHEN 8 THEN 'Dallas'
            ELSE 'Austin'
        END,
        CAST(10000 + (ClientID * 100) AS VARCHAR),
        'USA',
        1,
        GETDATE()
    FROM Clients;
    PRINT 'Addresses created: ' + CAST(@@ROWCOUNT AS VARCHAR);
END
ELSE
    PRINT 'Addresses already exist, skipping...';

-- ============================================
-- 4. PRODUCTS (50 furniture products)
-- ============================================
IF NOT EXISTS (SELECT 1 FROM Products)
BEGIN
    INSERT INTO Products (ProductName, Price, Description, CategoryID, IsDeleted) VALUES
    ('Modern L-Shape Sofa', 1299.99, 'Spacious L-shaped sectional with premium fabric', 1, 0),
    ('Classic Leather Armchair', 599.99, 'Genuine leather armchair with tufted back', 1, 0),
    ('Industrial Coffee Table', 349.99, 'Solid wood coffee table with metal frame', 1, 0),
    ('Mid-Century TV Stand', 479.99, 'Walnut finish TV console with storage', 1, 0),
    ('Velvet Accent Chair', 449.99, 'Luxurious velvet chair with gold legs', 1, 0),
    ('King Size Platform Bed', 899.99, 'Modern platform bed with upholstered headboard', 2, 0),
    ('Solid Oak Nightstand', 249.99, 'Two-drawer nightstand with USB ports', 2, 0),
    ('6-Drawer Dresser', 549.99, 'Spacious dresser with soft-close drawers', 2, 0),
    ('Tufted Velvet Headboard', 329.99, 'Luxurious velvet upholstered headboard', 2, 0),
    ('Queen Storage Bed', 799.99, 'Bed frame with built-in storage drawers', 2, 0),
    ('Extendable Dining Table', 799.99, 'Seats 6-8 people, extends to 96 inches', 3, 0),
    ('Upholstered Dining Chair', 129.99, 'Padded dining chair with wooden legs', 3, 0),
    ('Glass Top Dining Table', 649.99, 'Tempered glass top with chrome base', 3, 0),
    ('Farmhouse Dining Bench', 299.99, 'Rustic solid wood bench', 3, 0),
    ('Bar Stool Set', 199.99, 'Set of 2 adjustable height bar stools', 3, 0),
    ('Executive Office Desk', 899.99, 'L-shaped desk with built-in storage', 4, 0),
    ('Ergonomic Office Chair', 399.99, 'Mesh back chair with lumbar support', 4, 0),
    ('Adjustable Standing Desk', 699.99, 'Electric height-adjustable desk', 4, 0),
    ('Rolling File Cabinet', 179.99, 'Three-drawer mobile cabinet with locks', 4, 0),
    ('Bookcase with Doors', 329.99, 'Five-shelf bookcase with glass doors', 4, 0),
    ('Outdoor Patio Set', 1099.99, 'Weather-resistant 5-piece dining set', 5, 0),
    ('Wicker Lounge Chair', 449.99, 'Comfortable outdoor lounger with cushions', 5, 0),
    ('Garden Bench', 249.99, 'Teak wood outdoor bench', 5, 0),
    ('Patio Umbrella', 189.99, '9ft cantilever patio umbrella', 5, 0),
    ('Outdoor Storage Box', 149.99, 'Waterproof deck storage container', 5, 0),
    ('5-Tier Bookshelf', 199.99, 'Open concept ladder-style bookcase', 6, 0),
    ('Storage Ottoman', 149.99, 'Multi-functional storage ottoman', 6, 0),
    ('Floating Wall Shelves', 79.99, 'Set of 3 decorative wall shelves', 6, 0),
    ('Entryway Shoe Cabinet', 229.99, 'Slim shoe storage with flip-down doors', 6, 0),
    ('Modular Cube Storage', 159.99, '9-cube organizer with fabric bins', 6, 0),
    ('Modern Floor Lamp', 129.99, 'Adjustable arc floor lamp with LED', 7, 0),
    ('Crystal Chandelier', 499.99, 'Elegant chandelier with 8 lights', 7, 0),
    ('Table Lamp Set', 89.99, 'Set of 2 matching bedside lamps', 7, 0),
    ('Track Lighting Kit', 179.99, 'Adjustable LED track lighting', 7, 0),
    ('Pendant Light Fixture', 139.99, 'Industrial-style hanging pendant', 7, 0),
    ('Full-Length Mirror', 159.99, 'Freestanding floor mirror with frame', 8, 0),
    ('Wall Art Canvas Set', 99.99, 'Set of 3 abstract canvas prints', 8, 0),
    ('Decorative Vase', 49.99, 'Ceramic vase with geometric pattern', 8, 0),
	 ('Area Rug 8x10', 299.99, 'Soft plush area rug, multiple colors', 8, 0),
    ('Throw Pillow Set', 59.99, 'Set of 4 decorative throw pillows', 8, 0),
    ('Kids Bunk Bed', 699.99, 'Twin-over-full bunk bed with ladder', 9, 0),
    ('Toddler Storage Bed', 399.99, 'Low-profile bed with underbed drawers', 9, 0),
    ('Children Study Desk', 249.99, 'Adjustable height kids desk and chair', 9, 0),
    ('Toy Storage Organizer', 129.99, 'Multi-bin toy storage unit', 9, 0),
    ('Kids Bookshelf', 89.99, 'Colorful bookcase for children', 9, 0),
    ('Bathroom Vanity', 549.99, '36-inch vanity with marble countertop', 10, 0),
    ('Medicine Cabinet', 149.99, 'Mirrored wall-mounted medicine cabinet', 10, 0),
    ('Bathroom Storage Cart', 79.99, 'Rolling storage cart with shelves', 10, 0),
    ('Towel Rack Set', 59.99, 'Wall-mounted towel bar set', 10, 0),
    ('Over-Toilet Storage', 119.99, 'Space-saving bathroom organizer', 10, 0);
    PRINT 'Products created: ' + CAST(@@ROWCOUNT AS VARCHAR);
END
ELSE
    PRINT 'Products already exist, skipping...';

-- ============================================
-- 5. PRODUCT VARIANTS (Multiple per product)
-- ============================================
IF NOT EXISTS (SELECT 1 FROM ProductVariants)
BEGIN
    DECLARE @ProductID INT = 1;
    DECLARE @MaxProductID INT = (SELECT MAX(ProductID) FROM Products);
    
    WHILE @ProductID <= @MaxProductID
    BEGIN
        -- Add 2-3 variants per product
        INSERT INTO ProductVariants (ProductID, VariantName, VariantValue, StockQuantity)
        VALUES
        (@ProductID, 'Color', 'Option A', 15 + (@ProductID % 10)),
        (@ProductID, 'Color', 'Option B', 12 + (@ProductID % 8)),
        (@ProductID, 'Size', 'Standard', 20 + (@ProductID % 15));
        
        SET @ProductID = @ProductID + 1;
    END
    PRINT 'Product Variants created: ' + CAST(@@ROWCOUNT AS VARCHAR);
END
ELSE
    PRINT 'Product Variants already exist, skipping...';

-- ============================================
-- 6. PRODUCT IMAGES (2 per product)
-- ============================================
IF NOT EXISTS (SELECT 1 FROM ProductImages)
BEGIN
    INSERT INTO ProductImages (ProductID, ImageURL, AltText, IsPrimary)
    SELECT 
        ProductID,
        'product-' + CAST(ProductID AS VARCHAR) + '-main.jpg',
        ProductName + ' Main Image',
        1
    FROM Products;
    
    INSERT INTO ProductImages (ProductID, ImageURL, AltText, IsPrimary)
    SELECT 
        ProductID,
        'product-' + CAST(ProductID AS VARCHAR) + '-detail.jpg',
        ProductName + ' Detail Image',
        0
    FROM Products;
    
    PRINT 'Product Images created: ' + CAST(@@ROWCOUNT AS VARCHAR);
END
ELSE
    PRINT 'Product Images already exist, skipping...';

-- ============================================
-- 7. VENDORS (50 suppliers) - Only if empty
-- ============================================
IF NOT EXISTS (SELECT 1 FROM Vendors)
BEGIN
    DECLARE @VendorCount INT = 1;
    WHILE @VendorCount <= 50
    BEGIN
        INSERT INTO Vendors (Name, Phone, Status, ApprovedAt, Balance, BankAccount, Address)
        VALUES (
            'Vendor Company ' + CAST(@VendorCount AS VARCHAR),
            '555-' + RIGHT('0000' + CAST(@VendorCount AS VARCHAR), 4),
            'Active',
            DATEADD(day, -@VendorCount, GETDATE()),
            CAST((10000 + (@VendorCount * 500)) AS DECIMAL(10,2)),
            'ACC-' + RIGHT('00000' + CAST(@VendorCount AS VARCHAR), 5),
            CAST(@VendorCount * 100 AS VARCHAR) + ' Supplier Rd, City, State 12345'
        );
        SET @VendorCount = @VendorCount + 1;
    END
    PRINT 'Vendors created: 50';
END
ELSE
    PRINT 'Vendors already exist, skipping...';

-- ============================================
-- 8. EMPLOYEES (35 staff) - Only if empty
-- ============================================
IF NOT EXISTS (SELECT 1 FROM Employees)
BEGIN
    DECLARE @EmpCount INT = 1;
    WHILE @EmpCount <= 35
    BEGIN
        INSERT INTO Employees (Email, Password, Name, Role, IsActive, CreatedAt, LastLoginAt)
        VALUES (
            'employee' + CAST(@EmpCount AS VARCHAR) + '@furni.com',
            'hashed_password_' + CAST(@EmpCount AS VARCHAR),
            'Employee ' + CAST(@EmpCount AS VARCHAR),
            CASE (@EmpCount % 5)
                WHEN 0 THEN 'Admin'
                WHEN 1 THEN 'Manager'
                WHEN 2 THEN 'Warehouse'
                WHEN 3 THEN 'Sales'
                ELSE 'Support'
            END,
            1,
            DATEADD(day, -(@EmpCount * 10), GETDATE()),
            DATEADD(day, -(@EmpCount % 7), GETDATE())
        );
        SET @EmpCount = @EmpCount + 1;
    END
    PRINT 'Employees created: 35';
END
ELSE
    PRINT 'Employees already exist, skipping...';

-- ============================================
-- 9. CARTS (One per client)
-- ============================================
INSERT INTO Carts (ClientID)
SELECT ClientID 
FROM Clients
WHERE ClientID NOT IN (SELECT ISNULL(ClientID, 0) FROM Carts);
PRINT 'Carts created: ' + CAST(@@ROWCOUNT AS VARCHAR);

-- ============================================
-- 10. CART ITEMS (100 random items)
-- ============================================
DECLARE @ValidCartItems TABLE (CartID INT, VariantID INT, Quantity INT);

INSERT INTO @ValidCartItems (CartID, VariantID, Quantity)
SELECT TOP 100
    c.CartId,
    pv.VariantID,
    (ABS(CHECKSUM(NEWID()) % 3) + 1) AS Quantity
FROM Carts c
CROSS JOIN ProductVariants pv
WHERE pv.StockQuantity > 0
ORDER BY NEWID();

INSERT INTO CartItems (VariantID, CartId, Quantity)
SELECT VariantID, CartID, Quantity
FROM @ValidCartItems;
PRINT 'Cart Items created: ' + CAST(@@ROWCOUNT AS VARCHAR);

-- ============================================
-- 11. ORDERS (50 orders)
-- ============================================
DECLARE @OrdersTemp TABLE (
    OrderDate DATETIME,
    ClientID INT,
    TotalOrder DECIMAL(10,2),
    Status VARCHAR(50),
    AddressID INT
);

INSERT INTO @OrdersTemp (OrderDate, ClientID, TotalOrder, Status, AddressID)
SELECT TOP 50
    DATEADD(day, -ABS(CHECKSUM(NEWID()) % 120), GETDATE()) AS OrderDate,
    c.ClientID,
    0.00 AS TotalOrder,
    CASE ABS(CHECKSUM(NEWID()) % 5)
        WHEN 0 THEN 'Pending'
        WHEN 1 THEN 'Processing'
        WHEN 2 THEN 'Shipped'
        ELSE 'Delivered'
    END AS Status,
    a.address_id
FROM Clients c
INNER JOIN Addresses a ON c.ClientID = a.ClientID
WHERE a.is_default = 1
ORDER BY NEWID();

INSERT INTO Orders (OrderDate, ClientID, TotalOrder, Status, address_id)
SELECT OrderDate, ClientID, TotalOrder, Status, AddressID
FROM @OrdersTemp;
PRINT 'Orders created: ' + CAST(@@ROWCOUNT AS VARCHAR);

-- Get new order IDs
DECLARE @NewOrders TABLE (OrderID INT, ClientID INT, Status VARCHAR(50));
INSERT INTO @NewOrders (OrderID, ClientID, Status)
SELECT TOP 50 OrderID, ClientID, Status
FROM Orders
ORDER BY OrderID DESC;

-- ============================================
-- 12. ORDER DETAILS (150 line items)
-- ============================================
DECLARE @OrderDetailsTemp TABLE (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Status VARCHAR(50),
    UnitPrice DECIMAL(10,2)
);

INSERT INTO @OrderDetailsTemp (OrderID, ProductID, Quantity, Status, UnitPrice)
SELECT TOP 150
    no.OrderID,
    p.ProductID,
    (ABS(CHECKSUM(NEWID()) % 3) + 1) AS Quantity,
    no.Status,
    p.Price
FROM @NewOrders no
CROSS JOIN Products p
WHERE p.IsDeleted = 0
ORDER BY NEWID();

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Status, UnitPrice)
SELECT OrderID, ProductID, Quantity, Status, UnitPrice
FROM @OrderDetailsTemp;
PRINT 'Order Details created: ' + CAST(@@ROWCOUNT AS VARCHAR);

-- Update order totals
UPDATE o
SET TotalOrder = ISNULL((
    SELECT SUM(od.Quantity * od.UnitPrice)
    FROM OrderDetails od
    WHERE od.OrderID = o.OrderID
), 0.00)
FROM Orders o
WHERE o.OrderID IN (SELECT OrderID FROM @NewOrders);
PRINT 'Order totals updated';

-- ============================================
-- 13. SUPPLY ORDERS (50 orders)
-- ============================================
DECLARE @SupplyOrdersTemp TABLE (
    SupplyDate DATETIME,
    VendorID INT,
    EmployeeID INT,
    Total DECIMAL(10,2)
);

INSERT INTO @SupplyOrdersTemp (SupplyDate, VendorID, EmployeeID, Total)
SELECT TOP 50
    DATEADD(day, -ABS(CHECKSUM(NEWID()) % 180), GETDATE()) AS SupplyDate,
    v.VendorID,
    e.EmployeeID,
    0.00 AS Total
FROM Vendors v
CROSS JOIN Employees e
WHERE v.Status = 'Active' 
  AND e.IsActive = 1
  AND e.Role IN ('Warehouse', 'Manager', 'Admin')
ORDER BY NEWID();

INSERT INTO SupplyOrders (SupplyDate, VendorID, EmployeeID, Total)
SELECT SupplyDate, VendorID, EmployeeID, Total
FROM @SupplyOrdersTemp;
PRINT 'Supply Orders created: ' + CAST(@@ROWCOUNT AS VARCHAR);

-- Get new supply order IDs
DECLARE @NewSupplyOrders TABLE (SupplyOrderID INT);
INSERT INTO @NewSupplyOrders (SupplyOrderID)
SELECT TOP 50 SupplyOrderID
FROM SupplyOrders
ORDER BY SupplyOrderID DESC;

-- ============================================
-- 14. SUPPLY ORDER DETAILS (200 line items)
-- ============================================
DECLARE @SupplyOrderDetailsTemp TABLE (
    SupplyOrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2)
);

INSERT INTO @SupplyOrderDetailsTemp (SupplyOrderID, ProductID, Quantity, UnitPrice)
SELECT TOP 200
    nso.SupplyOrderID,
    p.ProductID,
    (ABS(CHECKSUM(NEWID()) % 30) + 10) AS Quantity,
    (p.Price * 0.58) AS UnitPrice
FROM @NewSupplyOrders nso
CROSS JOIN Products p
WHERE p.IsDeleted = 0
ORDER BY NEWID();

INSERT INTO SupplyOrderDetails (SupplyOrderID, ProductID, Quantity, UnitPrice)
SELECT SupplyOrderID, ProductID, Quantity, UnitPrice
FROM @SupplyOrderDetailsTemp;
PRINT 'Supply Order Details created: ' + CAST(@@ROWCOUNT AS VARCHAR);

-- Update supply order totals
UPDATE so
SET Total = ISNULL((
    SELECT SUM(sod.Quantity * sod.UnitPrice)
    FROM SupplyOrderDetails sod
    WHERE sod.SupplyOrderID = so.SupplyOrderID
), 0.00)
FROM SupplyOrders so
WHERE so.SupplyOrderID IN (SELECT SupplyOrderID FROM @NewSupplyOrders);
PRINT 'Supply Order totals updated';

-- ============================================
-- VERIFICATION SUMMARY
-- ============================================
PRINT '========================================';
PRINT 'DATA CREATION COMPLETE!';
PRINT '========================================';

SELECT 'Categories' AS TableName, COUNT(*) AS TotalRecords FROM Categories
UNION ALL SELECT 'Clients', COUNT(*) FROM Clients
UNION ALL SELECT 'Addresses', COUNT(*) FROM Addresses
UNION ALL SELECT 'Products', COUNT(*) FROM Products
UNION ALL SELECT 'ProductVariants', COUNT(*) FROM ProductVariants
UNION ALL SELECT 'ProductImages', COUNT(*) FROM ProductImages
UNION ALL SELECT 'Vendors', COUNT(*) FROM Vendors
UNION ALL SELECT 'Employees', COUNT(*) FROM Employees
UNION ALL SELECT 'Carts', COUNT(*) FROM Carts
UNION ALL SELECT 'CartItems', COUNT(*) FROM CartItems
UNION ALL SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL SELECT 'OrderDetails', COUNT(*) FROM OrderDetails
UNION ALL SELECT 'SupplyOrders', COUNT(*) FROM SupplyOrders
UNION ALL SELECT 'SupplyOrderDetails', COUNT(*) FROM SupplyOrderDetails
ORDER BY TableName;

PRINT '========================================';
PRINT 'Sample data generation completed successfully!';