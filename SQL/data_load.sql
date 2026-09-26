--Loading customer data
LOAD DATA INFILE '/var/lib/mysql-files/olist_customers_dataset.csv'
into table customer
fields TERMINATED by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--Order data
LOAD DATA INFILE '/var/lib/mysql-files/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    order_id,
    customer_id,
    order_status,
    @order_purchase_timestamp,
    @order_approved_at,
    @order_delivered_carrier_date,
    @order_delivered_customer_date,
    @order_estimated_delivery_date
)
SET
    order_purchase_timestamp = NULLIF(@order_purchase_timestamp, ''),
    order_approved_at = NULLIF(@order_approved_at, ''),
    order_delivered_carrier_date = NULLIF(@order_delivered_carrier_date, ''),
    order_delivered_customer_date = NULLIF(@order_delivered_customer_date, ''),
    order_estimated_delivery_date = NULLIF(@order_estimated_delivery_date, '');

--Product
LOAD DATA INFILE '/var/lib/mysql-files/olist_products_dataset.csv'
into table product
fields TERMINATED by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    product_id, 
    product_category_name, 
    @product_name_lenght, 
    @product_description_lenght,
    @product_photos_qty, 
    @product_weight_g, 
    @product_length_cm, 
    @product_height_cm,
    @product_width_cm
)
SET
    product_name_lenght = NULLIF(@product_name_lenght,''),
    product_description_lenght = NULLIF(@product_description_lenght,''),
    product_photos_qty = NULLIF(@product_photos_qty,''), 
    product_weight_g = NULLIF(@product_weight_g,''),
    product_length_cm = NULLIF(@product_length_cm,''),
    product_height_cm = NULLIF(@product_height_cm,''),
    product_width_cm = NULLIF(@product_width_cm,'');

--Category
LOAD DATA INFILE '/var/lib/mysql-files/product_category_name_translation.csv'
into table category
fields TERMINATED by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--Seller
LOAD DATA INFILE '/var/lib/mysql-files/olist_sellers_dataset.csv'
into table seller
fields TERMINATED by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--Item
LOAD DATA INFILE '/var/lib/mysql-files/olist_order_items_dataset.csv'
into table item
fields TERMINATED by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--Payment
LOAD DATA INFILE '/var/lib/mysql-files/olist_order_payments_dataset.csv'
into table payment
fields TERMINATED by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--review
-- LOAD DATA INFILE '/var/lib/mysql-files/olist_order_reviews_dataset.csv'
-- INTO TABLE review
-- FIELDS TERMINATED BY ','
-- OPTIONALLY ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (
--     @review_id,
--     @order_id,
--     @review_score,
--     @review_comment_title,
--     @review_comment_message,
--     @review_creation_date,
--     @review_answer_timestamp
-- )
-- SET
--     review_id = @review_id,
--     order_id = @order_id,
--     review_score = NULLIF(@review_score, ''),
--     review_comment_title = NULLIF(@review_comment_title, ''),
--     review_comment_message = NULLIF(@review_comment_message, ''),
--     review_creation_date = NULLIF(@review_creation_date, ''),
--     review_answer_timestamp = NULLIF(@review_answer_timestamp, '');




--geolocation
LOAD DATA INFILE '/var/lib/mysql-files/olist_geolocation_dataset.csv'
into table geolocation
fields TERMINATED by ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

