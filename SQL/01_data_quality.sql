--checking data quality

--checking total rows for each table
select COUNT(*) as customer_row from customer;  --99441
select COUNT(*) as order_row from orders; --99441
select COUNT(*) as item_row from item;  --112650
select COUNT(*) as seller_row from seller; --3095
select COUNT(*) as product_row from product; --32951
select COUNT(*) as category_row from category;  --71
select COUNT(*) as payment_row from payment;  --103886
select COUNT(*) as review_row from review;    --99224

--checking duplicate ids
SELECT 
    order_id,
    COUNT(*) AS count_rows
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;      --no duplicate ids in order

SELECT 
    customer_id,
    COUNT(*) AS count_rows
FROM customer
GROUP BY customer_id
HAVING COUNT(*) > 1;    --no duplicates

SELECT 
    seller_id,
    COUNT(*) AS count_rows
FROM seller
GROUP BY seller_id
HAVING COUNT(*) > 1;   --no duplicates

SELECT 
    product_id,
    COUNT(*) AS count_rows
FROM product
GROUP BY product_id
HAVING COUNT(*) > 1;     --no duplicates 


--checking for missing values in main order columns
SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS order_id_present,
    COUNT(customer_id) AS customer_id_present,
    COUNT(order_status) AS order_status_present,
    COUNT(order_purchase_timestamp) AS purchase_date_present
FROM orders;
--no missing values in these columns


--Order status
SELECT
    order_status,
    COUNT(*) AS orders,
    ROUND(
        100* COUNT(*) / SUM(count(*)) over (),2
    ) as perct_orders
FROM orders
GROUP BY order_status
ORDER BY orders DESC;

