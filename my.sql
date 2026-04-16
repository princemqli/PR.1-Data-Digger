CREATE DATABASE DataDigger;
USE DataDigger;
CREATE TABLE Customers (
   Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(100)
);
INSERT INTO Customers VALUES
(1, 'Prince', 'Prince@gmail.com', 'Rajasthan'),
(2, 'Alice', 'Alice@gmail.com', 'Mumbai'),
(3, 'Priya', 'priya@gmail.com', 'Ahmedabad'),
(4, 'Amit', 'amit@gmail.com', 'Pune'),
(5, 'Sneha', 'sneha@gmail.com', 'Jaipur');
select * from Customers;
Update Customers
set Address = 'Bangalore'
where Customer_ID = 2;
delete from  Customers 
where Customer_ID = 5;
select * from Customers 
where Name = 'Alice';
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    OrderDate DATE,
    TotalAmount INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);
INSERT INTO Orders VALUES
(101, 1, '2024-03-01', 1500),
(102, 2, '2024-03-10', 2000),
(103, 3, '2024-03-15', 800),
(104, 1, '2024-04-01', 1200),
(105, 4, '2024-04-05', 3000);
select * from Orders;
select * from Orders 
where Customer_ID = 1;
Update Orders 
set TotalAmount = 2500
where Order_ID = 102;
delete from Orders
where Order_ID = 103;
select * from Orders
where OrderDate >= '2024-03-01';
select max(TotalAmount) as Highest,
min(TotalAmount) as Lowest,
avg(TotalAmount) as Average
from Orders;
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price INT,
    Stock INT
);
INSERT INTO Products VALUES
(1, 'Laptop', 50000, 10),
(2, 'Mobile', 20000, 0),
(3, 'Headphones', 1500, 25),
(4, 'Keyboard', 800, 15),
(5, 'Mouse', 500, 30);
select * from Products;
select * from Products
order by price desc;
Update Products
set Price = 1800
where Product_ID = 3;
delete from Products
where Stock = 0;
select * from Products
where  Price between 500 and 2000;
select max(Price) as Expensive,min(Price) as Cheapest FROM Products;
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    SubTotal INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);
INSERT INTO OrderDetails VALUES
(1, 101, 1, 1, 50000),
(2, 102, 2, 1, 20000),
(3, 104, 3, 2, 3000),
(4, 105, 4, 3, 2400),
(5, 105, 5, 2, 1000);
select * from OrderDetails;
select * from OrderDetails
where Order_ID = 105;
select count(*) from OrderDetails;
select Product_ID, Quantity
from OrderDetails
order by Quantity DESC;
select COUNT(*) 
from OrderDetails
where Product_ID = 1;