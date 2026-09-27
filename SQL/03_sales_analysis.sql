--year wise completed sales
SELECT
    YEAR(o.order_purchase_timestamp) AS year,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(i.price), 2) AS product_sales,
    ROUND(SUM(i.freight_value), 2) AS freight,
    ROUND(SUM(i.price + i.freight_value), 2) AS total_sales
FROM orders o
JOIN item i
    ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
GROUP BY 1
ORDER BY 1;

--revenue by category
SELECT
    p.product_category_name,
    c.product_category_name_english,
    count(*) as units_sold,
    SUM(i.price) AS revenue
FROM item i
JOIN product p
    ON i.product_id = p.product_id
left join category c
    ON p.product_category_name = c.product_category_name
GROUP BY 1,2
ORDER BY revenue DESC;
--health_beauty, watches_gifts, bed_bath_table


select
     p.product_category_name,
     round(AVG(i.price),2) as avg_price
from item i
join product p on i.product_id = p.product_id
group by 1
order by 2 desc;

--frieght analysis
SELECT
    p.product_category_name,
    ROUND(AVG(i.freight_value), 2) AS avg_freight,
    ROUND(AVG(i.price), 2) AS avg_product_price
FROM item i
JOIN product p
    ON i.product_id = p.product_id
GROUP BY p.product_category_name;


--by state
SELECT
    cu.customer_state AS state,
    AVG(i.freight_value) AS avg_freight,
    SUM(i.freight_value) AS total_freight
FROM item i
JOIN orders o
    ON i.order_id = o.order_id
JOIN customer cu
    ON o.customer_id = cu.customer_id
GROUP BY cu.customer_state
ORDER BY avg_freight DESC;

--seller analysis
SELECT
    seller_id,
    COUNT(DISTINCT order_id) AS orders,
    SUM(price) AS revenue,
    COUNT(*) AS units_sold,
    round((SUM(price) / COUNT(DISTINCT order_id)),2) as avg_price
FROM item
GROUP BY seller_id
ORDER BY revenue DESC;

--avg review score
SELECT
    seller_id,
    AVG(review_score) AS avg_review_score
FROM (
    SELECT DISTINCT
        i.seller_id,
        i.order_id,
        r.review_score
    FROM item i
    JOIN review r
        ON i.order_id = r.order_id
) x
GROUP BY seller_id;

--geographic analysis
SELECT
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS orders
FROM customer c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY orders DESC;

SELECT
    c.customer_state,
    SUM(i.price) AS revenue
FROM customer c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN item i
    ON o.order_id = i.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC;


SELECT
    customer_state,
    count(distinct customer_unique_id)
FROM customer 
GROUP BY 1
ORDER BY 2 DESC;

