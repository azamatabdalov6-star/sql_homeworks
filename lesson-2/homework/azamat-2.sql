-- 1. Создать таблицу Employees
CREATE TABLE Employees (
    EmpID INT,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- 2. Вставка записей (разные способы)
INSERT INTO Employees (EmpID, Name, Salary) VALUES (1, 'Ali', 6000.00); -- одна строка
INSERT INTO Employees VALUES 
(2, 'Vali', 5000.00), 
(3, 'Hasan', 4000.00);-

-- 3. Обновить зарплату сотрудника с EmpID = 1
UPDATE Employees
SET Salary = 7000.00
WHERE EmpID = 1;

-- 4. Удалить сотрудника, где EmpID = 2
DELETE FROM Employees WHERE EmpID = 2;

-- 5. Разница между DELETE, TRUNCATE, DROP
-- DELETE – удаляет строки, можно через WHERE, структура сохраняется.
-- TRUNCATE – быстро очищает всю таблицу, структуру сохраняет.
-- DROP – полностью удаляет таблицу со структурой.

-- 6. Изменить столбец Name на VARCHAR(100)
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);

-- 7. Добавить новый столбец Department
ALTER TABLE Employees
ADD Department VARCHAR(50);

-- 8. Изменить тип Salary на FLOAT
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;

-- 9. Создать таблицу Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
select*from Departments
-- 10. Удалить все записи из Employees (структуру оставить)
TRUNCATE TABLE Employees;


-- 1. Вставить 5 записей в Departments через INSERT INTO SELECT
INSERT INTO Departments (DepartmentID, DepartmentName)
SELECT 1, 'IT' UNION ALL
SELECT 2, 'HR' UNION ALL
SELECT 3, 'Finance' UNION ALL
SELECT 4, 'Logistics' UNION ALL
SELECT 5, 'Marketing';

-- 2. Обновить Department сотрудников с Salary > 5000
UPDATE Employees
SET Department = 'Руководство'
WHERE Salary > 5000;

-- 3. Удалить всех сотрудников, но оставить структуру
TRUNCATE TABLE Employees;

-- 4. Удалить столбец Department
ALTER TABLE Employees
DROP COLUMN Department;

-- 5. Переименовать Employees → StaffMembers
exec sp_rename Employees, StaffMembers;

-- 6. Удалить таблицу Departments
DROP TABLE Departments;




-- 1. Создать таблицу Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Supplier VARCHAR(50)
);

select*from Products
-- 2. Добавить ограничение CHECK (Price > 0)
ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK (Price > 0);

-- 3. Добавить столбец StockQuantity с дефолтом 50
ALTER TABLE Products
ADD StockQuantity INT DEFAULT 50;

-- 4. Переименовать Category → ProductCategory
ALTER TABLE Products
 alter column Category, rename ProductCategory;
exec sp_rename 'Products.Category', 'ProductCategory', 'column';


-- 5. Вставить 5 записей
INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Supplier)
VALUES
(1, 'Laptop', 'Electronics', 1200.00, 'Dell'),
(2, 'Phone', 'Electronics', 800.00, 'Samsung'),
(3, 'Table', 'Furniture', 150.00, 'Ikea'),
(4, 'Chair', 'Furniture', 75.00, 'Ikea'),
(5, 'Watch', 'Accessories', 250.00, 'Casio');

-- 6. SELECT INTO для резервной таблицы
SELECT * INTO Products_Backup
FROM Products;

-- 7. Переименовать Products → Inventory
exec sp_rename Products, Inventory;

-- 8. Изменить тип Price с DECIMAL → FLOAT
ALTER TABLE Inventory
ALTER COLUMN Price Decimal;
select*from Inventory

ALTER TABLE Inventory
ALTER COLUMN Price Float;
select*from Inventory

-- 9. Добавить столбец ProductCode (IDENTITY, старт 1000, шаг 5)
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000, 5);
