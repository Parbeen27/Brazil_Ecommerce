SELECT
    order_status,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(
        100.0 * COUNT(DISTINCT order_id)
        / SUM(COUNT(DISTINCT order_id)) OVER (),
        2
    ) AS percentage_of_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;
