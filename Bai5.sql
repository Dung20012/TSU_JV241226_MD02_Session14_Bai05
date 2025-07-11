CREATE DATABASE ss5;
USE ss5;

-- Tạo bảng Products
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,  -- Khóa chính tự động tăng
    ProductName VARCHAR(100) NOT NULL,         -- Tên sản phẩm
    Category VARCHAR(50) NOT NULL,             -- Loại sản phẩm
    Price DECIMAL(10, 2) NOT NULL,             -- Giá sản phẩm
    Stock INT NOT NULL                         -- Số lượng tồn kho
);
-- Thêm dữ liệu vào bảng Products
INSERT INTO Products (ProductName, Category, Price, Stock)
VALUES
    ('iPhone 14', 'Electronics', 1000.00, 50),
    ('MacBook Air', 'Electronics', 1200.00, 30),
    ('T-Shirt', 'Fashion', 20.00, 200),
    ('Sneakers', 'Fashion', 100.00, 100),
    ('Refrigerator', 'Appliances', 800.00, 10),
    ('Air Conditioner', 'Appliances', 600.00, 15),
    ('Laptop', 'Electronics', 1500.00, 25),
    ('Headphones', 'Electronics', 200.00, 75),
    ('Jacket', 'Fashion', 150.00, 50),
    ('Washing Machine', 'Appliances', 700.00, 8);

# Tìm sản phẩm có giá cao hơn 'Macbook Air'
SELECT ProductName, Category, Price
FROM Products
WHERE Price > (
	SELECT Price FROM Products WHERE ProductName = 'Macbook Air'
);

# Tìm sản phẩm thuộc loại 'Electronics' có giá thấp hơn 'Laptop'
SELECT ProductName, Category, Price
FROM Products
WHERE Category = 'Electronics' < (
	SELECT Price FROM Products WHERE ProductName = 'Laptop'
);

# Tìm sản phẩm có số lượng tồn kho thấp hơn 'T-Shirt'
SELECT ProductName, Price, Stock
FROM Products
WHERE Stock < (
	SELECT Stock FROM Products WHERE ProductName = 'T-Shirt'
);