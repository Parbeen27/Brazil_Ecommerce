--checking data quality
SELECT 
    order_id,
    COUNT(*) AS count_rows
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

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
    COUNT(*) AS orders
FROM orders
GROUP BY order_status
ORDER BY orders DESC;

