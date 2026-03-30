sql/
├── 01_data_loading.sql
├── 02_data_cleaning.sql
├── 03_city_product_analysis.sql
├── 04_customer_analysis.sql   
├── README.md

## 🧹 Day 1: Data Cleaning

- Loaded raw CSV data into MySQL
- Fixed data type issues (customer_id → VARCHAR)
- Converted timestamp to DATETIME format
- Standardized boolean values (TRUE/FALSE → 1/0)
- Handled missing values using TRIM and NULLIF
- Resolved duplicate primary key issues
✅ Clean dataset ready for analysis

## 📊 Day 2: Data Analysis

Performed SQL-based analysis to extract business insights from the cleaned dataset.
🔹 1. Transactions by City
Identified cities with the highest number of transactions.
Top Cities:
- New York: 2288
- Vancouver: 2287
- Toronto: 2284
🔹 2. Top 5 Cities by Revenue
Analyzed total revenue generated per city.
Top 5 Cities:
1. New York – 17047.59
2. Melbourne – 16852.38
3. Sydney – 16828.36
4. Los Angeles – 15816.92
5. Chicago – 15532.80
🔹 3. Most Sold Products
Identified top-selling products based on quantity.
Example:
- Small Mocha (Chicago) – 175 units
- Large Cappuccino (Sydney) – 161 units
🔹 4. Product Performance by City
Used window functions (RANK) to find top products in each city.
🔹 5. Discount Analysis
Calculated average discount applied on products across cities.
Insight:
Some products receive higher discounts in specific cities (e.g., Chicago)
🔹 6. Revenue Contribution
Calculated percentage contribution of each product to total city revenue.
🔹 7. Average Transaction Value
Analyzed average transaction amount per product and city.
Insight:
Tote Bag shows highest average transaction value across multiple cities
🔹 8. Discount Impact Analysis
Compared revenue with and without discounts.
Insight:
- Discounted transactions often result in lower average revenue per product

## 💡 Key Insights
- New York generates the highest revenue and transactions
- Beverage items dominate top-selling products
- Discounts impact revenue significantly
- Certain products perform consistently across multiple cities

## 📊 Day 3: Customer Analysis

### 🔹 Objective
Analyze customer behavior across cities to understand spending patterns and preferences.

### 🔹 Tasks Performed
- Analyzed transactions by payment method across age groups and cities
- Identified top payment method per age group using window functions (RANK)
- Calculated revenue contribution of each customer age group
- Compared revenue from loyalty vs non-loyalty customers
- Calculated average customer spending per city
- Analyzed revenue distribution by gender
- Counted unique customers in each city
- Identified top customers based on total spending

### 🛠️ Skills Used
SQL | GROUP BY | Aggregations | Window Functions (RANK) | Customer Analysis

### 💡 Key Insights
- Payment preferences vary across age groups and cities
- Loyalty customers contribute significantly to total revenue
- A small group of customers drives a large portion of revenue
- Customer spending patterns differ across cities
## 📅 Day 4 — Store Analysis

Focused on analyzing store-level performance across different cities and store types.

### 🔹 Key Analysis Performed

- Total number of stores in each city  
- Transactions by store type in each city  
- Store distribution by city, country, and type  
- Product category availability across store types  
- Number of unique products per store type  
- Total quantity sold by store type  

### 🔹 Business Insights

- Classified store types as **Premium** or **Cheap** based on average revenue per unit  
- Identified top 3 payment methods per store type  
- Analyzed daily transaction trends per store type  
- Evaluated monthly revenue performance  
- Ranked store types based on monthly revenue  

### 📊 Focus Area
Understanding how store types contribute to:
- Sales volume  
- Revenue generation  
- Customer payment behavior  
## 📌 Final Conclusion

This project analyzed coffee shop sales data from multiple perspectives including city performance, product trends, customer behavior, and store-level insights.

### 🔹 Key Findings

- Sales are concentrated in specific cities, indicating strong demand clusters  
- Certain products consistently drive higher sales across locations  
- Customer segments (age group, loyalty members) show different spending behaviors  
- Discounts influence transaction value but vary across products  
- Store types differ in performance, with some generating higher revenue per unit (Premium vs Cheap)  

### 🔹 Store-Level Insights

- Store type plays a significant role in revenue generation and product distribution  
- Payment method preferences vary across store types  
- Monthly revenue trends highlight performance differences between store categories  

### 🔹 Overall Understanding

The analysis highlights how:
- Location  
- Product mix  
- Customer behavior  
- Store strategy  

collectively impact business performance.

### 🚀 Final Note

This project demonstrates end-to-end analysis using SQL — from data cleaning to extracting meaningful business insights.
