CREATE DATABASE wonka_factory_db;

USE wonka_factory_db;

CREATE TABLE wonka_sales (
    Row_ID INT PRIMARY KEY,
    Order_ID VARCHAR(50),
    Order_Date VARCHAR(20),  
    Ship_Date VARCHAR(20),
    Ship_Mode VARCHAR(20),
    Customer_ID INT,
    Country_Region VARCHAR(50),
    City VARCHAR(50),
    State_Province VARCHAR(50),
    Postal_Code VARCHAR(20),
    Division VARCHAR(30),
    Region VARCHAR(20),
    Product_ID VARCHAR(30),
    Product_Name VARCHAR(100),
    Sales DECIMAL(10, 2),
    Units INT,
    Gross_Profit DECIMAL(10, 2),
    Cost DECIMAL(10, 2)
);


CREATE VIEW cleaned_wonka_sales AS
SELECT 
    Row_ID, Order_ID,
    STR_TO_DATE(Order_Date, '%d-%m-%Y') AS Order_Date,
    STR_TO_DATE(Ship_Date, '%d-%m-%Y') AS Ship_Date,
    Ship_Mode, Customer_ID, Country_Region, City, State_Province,
    Postal_Code, Division, Region, Product_ID, Product_Name,
    Sales, Units, Gross_Profit, Cost,
    DATEDIFF(STR_TO_DATE(Ship_Date, '%d-%m-%Y'), STR_TO_DATE(Order_Date, '%d-%m-%Y')) AS Delivery_Days,
    ROUND(((Gross_Profit / Sales) * 100), 2) AS Profit_Margin_Percentage
FROM wonka_sales;
