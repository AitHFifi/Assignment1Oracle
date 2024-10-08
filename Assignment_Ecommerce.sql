-- Create Categories Table to store different Categories
CREATE TABLE Categories (
    Category_ID NUMBER PRIMARY KEY NOT NULL,       -- Unique ID for each Category
    Category_Name VARCHAR2(100) NOT NULL,        -- Name for each Category
    Description VARCHAR2(255)            -- Description of each category 
);

-- Create Products Table to store different Products
CREATE TABLE Products (
    Product_ID NUMBER PRIMARY KEY NOT NULL,        -- Unique ID for each Product
    Name VARCHAR2(100) NOT NULL,                    -- Name for each Product
    Description VARCHAR2(255),             -- Description of each Product 
    Price DECIMAL(10, 2),                 -- Proce of each product with 10 numbers maximum and 2 numbers after the colon
    Stock_Quantity NUMBER,                -- Quantity of each product
    Category_ID,                          -- Foreign key referencing Category table
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)  -- Establishing a relationship with the Category table
);

-- Create Customers Table to identify different Customers
CREATE TABLE Customers ( 
    Customer_ID NUMBER PRIMARY KEY,         -- Unique ID for each Customer
    First_Name VARCHAR2(50) NOT NULL,    -- Customer's first name     
    Last_Name VARCHAR2(50) NOT NULL,     -- Customer's last name    
    Email VARCHAR2(100) UNIQUE NOT NULL, -- Employee's email (must be unique)             
    Phone_Number VARCHAR2(20),            -- Employee's phone number
    Address VARCHAR2(255)                    -- Employee's address
);

-- Create Orders Table to record different Orders
CREATE TABLE Orders (
    Order_ID NUMBER PRIMARY KEY UNIQUE NOT NULL,        -- Unique ID for each Order
    Customer_ID NUMBER,                                 -- Foreign key referencing Customers table
    Order_Date DATE,                                    -- Order's date
    Total_Amount DECIMAL(10, 2),                        -- Price of the total with 10 numbers maximum and 2 numbers after the colon
    Status VARCHAR2(50) CHECK (Status IN ('Completed', 'Pending', 'Aborted')),     -- Order status (Completed, Pending, Aborted)                           
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)            -- Establishing a relationship with the Orders table
);

-- Create Order_Items Table to record different Items in the Order
CREATE TABLE Order_Items (
    Order_Item_ID NUMBER PRIMARY KEY,             -- Unique ID for each Order_Items
    Order_ID NUMBER,                              -- Foreign key referencing Orders table
    Product_ID NUMBER,                            -- Foreign key referencing Products table
    Quantity NUMBER,                              -- Numbers of products 
    Subtotal DECIMAL(10, 2),                      -- Price of the subtotal with 10 numbers maximum and 2 numbers after the colon
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID), -- Establishing a relationship with the Orders table
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID) -- Establishing a relationship with the Products table
);

-- Create Payments Table to record different Payments
CREATE TABLE Payments (
    Payment_ID NUMBER PRIMARY KEY UNIQUE NOT NULL,
    Order_ID NUMBER,            -- Foreign key referencing Orders table
    Payment_Date DATE,          -- Date of the payment 
    Amount DECIMAL(10, 2),      -- Amount of the Payment with 10 numbers maximum and 2 numbers after the colon
    Payment_Method VARCHAR2(4) CHECK (Payment_Method IN ('Cash', 'Card'),   -- Payment_Method (Cash, Card) 
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)  -- Establishing a relationship with the Orders table
);
