CREATE DATABASE IF NOT EXISTS pizzeria;
USE pizzeria;

DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS DeliveryDriver;
DROP TABLE IF EXISTS Chef;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Order_Product;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Store;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Locality;
DROP TABLE IF EXISTS Province;


CREATE TABLE Province (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE Locality (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    province_id INT NOT NULL,
    FOREIGN KEY (province_id) REFERENCES Province(id)
);


CREATE TABLE Store (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(150),
    postal_code VARCHAR(10),
    locality_id INT,
    FOREIGN KEY (locality_id) REFERENCES Locality(id)
);


CREATE TABLE Customer (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    address VARCHAR(150),
    postal_code VARCHAR(10),
    locality_id INT,
    province_id INT,
    phone VARCHAR(20),
    FOREIGN KEY (locality_id) REFERENCES Locality(id),
    FOREIGN KEY (province_id) REFERENCES Province(id)
);


CREATE TABLE Employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    nif VARCHAR(20) UNIQUE,
    phone VARCHAR(20),
    store_id INT,
    FOREIGN KEY (store_id) REFERENCES Store(id)
);


CREATE TABLE Chef (
    employee_id INT PRIMARY KEY,
    FOREIGN KEY (employee_id) REFERENCES Employee(id)
);


CREATE TABLE DeliveryDriver (
    employee_id INT PRIMARY KEY,
    FOREIGN KEY (employee_id) REFERENCES Employee(id)
);


CREATE TABLE Category (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);


CREATE TABLE Product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    image_url VARCHAR(255),
    price DECIMAL(6,2),
    type ENUM('pizza', 'burger', 'drink') NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(id)
);


CREATE TABLE Orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    store_id INT,
    order_datetime DATETIME,
    order_type ENUM('delivery', 'pickup') NOT NULL,
    total_price DECIMAL(8,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(id),
    FOREIGN KEY (store_id) REFERENCES Store(id)
);


CREATE TABLE Order_Product (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Product(id)
);


CREATE TABLE Delivery (
    order_id INT PRIMARY KEY,
    delivery_driver_id INT,
    delivery_datetime DATETIME,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (delivery_driver_id) REFERENCES DeliveryDriver(employee_id)
);
