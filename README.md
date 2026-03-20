coffee-sales-project/
│
├── data/
│   └── coffee_sales.csv
│
├── sql/
│   ├── 01_data_loading.sql
│   ├── 02_data_cleaning.sql
│   └── 03_analysis.sql   (you’ll add tomorrow)
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
