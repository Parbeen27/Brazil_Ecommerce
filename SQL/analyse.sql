--Total Customers
select 
    count(DISTINCT o.order_id) as total_orders,
    count(DISTINCT c.customer_unique_id) as Total_customer,
    count(DISTINCT i.product_id) as unique_products,
    count(DISTINCT i.seller_id) as total_sellers,

    ROUND(SUM(i.price),2) as product_sales,
    ROUND(SUM(i.freight_value),2) as total_freight,
    ROUND(SUM(i.price)+sum(i.freight_value),2) as total_order_value,
    Round((SUM(i.price)+sum(i.freight_value))/count(DISTINCT o.order_id),2) as avg_order_value
from orders o
join customer c 
on o.customer_id = c.customer_id
join item i
on o.order_id = i.order_id;

