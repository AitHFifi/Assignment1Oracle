-- Insert into Categories
INSERT INTO Categories (Category_ID, Category_Name, Description) 
VALUES (1, 'Electronics', 'Devices and gadgets');

INSERT INTO Categories (Category_ID, Category_Name, Description) 
VALUES (2, 'Clothing', 'Men and women clothing');

INSERT INTO Categories (Category_ID, Category_Name, Description) 
VALUES (3, 'Shoes', 'Men and women shoes');

COMMIT;

-- Insert into Products
INSERT INTO Products (Product_ID, Name, Description, Price, Stock_Quantity, Category_ID) 
VALUES (100, 'Smartphone', 'Latest model', 599.99, 100, 1);

INSERT INTO Products (Product_ID, Name, Description, Price, Stock_Quantity, Category_ID) 
VALUES (200, 'T-shirt', 'Cotton T-shirt', 19.99, 500, 2);

INSERT INTO Products (Product_ID, Name, Description, Price, Stock_Quantity, Category_ID) 
VALUES (300, 'Shoes', 'NIKE', 199.99, 50, 3);

COMMIT;

-- Insert into Customers
INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address) 
VALUES (10, 'Frederic', 'ALLOGHO', 'frederic@gmail.com', '0789 999 999', 'KK 182 St');

INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES (11, 'Richard', 'OYONO', 'richard@gmail.com', '0790 000 000', 'KK 14 St');

INSERT INTO Customers (Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES (12, 'Francis', 'RAUSSEMOND', 'francis@gmail.com', '0792 123 456', 'KG 148 St');

COMMIT;

-- Insert into Orders
INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Amount, Status) 
VALUES (1000, 10, TO_DATE('2024-09-01', 'YYYY-MM-DD') 619.98, 'Completed');

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Amount, Status) 
VALUES (1001, 11, TO_DATE('2024-10-05', 'YYYY-MM-DD') 199.99, 'Pending');

INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Amount, Status) 
VALUES (1002, 12, TO_DATE('2024-08-10','YYYY-MM-DD') 1199.98, 'Aborted');

COMMIT;

-- Insert into Order_Items
INSERT INTO Order_Items (Order_Item_ID, Order_ID, Product_ID, Quantity, Subtotal) 
VALUES (1, 1000, 1, 100, 599.99);

INSERT INTO Order_Items (Order_Item_ID, Order_ID, Product_ID, Quantity, Subtotal) 
VALUES (2, 1, 1000, 200, 19.99);

INSERT INTO Order_Items (Order_Item_ID, Order_ID, Product_ID, Quantity, Subtotal) 
VALUES (3, 1001, 3, 300, 199.99);

INSERT INTO Order_Items (Order_Item_ID, Order_ID, Product_ID, Quantity, Subtotal) 
VALUES (4, 1002, 1, 300, 599.99);

COMMIT;

-- Insert into Payments
INSERT INTO Payments (Payment_ID, Order_ID, Payment_Date, Amount, Payment_Method) 
VALUES (10000, 1000, TO_DATE('2024-09-02','YYYY-MM-DD'), 619.98, 'Card');

INSERT INTO Payments (Payment_ID, Order_ID, Payment_Date, Amount, Payment_Method) 
VALUES (10001, 1001, TO_DATE('2024-10-05','YYYY-MM-DD'), 199.99, 'Cash');

INSERT INTO Payments (Payment_ID, Order_ID, Payment_Date, Amount, Payment_Method) 
VALUES (10002, 1003, TO_DATE('2024-08-10','YYYY-MM-DD'), 1199.98, 'None');

COMMIT;



