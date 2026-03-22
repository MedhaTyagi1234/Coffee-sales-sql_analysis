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

ALTER TABLE sales 
MODIFY discount_applied BOOLEAN;
ALTER TABLE sales 
MODIFY customer_id VARCHAR(50);
TRUNCATE TABLE sales;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/coffee_sales.csv'
INTO TABLE sales
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
transaction_id,
@timestamp,
store_id,
city,
country,
store_type,
product_category,
product_name,
@unit_price,
@quantity,
@discount,
payment_method,
customer_id,
customer_age_group,
customer_gender,
loyalty_member,
weather_condition,
@temperature,
holiday_name,
@total_amount
)
SET 
timestamp = STR_TO_DATE(@timestamp, '%d/%m/%Y %H:%i'),
unit_price = NULLIF(TRIM(@unit_price), ''),
quantity = NULLIF(TRIM(@quantity), ''),
temperature_c = NULLIF(TRIM(@temperature), ''),
total_amount = NULLIF(TRIM(@total_amount), ''),
discount_applied = IF(UPPER(TRIM(@discount)) = 'TRUE', 1, 0);
SELECT * FROM sales LIMIT 10;

/*Find the total number of transactions in each city.*/
SELECT city, COUNT(*) AS num_of_transactions
FROM sales
GROUP BY city
ORDER BY num_of_transactions DESC;

/*Find the total revenue in each city and list the top 5 cities by revenue.*/
SELECT city,
       COUNT(*) AS num_of_transactions,
       SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC
LIMIT 5;

/*Find the number of unique products available in each city by product category.*/
SELECT product_category,
       product_name,
       city,
       SUM(quantity) AS num_of_products
FROM sales
GROUP BY product_category, product_name, city
ORDER BY num_of_products DESC
LIMIT 10;

/*Find the top most sold products in each city based on quantity.*/
SELECT city,product_name,quantity_of_products,
RANK() OVER (PARTITION BY city ORDER BY quantity_of_products DESC) AS product_rank
FROM (
    SELECT city,
           product_name,
           SUM(quantity) AS quantity_of_products
    FROM sales
    GROUP BY city, product_name
) AS t;

/*Find the average discount applied on each product in each city.*/
SELECT product_name,
       city,
       AVG(discount_applied) AS avg_discount
FROM sales
GROUP BY product_name, city
ORDER BY AVG(discount_applied) DESC;

/*Find the top-selling product in each city based on total revenue (total_amount).*/
SELECT city,
       product_name,
       total_revenue,
       RANK() OVER (PARTITION BY city ORDER BY total_revenue DESC) AS product_rank
FROM (
    SELECT city,
           product_name,
           SUM(total_amount) AS total_revenue
    FROM sales
    GROUP BY city, product_name
) AS t;

/*Find the percentage contribution of each product to the total revenue of its city.*/
SELECT city,
       product_name,
       total_revenue,
       total_city_revenue,
       (total_revenue * 100.0 / total_city_revenue) AS product_percent
FROM (
    SELECT city,
           product_name,
           SUM(total_amount) AS total_revenue,
           SUM(SUM(total_amount)) OVER (PARTITION BY city) AS total_city_revenue
    FROM sales
    GROUP BY city, product_name
) AS t;

/*Find the average transaction value for each product in each city.*/
SELECT product_name, city, AVG(total_amount) AS average_transaction
FROM sales
GROUP BY product_name, city
ORDER BY AVG(total_amount) DESC;

/*Compare average revenue of transactions with discount vs without discount for each product in each city.*/
SELECT product_name,
       city,
       AVG(CASE WHEN discount_applied = 1 THEN total_amount END) AS avg_with_discount,
       AVG(CASE WHEN discount_applied = 0 THEN total_amount END) AS avg_without_discount
FROM sales
GROUP BY product_name, city;



