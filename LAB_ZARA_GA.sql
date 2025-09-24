USE zarabusiness;
-- LABORATORIO GA ZARA
-- 1. Selecciona todos los clientes junto con las compras que han realizado, mostrando el nombre del cliente y el monto de cada compra.
SELECT c.nombre_cliente, co.monto_total
FROM Clientes c
JOIN Compras co ON co.id_cliente = c.id_cliente;

-- 2. Muestra todos los empleados y la tienda en la que trabajan, incluyendo el nombre del empleado y el nombre de la tienda.
SELECT e.nombre_empleado, t.nombre_tienda
FROM Empleados e
JOIN Tiendas t ON t.id_tienda = e.tienda_id;
 
-- 3. Selecciona todas las prendas que han sido compradas, junto con el nombre del cliente que las compró.
-- NO ES POSIBLE

-- 4. Muestra el total de compras realizadas por cada cliente, mostrando su nombre y el total de compras.
SELECT c.nombre_cliente, SUM(co.monto_total) AS total_compras
FROM Clientes c
LEFT JOIN Compras co ON co.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente;

-- 5. Selecciona los empleados que han vendido prendas de color "Rojo", incluyendo el nombre del empleado y el tipo de prenda.
-- NO ES POSIBLE

-- 6. Muestra la cantidad de prendas vendidas por cada tienda, mostrando el nombre de la tienda y el total de prendas vendidas.
-- NO ES POSIBLE

-- 7. Selecciona los clientes que han realizado compras por un monto total superior a 100, mostrando su nombre y el monto total de la compra.
SELECT c.nombre_cliente, SUM(co.monto_total) AS monto_total
FROM Clientes c
JOIN Compras co ON co.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
HAVING SUM(co.monto_total) > 100;

-- 8. Muestra todos los tipos de prendas y cuántas han sido compradas, mostrando el tipo de prenda y la cantidad vendida.
-- NO ES POSIBLE

-- 9. Selecciona las prendas que han sido compradas por más de un cliente, mostrando el tipo de prenda y el número de clientes que la han comprado.
-- NO ES POSIBLE

-- 10. Muestra la lista de compras realizadas en una tienda específica, incluyendo el nombre del cliente y el monto de la compra.
-- NO ES POSIBLE

-- 11. Selecciona los empleados que trabajan en tiendas en "Madrid", mostrando su nombre y el nombre de la tienda.
SELECT e.nombre_empleado, t.nombre_tienda
FROM Empleados e
JOIN Tiendas t ON t.id_tienda = e.tienda_id
WHERE t.ciudad = 'Madrid';

-- 12. Muestra los clientes que no han realizado ninguna compra, mostrando su nombre y correo electrónico.
SELECT c.nombre_cliente, c.email_cliente
FROM Clientes c
LEFT JOIN Compras co ON co.id_cliente = c.id_cliente
WHERE co.id_compra IS NULL;

-- 13. Selecciona el nombre de la tienda con el mayor número de empleados, mostrando el nombre de la tienda y la cantidad de empleados.
SELECT t.nombre_tienda, COUNT(*) AS num_empleados
FROM Tiendas t
JOIN Empleados e ON e.tienda_id = t.id_tienda
GROUP BY t.id_tienda, t.nombre_tienda
ORDER BY num_empleados DESC
LIMIT 1;
 
-- 14. Muestra el monto total de compras por cada empleado, incluyendo el nombre del empleado y el monto total vendido.
-- NO ES POSIBLE

-- 15. Selecciona las compras realizadas en el mes de septiembre de 2023, mostrando el nombre del cliente y la fecha de la compra.
SELECT c.nombre_cliente, co.fecha_compra
FROM Compras co
JOIN Clientes c ON c.id_cliente = co.id_cliente
WHERE co.fecha_compra >= '2023-09-01'
  AND co.fecha_compra <  '2023-10-01';
  
-- 16. Muestra todos los clientes y las tiendas donde han realizado compras, incluyendo el nombre del cliente y el nombre de la tienda.
-- NO ES POSIBLE

-- 17. Selecciona las prendas cuyo precio promedio es superior a 40, mostrando el tipo de prenda y el precio promedio.
SELECT tipo_prenda, AVG(precio) AS precio_promedio
FROM Prendas
GROUP BY tipo_prenda
HAVING AVG(precio) > 40;

-- 18. Muestra la lista de empleados y la cantidad de compras que han gestionado, mostrando su nombre y la cantidad de compras.
-- NO ES POSIBLE

-- 19. Selecciona los clientes que han realizado más de 3 compras, mostrando su nombre y el número de compras.
SELECT c.nombre_cliente, COUNT(*) AS num_compras
FROM Compras co
JOIN Clientes c ON c.id_cliente = co.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente
HAVING COUNT(*) > 3;
 
-- 20. Muestra el total de ventas por cada tipo de prenda, mostrando el tipo de prenda y el monto total vendido.
-- NO ES POSIBLE

-- 21. Usa CASE WHEN para mostrar un mensaje diferente según el monto total de las compras: "Bajo", "Medio" o "Alto" para cada cliente.
SELECT c.nombre_cliente,
       SUM(co.monto_total) AS gasto_total,
       CASE
         WHEN SUM(co.monto_total) < 100  THEN 'Bajo'
         WHEN SUM(co.monto_total) <= 200 THEN 'Medio'
         ELSE 'Alto'
       END AS categoria_gasto
FROM Clientes c
LEFT JOIN Compras co ON co.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente;
 
-- 22. Actualiza el precio de todas las prendas de ropa que sean de tipo "Zapatos" incrementándolos en un 10%.
UPDATE Prendas
SET precio = ROUND(precio * 1.10, 2)
WHERE tipo_prenda = 'Zapatos';
 
-- 23. Alterar la tabla de Clientes para agregar una nueva columna llamada "telefono_cliente".
ALTER TABLE Clientes
ADD COLUMN telefono_cliente VARCHAR(30);

-- 24. Muestra el número total de compras y el promedio de gasto por cliente, usando GROUP BY.
SELECT c.nombre_cliente,
       COUNT(co.id_compra) AS num_compras,
       AVG(co.monto_total) AS gasto_promedio
FROM Clientes c
LEFT JOIN Compras co ON co.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente;

-- 25. Elimina todas las prendas cuyo precio es menor que 10.
DELETE FROM Prendas
WHERE precio < 10;

-- 26. Usa JOIN para mostrar el nombre de los clientes y la cantidad total que han gastado en compras.
SELECT c.nombre_cliente, SUM(co.monto_total) AS total_gastado
FROM Clientes c
JOIN Compras co ON co.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente;

-- 27. Muestra un informe que incluya el nombre del empleado y la cantidad de compras gestionadas por tienda, usando GROUP BY.
-- NO ES POSIBLE

-- 28. Usa un subquery para mostrar el cliente que ha realizado la compra más alta.
SELECT c.nombre_cliente, co.monto_total
FROM Compras co
JOIN Clientes c ON c.id_cliente = co.id_cliente
WHERE co.monto_total = (
  SELECT MAX(monto_total) FROM Compras
);
 
-- 29. Actualiza la ciudad de los empleados que trabajan en la tienda "Zara Gran Vía" a "Madrid".
-- NO ES POSIBLE

-- 30. Usa una subconsulta con EXISTS para seleccionar todos los clientes que han realizado compras, mostrando solo sus nombres.
SELECT c.nombre_cliente
FROM Clientes c
WHERE EXISTS (
  SELECT 1
  FROM Compras co
  WHERE co.id_cliente = c.id_cliente);