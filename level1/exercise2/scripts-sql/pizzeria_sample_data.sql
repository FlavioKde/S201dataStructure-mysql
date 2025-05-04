USE pizzeria;

INSERT INTO Province (name) VALUES ('Barcelona'), ('Girona');

INSERT INTO Locality (name, province_id) VALUES 
('Sabadell', 1), 
('Terrassa', 1),
('Olot', 2);

INSERT INTO Store (address, postal_code, locality_id) VALUES
('Carrer Falsa 123', '08208', 1),
('Avinguda del Sol 456', '08225', 2);

INSERT INTO Customer (first_name, last_name, address, postal_code, locality_id, province_id, phone) VALUES
('Joan', 'Garcia', 'Carrer Lluna 12', '08208', 1, 1, '600111222'),
('Anna', 'Lopez', 'Carrer Sol 33', '08225', 2, 1, '600333444');

INSERT INTO Employee (first_name, last_name, nif, phone, store_id) VALUES
('Carlos', 'Martinez', '12345678A', '611111111', 1),
('Laura', 'Fernandez', '87654321B', '622222222', 1);

INSERT INTO Chef (employee_id) VALUES (1);
INSERT INTO DeliveryDriver (employee_id) VALUES (2);

INSERT INTO Category (name) VALUES ('Clásica'), ('Especial');

INSERT INTO Product (name, description, image_url, price, type, category_id) VALUES
('Pizza Margarita', 'Clásica pizza amb tomàquet i formatge', NULL, 8.50, 'pizza', 1),
('Pizza 4 Quesos', 'Amb barreja de formatges', NULL, 9.50, 'pizza', 2);

INSERT INTO Product (name, description, image_url, price, type) VALUES
('Hamburguesa Clàssica', 'Hamburguesa amb formatge i enciam', NULL, 6.00, 'burger'),
('Coca-Cola', 'Refresc de cola 33cl', NULL, 1.50, 'drink');

INSERT INTO Orders (customer_id, store_id, order_datetime, order_type, total_price) VALUES
(1, 1, NOW(), 'delivery', 19.50),
(2, 2, NOW(), 'pickup', 7.50);

INSERT INTO Order_Product (order_id, product_id, quantity) VALUES
(1, 1, 1), -- Pizza Margarita
(1, 4, 1), -- Coca-Cola
(2, 3, 1); -- Hamburguesa

INSERT INTO Delivery (order_id, delivery_driver_id, delivery_datetime) VALUES
(1, 2, NOW());
