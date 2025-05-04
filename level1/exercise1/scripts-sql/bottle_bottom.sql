

CREATE DATABASE Bottle_bottom;

USE bottle_bottom;

CREATE TABLE CLIENTS (
    id_client INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(255),
    postal_address VARCHAR(255),
    email VARCHAR(255) UNIQUE, 
    telephone VARCHAR(15),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    client_recommend INT, 
    FOREIGN KEY (client_recommend) REFERENCES CLIENTS(id_client) ON DELETE SET NULL
);




CREATE TABLE SUPPLIERS (
    id_supplier INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    fax VARCHAR(100),
    telephone VARCHAR(100),
    VAT_ID VARCHAR(20),
    street VARCHAR(255),
    city VARCHAR(100),
    zip_code VARCHAR(20),
    country VARCHAR(100),
    number VARCHAR(20),
    floor VARCHAR(20),
    door VARCHAR(20)
);


CREATE TABLE GLASSES(
	id_glasses INT AUTO_INCREMENT PRIMARY KEY,
    color_glass VARCHAR(100),
    type_mount varchar(255),
    brand VARCHAR(255),
    graduation_lens VARCHAR(20),
    color_mounts VARCHAR(125),
    price INT,
    id_supplier INT,
	FOREIGN KEY ( id_supplier ) REFERENCES SUPPLIERS(id_supplier)
);

CREATE TABLE EMPLOYEES (
	id_employee INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE SALES (
    id_sales INT AUTO_INCREMENT PRIMARY KEY,
    id_client INT, 
    id_employee INT, 
    id_glasses INT, 
    sale_date DATE,
    FOREIGN KEY (id_client) REFERENCES CLIENTS(id_client) ON DELETE CASCADE,
    FOREIGN KEY (id_employee) REFERENCES EMPLOYEES(id_employee),
    FOREIGN KEY (id_glasses) REFERENCES GLASSES(id_glasses)
);




