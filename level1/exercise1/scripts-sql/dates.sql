USE bottle_bottom;

INSERT INTO CLIENTS (name, postal_address, email, telephone, client_recommend)
VALUES
('John Smith', '123 Elm Street', 'john.smith@email.com', '123456789', NULL),
('Emily Johnson', '456 Oak Avenue', 'emily.johnson@email.com', '234567890', 1),
('Michael Williams', '789 Pine Lane', 'michael.williams@email.com', '345678901', 2),
('Jessica Brown', '321 Cedar Road', 'jessica.brown@email.com', '456789012', NULL),
('David Jones', '654 Maple Boulevard', 'david.jones@email.com', '567890123', 3);


INSERT INTO SUPPLIERS (name, fax, telephone, VAT_ID, street, city, zip_code, country, number, floor, door)
VALUES
('Vision Corp', '123-456-789', '123456789', 'VAT123456', 'Sunset Blvd', 'Los Angeles', '90001', 'USA', '101', '2', 'A'),
('Optic Solutions', '987-654-321', '987654321', 'VAT654321', 'Ocean Drive', 'Miami', '33101', 'USA', '202', '5', 'B');


INSERT INTO GLASSES (color_glass, type_mount, brand, graduation_lens, color_mounts, price, id_supplier)
VALUES
('Blue', 'Full-frame', 'Ray-Ban', '-1.5', 'Black', 150, 1),
('Clear', 'Half-frame', 'Oakley', '-2.0', 'Silver', 200, 1),
('Green', 'Rimless', 'Gucci', '-0.75', 'Gold', 300, 2),
('Brown', 'Full-frame', 'Prada', '-1.25', 'Brown', 250, 2),
('Gray', 'Half-frame', 'Versace', '-3.0', 'Gray', 220, 1);


INSERT INTO EMPLOYEES (name)
VALUES
('Anna White'),
('Robert Black'),
('Laura Green');


INSERT INTO SALES (id_client, id_employee, id_glasses, sale_date)
VALUES
(1, 1, 1, '2025-04-28'),
(2, 2, 2, '2025-04-29'),
(3, 3, 3, '2025-04-30'),
(4, 1, 4, '2025-05-01'),
(5, 2, 5, '2025-05-02');
