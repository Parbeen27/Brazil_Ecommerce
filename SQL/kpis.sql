-- KPI`s values

--total orders
SELECT COUNT(DISTINCT order_id) AS total_orders FROM orders;
--99441

--total unique customers
SELECT COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customer;
--96096

--Total Revnue
SELECT
    SUM(price) product_revenue,
    sum(freight_value) total_freight,
    sum(price + freight_value) as gross_order_value
from item --13591643.70	2251909.54	15843553.24

--Average order value
with
    order_totals AS (
        SELECT order_id, SUM(price + freight_value) as order_value
        from item
        GROUP BY
            order_id
    )
SELECT AVG(order_value) as Avg_order_value
from order_totals --160.577638

--Average review score
SELECT ROUND(AVG(review_score), 2) as AVG_review_score FROM review;
--4.09

--cancellation rate
SELECT ROUND(
        100 * SUM(
            CASE
                WHEN order_status = 'canceled' THEN 1
                ELSE 0
            END
        ) / COUNT(*), 2
    ) AS cancellation_rate
from orders;
--0.63

--Delivery Rate
SELECT 
  ROUND(
    100 * SUM(
        CASE 
            WHEN order_status = 'delivered' THEN 1 
            ELSE  0
        END
    ) / COUNT(*), 2
  ) as delivery_rate
from orders;  --97.02

