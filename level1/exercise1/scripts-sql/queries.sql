USE bottle_bottom;

SELECT 
    c.name AS Client_Name,
    COUNT(s.id_sales) AS Total_Invoices
FROM 
    SALES s
INNER JOIN 
    CLIENTS c ON s.id_client = c.id_client
WHERE 
    s.sale_date BETWEEN '2025-04-28' AND '2025-05-01'
    AND c.name = 'John Smith' -- (Aquí pones el nombre del cliente que quieras)
GROUP BY 
    c.name;
    



SELECT 
    e.name AS Employee_Name,
    g.brand AS Glasses_Brand,
    g.type_mount AS Glasses_Type,
    COUNT(s.id_sales) AS Total_Sold
FROM 
    SALES s
INNER JOIN 
    EMPLOYEES e ON s.id_employee = e.id_employee
INNER JOIN 
    GLASSES g ON s.id_glasses = g.id_glasses
WHERE 
    YEAR(s.sale_date) = 2025
    AND e.name = 'Anna White' -- (Aquí pones el nombre del empleado que quieras)
GROUP BY 
    e.name, g.brand, g.type_mount;

SELECT 
    DISTINCT s2.name AS Supplier_Name
FROM 
    SALES s
INNER JOIN 
    GLASSES g ON s.id_glasses = g.id_glasses
INNER JOIN 
    SUPPLIERS s2 ON g.id_supplier = s2.id_supplier;

SELECT * FROM clients;

SELECT * FROM suppliers;

SELECT * FROM sales;

SELECT * FROM employees;

SELECT * FROM glasses;



    
