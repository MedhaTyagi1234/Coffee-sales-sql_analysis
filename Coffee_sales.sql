CREATE DATABASE coffee_sales;
USE coffee_sales;
CREATE TABLE sales(
transaction_id INT PRIMARY KEY,
timestamp DATETIME,
store_id INT,
city VARCHAR(50),
country VARCHAR(50),
store_type VARCHAR(50),
product_category VARCHAR(100),
product_name VARCHAR(100),
unit_price DECIMAL(10,2),
quantity INT,
discount_applied DECIMAL(5,2),
payment_method VARCHAR(50),
customer_id INT,
customer_age_group VARCHAR(20),
customer_gender VARCHAR(20),
loyalty_member VARCHAR(20),
weather_condition VARCHAR(50),
temperature_c DECIMAL(10,2),
holiday_name VARCHAR(100),
total_amount DECIMAL(10,2));

SHOW VARIABLES LIKE
'secure_file_priv';

D:/AMedha/Self practice/coffee_sales.csv
→
C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/coffee_sales.csv
USE coffee_sales;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/coffee_sales.csv'
INTO TABLE sales
CHARACTER SET latin1
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
    ESCAPED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_rows FROM sales;
SELECT * FROM sales LIMIT 5;

LOAD DATA INFILE 'D:/AMedha/Self practice/coffee_sales.csv'
INTO TABLE sales
CHARACTER SET latin1
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
    ESCAPED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;