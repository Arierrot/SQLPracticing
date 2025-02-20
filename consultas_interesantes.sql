-- Medicamentos administrados a un paciente
-- Obtiene los medicamentos administrados a un paciente específico junto con las fechas de administración.
SELECT p.Nombre, s.Nombre_Producto, ma.Fecha_Administracion
FROM PACIENTES p
JOIN MEDICACION_ADMINISTRADA ma ON p.DNI_NIF = ma.DNI_NIF
JOIN STOCK s ON ma.ID_Stock = s.ID_Stock
WHERE p.DNI_NIF = '12345678A';

-- Facturas de compra de un proveedor
-- Lista las facturas de compra asociadas a un proveedor específico.
SELECT fc.ID_Factura_Compra, fc.Fecha, fc.Precio_Total
FROM FACTURAS_COMPRA fc
WHERE fc.CIF_Proveedor = 'A12345678';

-- Productos más vendidos
-- Lista los productos más vendidos ordenados por cantidad total.
SELECT s.Nombre_Producto, SUM(ldv.Cantidad) AS Total_Vendido
FROM STOCK s
JOIN LINEAS_DETALLE_VENTA ldv ON s.ID_Stock = ldv.ID_Stock
GROUP BY s.Nombre_Producto
ORDER BY Total_Vendido DESC;

-- Total gastado por paciente
-- Obtiene el total gastado por cada paciente en medicamentos.
SELECT p.Nombre, SUM(fv.Precio_Total) AS Total_Gastado
FROM PACIENTES p
JOIN FACTURAS_VENTA fv ON p.DNI_NIF = fv.DNI_NIF
GROUP BY p.Nombre
ORDER BY Total_Gastado DESC;

-- Inventario disponible
-- Muestra el inventario actual de productos disponibles.
SELECT s.ID_Stock, s.Nombre_Producto, s.Cantidad_Disponible
FROM STOCK s;

-- Facturación total por mes
-- Calcula la facturación total agrupada por mes.
SELECT DATE_TRUNC('month', fv.Fecha) AS Mes, SUM(fv.Precio_Total) AS Facturacion_Total
FROM FACTURAS_VENTA fv
GROUP BY Mes
ORDER BY Mes;

-- Detalle de una factura específica
-- Muestra los productos vendidos en una factura específica junto con la cantidad y el precio unitario.
SELECT ldv.ID_Factura_Venta, s.Nombre_Producto, ldv.Cantidad, ldv.Precio_Unitario
FROM LINEAS_DETALLE_VENTA ldv
JOIN STOCK s ON ldv.ID_Stock = s.ID_Stock
WHERE ldv.ID_Factura_Venta = 1;

-- Medicamentos administrados más frecuentemente
-- Lista los medicamentos más administrados a los pacientes ordenados por frecuencia.
SELECT s.Nombre_Producto, COUNT(ma.ID_Stock) AS Veces_Administrado
FROM MEDICACION_ADMINISTRADA ma
JOIN STOCK s ON ma.ID_Stock = s.ID_Stock
GROUP BY s.Nombre_Producto
ORDER BY Veces_Administrado DESC;

-- Relación entre stock y ventas
-- Compara las cantidades disponibles en el stock con las vendidas.
SELECT s.Nombre_Producto, s.Cantidad_Disponible, SUM(ldv.Cantidad) AS Cantidad_Vendida
FROM STOCK s
JOIN LINEAS_DETALLE_VENTA ldv ON s.ID_Stock = ldv.ID_Stock
GROUP BY s.Nombre_Producto, s.Cantidad_Disponible;

-- Proveedores más frecuentes
-- Lista los proveedores con mayor número de facturas de compra asociadas.
SELECT p.Nombre, COUNT(fc.ID_Factura_Compra) AS Total_Facturas
FROM PROVEEDORES p
JOIN FACTURAS_COMPRA fc ON p.CIF = fc.CIF_Proveedor
GROUP BY p.Nombre
ORDER BY Total_Facturas DESC;
