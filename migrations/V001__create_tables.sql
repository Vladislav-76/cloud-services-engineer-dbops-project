CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    picture_url TEXT
);

CREATE TABLE product_info (
    product_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    status VARCHAR(64) NOT NULL
);

CREATE TABLE orders_date (
    order_id INT PRIMARY KEY,
    status VARCHAR(64) NOT NULL,
    date_created TIMESTAMP
);

CREATE TABLE order_product (
    quantity INT NOT NULL CHECK (quantity > 0),
    order_id INT NOT NULL,
    product_id INT NOT NULL
);
