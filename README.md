coffee-sales-project/
│
├── data/
│   └── coffee_sales.csv
│
├── sql/
│   ├── 01_data_loading.sql
│   ├── 02_data_cleaning.sql
│   └── 03_analysis.sql   
│
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
