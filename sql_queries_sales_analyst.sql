CREATE DATABASE sales_project;
USE sales_project;
CREATE TABLE sales (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Region VARCHAR(50),
    Customer_Segment VARCHAR(50),
    Product_Category VARCHAR(50),
    Product_Name VARCHAR(100),
    Quantity INT,
    Unit_Price INT,
    Sales_Amount INT,
    Salesperson VARCHAR(50)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sales_Analyst_Project_1000Rows (1)(SalesData).csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Order_ID, Order_Date, Region, Customer_Segment,
 Product_Category, Product_Name, Quantity,
 Unit_Price, Sales_Amount, Salesperson);
SELECT SUM(Sales_Amount) AS Total_Sales
FROM sales; 
SELECT Region,
SUM(Sales_Amount) AS Revenue
FROM sales
GROUP BY Region;
SELECT Product_Name,
SUM(Sales_Amount) AS Revenue
FROM sales
GROUP BY Product_Name
ORDER BY Revenue DESC
LIMIT 10;
SELECT Salesperson,
SUM(Sales_Amount) AS Revenue
FROM sales
GROUP BY Salesperson
ORDER BY Revenue DESC;
SELECT MONTH(Order_Date) AS Month_No,
SUM(Sales_Amount) AS Revenue
FROM sales
GROUP BY MONTH(Order_Date)
ORDER BY Month_No;
 