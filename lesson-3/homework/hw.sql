
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2)
);


INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1, 'Laptop', 1200.00),
(2, 'Mouse', 25.50),
(3, 'Keyboard', 45.00),
(4, 'Smartphone',850.00),
(5, 'Tablet',600.00),
(6, 'Smartwatch',250.50),
(7, 'Headphones',120.30), 
(8, 'PowerBank',80.40);


ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);


SELECT * FROM Products
WHERE Price > 100;



ALTER TABLE Products
ADD CategoryID INT;


CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE
);


BULK INSERT Products
FROM 'C:\Users\user\Desktop\Дата аналитика\Домашние задании\products.txt'
WITH (
    FIELDTERMINATOR = ',',   
    ROWTERMINATOR = '\n',    
    FIRSTROW = 2             
);


ALTER TABLE Products
ADD CONSTRAINT FK_Products_Categories
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);


ALTER TABLE Products
ADD CONSTRAINT CHK_Price_Positive CHECK (Price > 0);


ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0;


SELECT 
    ProductID,
    ProductName,
    ISNULL(Price, 0) AS Price,
    CategoryID,
    Stock
FROM Products;


CREATE TABLE ProductsWithIdentity (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(50) UNIQUE,
    Price DECIMAL(10,2) CHECK (Price > 0)
);

INSERT INTO ProductsWithIdentity (ProductName, Price)
VALUES ('Monitor', 300.00), ('Printer', 250.00);


SELECT * FROM Products;
SELECT * FROM Categories;
SELECT * FROM ProductsWithIdentity;




CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18)
);


CREATE TABLE InvoiceNumbers (
    InvoiceID INT IDENTITY(100,10) PRIMARY KEY,
    InvoiceDate DATE,
    Amount DECIMAL(10,2)
);


CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)
);


SELECT ISNULL(Price, 0) AS FixedPrice FROM Products;
SELECT COALESCE(NULL, NULL, 150, 200) AS Result;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
