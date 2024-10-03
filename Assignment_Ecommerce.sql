-- Create Categories Table
CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(100),
    Description VARCHAR(255)
);

-- Create Products Table
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Description VARCHAR(255),
    Price DECIMAL(10, 2),
    Stock_Quantity INT,
    Category_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);

-- Create Customers Table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone_Number VARCHAR(20),
    Address VARCHAR(255)
);

-- Create Orders Table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10, 2),
    Status VARCHAR(50),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

-- Create Order_Items Table
CREATE TABLE Order_Items (
    Order_Item_ID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- Create Payments Table
CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Payment_Date DATE,
    Amount DECIMAL(10, 2),
    Payment_Method VARCHAR(50),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

-- Insert into Categories
INSERT INTO Categories (Category_ID, Category_Name, Description) 
VALUES (1, 'Electronics', 'Devices and gadgets'), (2, 'Clothing', 'Men and women clothing');

-- Insert into Products
INSERT INTO Products (Product_ID, Name, Description, Price, Stock_Quantity, Category_ID) 
VALUES (1, 'Smartphone', 'Latest model', 599.99, 100, 1), 
       (2, 'T-shirt', 'Cotton T-shirt', 19.99, 500, 2);

-- Insert into Customers
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address) 
VALUES (1, 'Frederic', 'ALLOGHO', 'frederic@gmail.com', '123-456-7890', 'KK 182 St');

-- Insert into Orders
INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Amount, Status) 
VALUES (1, 1, '2024-09-01', 619.98, 'Completed');

-- Insert into Order_Items
INSERT INTO Order_Items (Order_Item_ID, Order_ID, Product_ID, Quantity, Subtotal) 
VALUES (1, 1, 1, 1, 599.99), (2, 1, 2, 1, 19.99);

-- Insert into Payments
INSERT INTO Payments (Payment_ID, Order_ID, Payment_Date, Amount, Payment_Method) 
VALUES (1, 1, '2024-09-02', 619.98, 'Credit Card');

-- Update Stock Quantity after an order
UPDATE Products
SET Stock_Quantity = Stock_Quantity - 1
WHERE Product_ID = 1;

-- Delete a Product
DELETE FROM Products
WHERE Product_ID = 2;

-- Retrieve all Orders with Customer and Payment Info
SELECT Orders.Order_ID, Customers.First_Name, Customers.Last_Name, Payments.Payment_Method, Orders.Total_Amount
FROM Orders
JOIN Customers ON Orders.Customer_ID = Customers.Customer_ID
JOIN Payments ON Orders.Order_ID = Payments.Order_ID;

-- Retrieve Order Items with Product Information
SELECT Order_Items.Order_ID, Products.Name, Order_Items.Quantity, Order_Items.Subtotal
FROM Order_Items
JOIN Products ON Order_Items.Product_ID = Products.Product_ID;

-- Retrieve Customers who placed orders totaling more than $600
SELECT First_Name, Last_Name
FROM Customers
WHERE Customer_ID IN (SELECT Customer_ID FROM Orders WHERE Total_Amount > 600);

-- Grant select and insert permissions to a user
GRANT SELECT, INSERT ON Products TO user_role;

-- Revoke insert permission from a user
REVOKE INSERT ON Products FROM user_role;

