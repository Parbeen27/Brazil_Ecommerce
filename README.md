# Brazil_Ecommerce

## Project Overview

Analyze Olist's Brazilian e-commerce marketplace using SQL,Python,Excel,PowerBI
to understand sales performance, customer behavior,
delivery performance, and product/category trends.

## Dataset

Brazilian E-Commerce Public Dataset by Olist

## Business Questions

1. How is overall marketplace performance?
2. How has order/revenue volume changed over time?
3. What proportion of customers make repeat purchases?
4. Which product categories drive revenue?
5. How do delivery delays affect customer reviews?
6. Which states generate the most sales?
7. How significant is freight cost across categories?

## SQL Skills Demonstrated

- JOINs
- CTEs
- CASE statements
- Aggregations
- Window functions
- Date functions
- Conditional aggregation
- Subqueries
- Data quality checks


## Key Findings
delivered        96478
shipped          1107
canceled         625
unavailable      609
invoiced         314
processing       301
created          5
approved         2

year total_orders product_sales freight  total_sales
2016	267	    40470.98	6182.76	    46653.74
2017	43428	5962902.01	958633.23	6921535.24
2018	52783	7218125.12	1233459.65	8451584.77


"The majority of orders reached the delivered status, while a small proportion were canceled or unavailable."

4869f7a5dfa277a7dca6462dcf3b52b2 this seller generate high revenue because of high orders and unit solds with avg review of 4.1

--SP state has more orders and more revenue beacuse many customers live there.


## Project Structure

```text
data/
Excel/
notebooks/
PowerBI/
reports/
└── figures/
sql/
