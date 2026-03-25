USE coffee_sales;
/* Find the number of transactions for each payment method used by each customer age group in each city.*/
SELECT payment_method,
       customer_age_group,
       city,
       COUNT(*) AS num_transactions
FROM sales
GROUP BY payment_method, customer_age_group, city
ORDER BY COUNT(*) DESC;

/*Find top payment method per age group per city using RANK()*/

Select payment_method, customer_age_group, city,
count(*) as num_of_transactions, 
rank() over (partition by customer_age_group, city 
order by num_of_transactions desc) as rank_payment_method 
from
(Select payment_method, customer_age_group, city, count(*) as num_of_transactions
from sales
 group by payment_method, customer_age_group, city) as t group by payment_method, customer_age_group, city;

/* Find the percentage contribution of each customer age group to total revenue in each city.*/
Select customer_age_group, city, total_revenue, 
total_city_revenue, 
(total_revenue*100/total_city_revenue) as percent_customer
 from
(Select customer_age_group, city,
 sum(total_amount) as total_revenue, 
 sum(sum(total_amount)) OVER (partition by city) as total_city_revenue
 from sales 
 group by customer_age_group, city) as t;

/*Compare revenue from loyalty vs non-loyalty customers in each city*/

Select city, sum(case when loyalty_member = "yes" then total_amount end) as loyal_customers,
 sum(case when loyalty_member = "no" then total_amount end) as disloyal_customers 
 from sales group by city;

/*Calculate the average of total spending per customer for each city.*/
Select city, total_spent, 
avg(total_spent) as avg_spending
 from
(Select customer_id, city, sum(total_amount) as total_spent
 from sales 
group by customer_id, city) 
as t group by customer_id, city;

/*Find total revenue by gender in each city*/
Select city, customer_gender, sum(total_amount) as total_revenue from sales 
group by city, customer_gender 
order by sum(total_amount) desc;

/*Find number of unique customers in each city*/
Select city, count( distinct customer_id) as unique_customers 
from sales 
group by city;

/* Find the top 5 customers by total spending in each city */
Select * from 
(Select city, customer_id, total_spent, 
RANK () over (partition by city order by total_spent desc ) as rank_customers 
from
 (Select city, customer_id, sum(total_amount) as total_spent
 from sales 
group by city, customer_id) as t ) as rank_data
where rank_customers <= 5;

