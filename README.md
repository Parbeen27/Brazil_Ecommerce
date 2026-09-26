# Brazil_Ecommerce

## Project Overview

Analysing Brazil Ecommerce

## Dataset

Brazilian E-Commerce Public Dataset by Olist

total_orders	98666
Total_customer	95420
unique_products	32951
total_sellers	3095
product_sales	13591643.70
total_freight	2251909.54
total_order_value	15843553.24
avg_order_value	160.58

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
## Project Structure

```text
data/
Excel/
notebooks/
PowerBI/
reports/
└── figures/
sql/

Step	Analysis	SQL skills
1	Executive KPIs	COUNT, SUM, AVG, DISTINCT
2	Data quality	GROUP BY, HAVING, NULL checks
3	Order status	Aggregation + window functions
4	Monthly sales	Date functions + joins
5	Sales growth	CTE + LAG()
6	Customer analysis	customer_unique_id
7	Repeat customers	CTE + CASE
8	Customer LTV	Aggregation
9	Product/category analysis	Multiple joins
10	Seller performance	Window functions + ranking
11	Delivery performance	Date arithmetic
12	Late delivery analysis	CASE WHEN
13	Reviews vs delivery	Multiple tables
14	Geographic analysis	Aggregation
15	RFM segmentation	NTILE() + CTEs
16	Final business insights	Storytelling