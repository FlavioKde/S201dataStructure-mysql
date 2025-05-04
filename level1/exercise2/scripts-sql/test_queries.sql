use pizzeria;

SELECT 
    e.first_name,
    e.last_name,
    COUNT(d.order_id) AS total_deliveries_made
FROM Delivery d
JOIN DeliveryDriver dd ON d.delivery_driver_id = dd.employee_id
JOIN Employee e ON dd.employee_id = e.id
WHERE e.first_name = 'Carlos'
  AND e.last_name = 'Martinez' 
GROUP BY e.id;


SELECT 
    l.name AS locality,
    SUM(op.quantity) AS total_drinks_sold
FROM Orders o
JOIN Order_Product op ON o.id = op.order_id
JOIN Product p ON op.product_id = p.id
JOIN Store s ON o.store_id = s.id
JOIN Locality l ON s.locality_id = l.id
WHERE p.type = 'drink'
  AND l.name = 'Sabadell' 
GROUP BY l.name;





