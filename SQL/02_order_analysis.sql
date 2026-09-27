--Monthly total orders
SELECT
    DATE_FORMAT(order_purchase_timestamp,'%Y-%m') as month,
    count(order_id) as total_orders
from orders
group BY 1
ORDER BY 1;

--Monthly Revenue
SELECT
    DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') as month,
    SUM(i.price) as revnue
from orders o
join item i on o.order_id = i.order_id 
group BY 1
ORDER BY 1;

WITH monthly_orders AS (
    SELECT 
          DATE_FORMAT(o.order_purchase_timestamp,'%Y-%m') as month,
          o.order_id,
          sum(i.price + i.freight_value) as order_value
    from orders o
    join item i on o.order_id = i.order_id
    group by 1,2
)
select 
    month,
    count(*) as orders,
    SUM(order_value) as total_value,
    round(AVG(order_value),2) as aov
from monthly_orders
group by month
order by month;

--customer orders
with customer_orders as (
    select 
        c.customer_unique_id,
        count(DISTINCT o.order_id) as total_orders
    from customer c
    join orders o on c.customer_id=o.customer_id
    group by c.customer_unique_id
)
SELECT
    CASE 
        WHEN total_orders = 1 THEN 'One-Time'  
        ELSE  'Repeat'
    END as customer_type,
    count(*) as customers
from customer_orders
GROUP BY 1;

--top customers
SELECT
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS orders,
    SUM(oi.price + oi.freight_value) AS total_spend
FROM customer c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN item oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY total_spend DESC
LIMIT 10;


--delivery analysis
SELECT
    AVG(
        DATEDIFF(order_delivered_customer_date
        , order_purchase_timestamp)
    ) AS avg_delivery_date
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;
--12.4

select 
    COUNT(order_delivered_customer_date) as Total_delivery,
    sum(order_delivered_customer_date <= order_estimated_delivery_date) as on_time,
    sum(order_delivered_customer_date > order_estimated_delivery_date) as late,
    round(
        100.0 * SUM(
            order_delivered_customer_date <= order_estimated_delivery_date
        )/COUNT(order_delivered_customer_date),2
        ) as on_time_pct,
    ROUND(
        100.0 * SUM(
            order_delivered_customer_date > order_estimated_delivery_date
        ) / COUNT(order_delivered_customer_date),
        2
    ) AS late_pct
from orders
where order_delivered_customer_date IS NOT NULL;
--96476 	88649   	7827	91.89	8.11

SELECT
    o.order_status,
    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    COUNT(*) AS orders
FROM orders o
join review r on o.order_id = r.order_id
GROUP BY 1;
