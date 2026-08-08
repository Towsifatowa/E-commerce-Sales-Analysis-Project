USE ecommerce_sales;
SHOW TABLES;
USE ecommerce_sales;
SELECT * FROM customer;

-- Q1 What are the total number of orders, total quantity sold, total revenue, and average order value?
SELECT
    COUNT(order_id) AS total_orders,
    SUM(quantity) AS total_quantity_sold,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(AVG(revenue), 2) AS average_order_value
FROM customer;

-- Q2 Which product category contributes the most to total revenue?
select
    product_category,
    count(order_id) as total_orders,
    sum(quantity) as total_quantity_sold,
    round(sum(revenue), 2) as total_revenue
from customer
group by product_category
order by total_revenue desc;

-- Q3 Which geographical region performs best in terms of sales revenue?
select
    region,
    count(order_id) as total_orders,
    round(sum(revenue), 2) as total_revenue,
    round(avg(revenue), 2) as average_order_value
from customer
group by region
order by total_revenue desc;

-- Q4 How does discount level affect revenue?
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

-- Q5 Does delivery speed affect customer satisfaction? 
SELECT
    CASE
        WHEN delivery_days <= 3 THEN '1-3 days'
        WHEN delivery_days <= 6 THEN '4-6 days'
        WHEN delivery_days <= 9 THEN '7-9 days'
        ELSE '10+ days'
    END AS delivery_range,

    COUNT(order_id) AS total_order,
    ROUND(AVG(customer_rating), 2) AS average_rating

FROM customer

GROUP BY
    CASE
        WHEN delivery_days <= 3 THEN '1-3 days'
        WHEN delivery_days <= 6 THEN '4-6 days'
        WHEN delivery_days <= 9 THEN '7-9 days'
        ELSE '10+ days'
    END

ORDER BY average_rating DESC;