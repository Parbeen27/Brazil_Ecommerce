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

