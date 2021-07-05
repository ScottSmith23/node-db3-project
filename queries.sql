-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
Select ProductName, Categoryname 
from product as p 
join category as c on p.CategoryId = c.Id
-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id, CompanyName
FROM [Order] as o
join shipper as sh on o.shipvia = sh.Id
where o.OrderDate < "2012-08-09"
-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT o.Id, od.Quantity, p.Productname
FROM [Order] as o
join [OrderDetail] as od on o.Id = od.OrderId
join [Product] as p on od.ProductId = p.Id
where o.Id = "10251"
-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id as "Order ID", c.CompanyName as "Customer's Company Name", e.LastName as "Employee's Lastname"
FROM [Order] as o
join [Customer] as c on o.CustomerId = c.Id
join [Employee] as e on o.EmployeeId = e.Id

-- Stretch Problems

--Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
SELECT c.CategoryName, count(p.CategoryID) as "Count"
FROM [Products] as p
join [Categories] as c on p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
--Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
SELECT o.OrderID, count(od.ProductID) as "ItemCount"
FROM [Orders] as o
join [OrderDetails] as od on o.OrderID = od.OrderID
GROUP BY o.OrderID
