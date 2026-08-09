
🛒 E-Commerce Sales Analysis

## 📌 Project Overview

This project presents an end-to-end analysis of e-commerce transaction data to understand sales performance, customer satisfaction, product category performance, regional performance, discount effectiveness, and delivery efficiency.

The goal is to transform raw transaction data into meaningful business insights and recommendations that can support better decision-making.

### Business Question

> **How can the company leverage its sales and customer transaction data to identify revenue trends, improve customer satisfaction, and optimize its regional and product strategies?**


# 🎯 Project Objectives

The main objectives of this project are to:

- Analyze overall sales and revenue performance
- Identify high-performing and low-performing product categories
- Compare revenue performance across regions
- Analyze monthly revenue trends
- Investigate the relationship between discounts and revenue
- Examine the relationship between delivery speed and customer satisfaction
- Build an interactive Power BI dashboard
- Generate actionable business recommendations



# 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python | Data cleaning and exploratory data analysis |
| Pandas | Data manipulation and cleaning |
| NumPy | Numerical analysis |
| Matplotlib | Data visualization |
| Seaborn | Exploratory visualization |
| Jupyter Notebook | Data analysis environment |
| MySQL | Database and SQL business analysis |
| MySQL Workbench | SQL query execution |
| Power BI | Interactive dashboard |
| DAX | Power BI measures |
| GitHub | Project documentation and version control |


# 🔄 End-to-End Project Workflow

The project follows a complete data analytics workflow:


Raw E-Commerce Dataset
        ↓
Python
        ↓
Data Cleaning
        ↓
Exploratory Data Analysis (EDA)
        ↓
Cleaned Dataset
        ↓
MySQL
        ↓
SQL Business Analysis
        ↓
Power BI
        ↓
Interactive Dashboard
        ↓
Business Insights & Recommendations


### Analytics Pipeline

**Python → Data Cleaning & EDA → MySQL → SQL Business Analysis → Power BI → Business Insights & Recommendations**

This workflow demonstrates how raw transaction data can be transformed into actionable business insights.


# 📊 Dataset

The dataset contains e-commerce transaction-level information.

### Main Columns

| Column             | Description                          |
| ------------------ | ------------------------------------ |
| `order_id`         | Unique order identifier              |
| `order_date`       | Date of the order                    |
| `customer_id`      | Customer identifier                  |
| `product_category` | Product category                     |
| `region`           | Region                               |
| `quantity`         | Quantity purchased                   |
| `unit_price`       | Price per unit                       |
| `discount`         | Discount applied                     |
| `payment_method`   | Payment method                       |
| `delivery_days`    | Number of days required for delivery |
| `customer_rating`  | Customer satisfaction rating         |
| `revenue`          | Revenue generated                    |



# 🧹 1. Data Cleaning with Python

The raw dataset was first loaded and analyzed using Python and Pandas.

### Data Cleaning Steps

* Loaded the raw dataset
* Inspected the dataset structure
* Checked data types
* Converted `order_date` into datetime format
* Checked duplicate records
* Removed duplicate records
* Checked missing values
* Inspected numerical and categorical variables
* Prepared the dataset for further analysis

### Date Conversion

python
df["order_date"] = pd.to_datetime(df["order_date"])


### Duplicate Removal

python
df = df.drop_duplicates()


### Missing Value Check

python
df.isnull().sum()


# 🔎 2. Exploratory Data Analysis (EDA)

Exploratory Data Analysis was performed to understand the major patterns and relationships in the dataset.

The EDA focused on important business areas including:

* Revenue performance
* Product category performance
* Regional performance
* Customer ratings
* Delivery performance
* Discount and revenue relationships
* Monthly revenue trends

The EDA helped identify important patterns that were further investigated using SQL and Power BI.


# 🗄️ 3. MySQL Database

After data preparation, the dataset was loaded into MySQL for deeper business analysis.

### Database

ecommerce_sales


### Table

customer

The database and table were verified using:

sql
use ecommerce_sales;

show tables;


# 📈 4. SQL Business Analysis

Five major business questions were analyzed using SQL.



## Q1. What are the total number of orders, total quantity sold, total revenue, and average order value?

### SQL Query

```sql
select
    count(order_id) as total_orders,
    sum(quantity) as total_quantity_sold,
    round(sum(revenue), 2) as total_revenue,
    round(avg(revenue), 2) as average_order_value
from customer;
```

### Business Purpose

This provides an overall view of the company's sales performance.

## Q2. Which product category contributes the most to total revenue?

### SQL Query

```sql
select
    product_category,
    count(order_id) as total_orders,
    sum(quantity) as total_quantity_sold,
    round(sum(revenue), 2) as total_revenue
from customer
group by product_category
order by total_revenue desc;
```

### Business Purpose

This identifies the product categories that contribute the most revenue.

---

## Q3. Which geographical region performs best in terms of sales revenue?

### SQL Query

```sql
select
    region,
    count(order_id) as total_orders,
    round(sum(revenue), 2) as total_revenue,
    round(avg(revenue), 2) as average_order_value
from customer
group by region
order by total_revenue desc;
```

### Business Purpose

This allows management to compare sales performance across different regions.

---

## Q4. How does discount level affect revenue?

### SQL Query

```sql
select
    case
        when discount < 0.10 then '0-10%'
        when discount < 0.20 then '10-20%'
        when discount < 0.30 then '20-30%'
        else '30%+'
    end as discount_range,
    count(order_id) as total_orders,
    round(avg(revenue), 2) as average_revenue,
    round(sum(revenue), 2) as total_revenue
from customer
group by
    case
        when discount < 0.10 then '0-10%'
        when discount < 0.20 then '10-20%'
        when discount < 0.30 then '20-30%'
        else '30%+'
    end
order by average_revenue desc;
```

### Business Purpose

This investigates whether different discount levels are associated with different revenue outcomes.

> **Note:** This analysis identifies association, not causation.

---

## Q5. Does delivery speed affect customer satisfaction?

### SQL Query

```sql
select
    case
        when delivery_days <= 3 then '1-3 days'
        when delivery_days <= 6 then '4-6 days'
        when delivery_days <= 9 then '7-9 days'
        else '10+ days'
    end as delivery_range,
    count(order_id) as total_orders,
    round(avg(customer_rating), 2) as average_rating
from customer
group by
    case
        when delivery_days <= 3 then '1-3 days'
        when delivery_days <= 6 then '4-6 days'
        when delivery_days <= 9 then '7-9 days'
        else '10+ days'
    end
order by average_rating desc;
```

### Business Purpose

This examines the relationship between delivery speed and customer satisfaction.

> **Note:** The analysis identifies an association between delivery time and customer ratings; it does not establish that delivery time directly causes changes in satisfaction.

---

# 📊 5. Power BI Dashboard

The cleaned MySQL data was connected to Power BI to create an interactive:

# **E-Commerce Sales Performance Dashboard**

The dashboard combines key performance indicators, sales trends, regional analysis, product analysis, discount analysis, and customer satisfaction analysis.

---

## 📌 KPI Cards

The dashboard contains three main KPI cards:

### Total Revenue

```DAX
Total Revenue = SUM(customer[revenue])
```

### Average Customer Rating

```DAX
Avg Customer Rating = AVERAGE(customer[customer_rating])
```

### Average Delivery Days

```DAX
Avg Delivery Days = AVERAGE(customer[delivery_days])
```

---

# 📈 Dashboard Visualizations

## 1. Revenue by Product Category

**Chart Type:** Clustered Column Chart

Shows revenue generated by each product category.

---

## 2. Total Revenue by Region

**Chart Type:** Bar Chart

Compares revenue performance across different regions.

---

## 3. Monthly Revenue Trend

**Chart Type:** Line Chart

Shows how revenue changes over time.

The `Month_Name` field was sorted using the numeric `Month` field to maintain chronological order.

```text
January
February
March
April
May
June
July
August
September
October
November
December
```

---

## 4. Discount vs Revenue

**Chart Type:** Scatter Chart

Shows the relationship between discount levels and revenue.

---

## 5. Delivery Days vs Customer Satisfaction

**Chart Type:** Scatter Chart

Shows the relationship between delivery time and customer ratings.

---

# 🎛️ Interactive Dashboard Filters

Two interactive slicers were added:

### Region Filter

Allows users to filter the dashboard by:

* East
* North
* South
* West

### Product Category Filter

Allows users to filter the dashboard by:

* Beauty
* Clothing
* Electronics
* Home

These slicers allow users to explore the business performance from different regional and product perspectives.

---

# 🔍 Key Findings

The analysis revealed several important business patterns.

### 💰 Overall Performance

* Total revenue is approximately **5.08 million**.
* Average customer rating is approximately **2.98 out of 5**.
* Average delivery time is approximately **6.1 days**.

The revenue performance is strong, but the relatively low customer rating suggests that customer experience requires attention.

---

### 🛍️ Product Category Performance

* **Electronics** generates the highest revenue.
* **Clothing** is the second strongest category.
* **Beauty** is the weakest-performing category in terms of revenue.

This suggests that the company should continue monitoring demand in high-performing categories while investigating opportunities to improve weaker categories.

---

### 🌍 Regional Performance

* The **north region** has the strongest revenue performance.
* The **East region** has the lowest revenue performance.

This indicates that regional strategies may need to be customized according to local customer behavior and demand.

---

### 🚚 Delivery & Customer Satisfaction

* Average delivery time is approximately **6.1 days**.
* The analysis indicates an association between longer delivery times and lower customer ratings.

Delivery performance therefore appears to be an important area for improving customer satisfaction.

---

### 🏷️ Discount Analysis

The analysis indicates that higher discounts do not consistently result in higher revenue.

This suggests that increasing discounts alone may not be an effective strategy for improving revenue.

---

# 💡 Business Recommendations

Based on the analysis, the following recommendations can be considered.

## 1. Improve Customer Satisfaction

The average rating of approximately 2.98 out of 5 indicates that customer satisfaction should be a major priority.

The company should investigate the main causes of low ratings and improve the overall customer experience.

---

## 2. Improve Delivery Performance

The company should work toward reducing the average delivery time from approximately 6 days.

A target of around **4–5 days** could be considered where operationally feasible.

The company could also consider offering faster delivery options.

---

## 3. Focus on High-Performing Categories

Electronics and Clothing are strong revenue-generating categories.

The company can continue investing in these categories while investigating why Beauty is performing relatively poorly.

---

## 4. Strengthen East Region Performance

The East region shows weaker revenue performance compared with the West.

The company could develop targeted marketing campaigns and promotions for the East region and investigate differences in customer demand and purchasing behavior.

---

## 5. Optimize Discount Strategy

Instead of relying on high discounts, the company should use more targeted and data-driven discount strategies.

Discounts could be focused on specific products, customer segments, or campaigns where they are most likely to generate additional value.

---

# 📸 Dashboard Preview

![E-Commerce Sales Dashboard](e-commerce%20analysis%20sales%20dashboard.png)

---

# 📁 Project Structure

```text
ecommerce-sales-analysis/
│
├── data/
│   └── ecommerce_sales.csv
│
├── notebooks/
│   └── Ecommerce_Sales_Analysis.ipynb
│
├── sql/
│   └── ecommerce_sales_analysis.sql
│
├── powerbi/
│   └── ecommerce_sales_dashboard.pbix
│
│
└── README.md
```

---

# 🧠 Skills Demonstrated

This project demonstrates practical experience with:

```text
Python
Pandas
NumPy
Data Cleaning
Exploratory Data Analysis
Data Visualization
SQL
MySQL
Business Analysis
Power BI
DAX
Data Modeling
Dashboard Design
Business Intelligence
Business Recommendations
```

---

# 🚀 Future Improvements

The project can be further extended with:

* Customer retention analysis
* Repeat customer analysis
* Payment method performance analysis
* Customer segmentation
* Customer Lifetime Value (CLV)
* Profitability analysis
* Sales forecasting
* Advanced DAX measures
* Automated MySQL-to-Power BI data refresh
* More advanced customer behavior analysis

---

# ✅ Project Status

## Completed

* [x] Data loading
* [x] Data cleaning
* [x] Data type checking
* [x] Duplicate checking and removal
* [x] Missing value analysis
* [x] Date conversion
* [x] Exploratory Data Analysis
* [x] MySQL database setup
* [x] SQL business analysis
* [x] Power BI data connection
* [x] DAX measures
* [x] KPI cards
* [x] Product category analysis
* [x] Regional analysis
* [x] Monthly revenue trend
* [x] Discount analysis
* [x] Delivery and customer satisfaction analysis
* [x] Interactive region slicer
* [x] Interactive product category slicer
* [x] Power BI dashboard
* [x] Business findings
* [x] Business recommendations



---

# 👩‍💻 Author

**Towsifa Towa**

Data Analyst | Python | SQL | Power BI | Data Analytics

---

# 📌 Conclusion

This project demonstrates a complete end-to-end data analytics workflow, starting from raw e-commerce transaction data and progressing through data cleaning, exploratory analysis, SQL-based business analysis, and interactive Power BI visualization.

The project transforms transaction-level data into actionable business insights related to:

**Revenue Growth • Product Strategy • Regional Performance • Discount Strategy • Delivery Operations • Customer Satisfaction**

The overall analysis demonstrates how Python, SQL, and Power BI can be combined to support data-driven business decision-making.

```
```
