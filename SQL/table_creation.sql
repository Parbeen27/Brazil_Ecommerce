--creating table structure
use Olist;
--customer schema
create table customer (
    customer_id varchar(50) PRIMARY KEY, customer_unique_id varchar(50),customer_zip_code_prefix INT
    ,customer_city varchar(100), customer_state varchar(5)
);

--seller schema
create TABLE seller (
    seller_id VARCHAR(50) PRIMARY KEY,seller_zip_code_prefix INT, 
    seller_city VARCHAR(100), seller_state VARCHAR(5)
);

--Product schema
create Table product (
    product_id VARCHAR(50) PRIMARY KEY, product_category_name VARCHAR(100), product_name_lenght INT, 
    product_description_lenght INT, product_photos_qty INT, 
    product_weight_g INT, product_length_cm INT, 
    product_height_cm INT, product_width_cm INT
)

--Order Schema
create TABLE orders(
    order_id VARCHAR(50) PRIMARY KEY, customer_id VARCHAR(50), 
    order_status VARCHAR(30), order_purchase_timestamp TIMESTAMP, order_approved_at TIMESTAMP, 
    order_delivered_carrier_date TIMESTAMP, order_delivered_customer_date TIMESTAMP, 
    order_estimated_delivery_date TIMESTAMP,
    Foreign Key (customer_id) REFERENCES customer(customer_id)
);

--Items schema
create TABLE item (
    order_id VARCHAR(50), order_item_id INT, 
    product_id VARCHAR(50), seller_id VARCHAR(50), 
    shipping_limit_date TIMESTAMP, price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    PRIMARY KEY (order_id,order_item_id),
    Foreign Key (order_id) REFERENCES orders(order_id),
    Foreign Key (product_id) REFERENCES product(product_id),
    Foreign Key (seller_id) REFERENCES seller(seller_id)
);

--Payments Schema
create TABLE payment (
    order_id VARCHAR(50), payment_sequential INT, 
    payment_type VARCHAR(30), payment_installments INT, 
    payment_value DECIMAL(10,2),
    PRIMARY KEY (order_id, payment_sequential),
    Foreign Key (order_id) REFERENCES orders(order_id)
);

--Reviews
CREATE Table review (
    review_id VARCHAR(50), order_id VARCHAR(50), 
    review_score INT, review_comment_title TEXT, 
    review_comment_message TEXT, review_creation_date DATETIME, 
    review_answer_timestamp DATETIME,
    PRIMARY KEY(review_id,order_id),
    Foreign Key (order_id) REFERENCES orders(order_id)
);

--Geolocation
CREATE Table geolocation (
    geolocation_zip_code_prefix INT, geolocation_lat DECIMAL(10,7), 
    geolocation_lng DECIMAL(10,7), geolocation_city VARCHAR(100), 
    geolocation_state VARCHAR(10)
);

--Category
create Table category (
    product_category_name VARCHAR(100) PRIMARY KEY, 
    product_category_name_english VARCHAR(100)
);