-- Insertar datos en la tabla PROVEEDORES
INSERT INTO PROVEEDORES (CIF, Nombre, Direccion, Telefono, Email)
VALUES
('A12345678', 'Farmacéuticos López S.A.', 'Calle Salud, 123, Madrid', '911234567', 'contacto@farmaceuticoslopez.com'),
('B87654321', 'Medicinas del Sur', 'Avenida Andalucía, 45, Sevilla', '954678910', 'info@medicinassur.com'),
('C34567890', 'Distribuidora Norte', 'Calle Principal, 30, Bilbao', '944567123', 'ventas@distrinorte.com'),
('D98765432', 'Farmacia Global', 'Avenida Central, 20, Valencia', '963789456', 'contacto@farmaciaglobal.com');

-- Insertar datos en la tabla STOCK
INSERT INTO STOCK (Nombre_Producto, Cantidad_Disponible, Precio_Unitario, Fecha_Entrada)
VALUES
('Paracetamol 500mg', 1200, 1.50, '2024-01-10'),
('Ibuprofeno 600mg', 800, 2.00, '2024-01-12'),
('Amoxicilina 875mg', 600, 1.75, '2024-01-15'),
('Insulina Lenta', 300, 25.00, '2024-01-20'),
('Omeprazol 20mg', 1000, 0.90, '2024-01-25');

-- Insertar datos en la tabla PACIENTES
INSERT INTO PACIENTES (DNI_NIF, Nombre, Apellidos, Fecha_Nacimiento, Direccion, Telefono, Email)
VALUES
('12345678A', 'Carlos', 'González López', '1980-06-15', 'Calle Mayor, 10, Madrid', '911223344', 'carlos.gonzalez@gmail.com'),
('23456789B', 'Laura', 'Martínez Pérez', '1992-12-20', 'Avenida Gran Vía, 25, Valencia', '963223344', 'laura.martinez@hotmail.com'),
('34567890C', 'Luis', 'Hernández Gil', '1975-03-30', 'Calle Norte, 8, Bilbao', '944223344', 'luis.hernandez@yahoo.com'),
('45678901D', 'Ana', 'López Gómez', '1990-01-05', 'Calle del Sol, 15, Sevilla', '954123456', 'ana.lopez@gmail.com'),
('56789012E', 'Pedro', 'Sánchez Ruiz', '1985-10-25', 'Avenida de la Luz, 20, Zaragoza', '976543210', 'pedro.sanchez@hotmail.com'),
('67890123F', 'Marta', 'Jiménez Díaz', '1997-04-12', 'Plaza Mayor, 5, Barcelona', '934123987', 'marta.jimenez@gmail.com'),
('78901234G', 'Juan', 'Ramírez García', '1982-03-18', 'Calle del Río, 8, Málaga', '952234567', 'juan.ramirez@hotmail.com'),
('89012345H', 'Lucía', 'Torres Martín', '1995-08-30', 'Avenida Siempreviva, 50, Madrid', '912345678', 'lucia.torres@gmail.com'),
('90123456J', 'Manuel', 'García Romero', '1988-07-14', 'Calle Verde, 12, Valencia', '963345678', 'manuel.garcia@yahoo.com'),
('01234567K', 'Rosa', 'Pérez Fernández', '1979-11-20', 'Calle Azul, 22, Bilbao', '944567890', 'rosa.perez@hotmail.com');

-- Insertar datos en la tabla FACTURAS_COMPRA
INSERT INTO FACTURAS_COMPRA (ID_Factura_Compra, Fecha, Precio_Total, CIF_Proveedor)
VALUES
(1, '2024-02-01', 1500.00, 'A12345678'),
(2, '2024-02-05', 1200.00, 'B87654321'),
(3, '2024-02-10', 950.00, 'C34567890');

-- Insertar datos en la tabla LINEAS_DETALLE_COMPRA
INSERT INTO LINEAS_DETALLE_COMPRA (ID_Factura_Compra, ID_Stock, Cantidad, Precio_Unitario)
VALUES
(1, 1, 500, 1.50), -- Paracetamol
(1, 2, 300, 2.00), -- Ibuprofeno
(2, 3, 400, 1.75), -- Amoxicilina
(2, 4, 100, 25.00), -- Insulina
(3, 5, 500, 0.90); -- Omeprazol

-- Insertar datos en la tabla MEDICACION_ADMINISTRADA
INSERT INTO MEDICACION_ADMINISTRADA (DNI_NIF, ID_Stock, Fecha_Administracion)
VALUES
('12345678A', 1, '2024-02-15'),
('23456789B', 2, '2024-02-16'),
('34567890C', 3, '2024-02-17'),
('45678901D', 4, '2024-02-18'),
('56789012E', 5, '2024-02-19'),
('67890123F', 1, '2024-02-20'),
('78901234G', 2, '2024-02-21'),
('89012345H', 3, '2024-02-22'),
('90123456J', 4, '2024-02-23'),
('01234567K', 5, '2024-02-24');

-- Insertar datos en la tabla FACTURAS_VENTA
INSERT INTO FACTURAS_VENTA (ID_Factura_Venta, Fecha, Precio_Total, DNI_NIF)
VALUES
(1, '2024-03-01', 35.00, '12345678A'),
(2, '2024-03-02', 45.00, '23456789B'),
(3, '2024-03-03', 50.00, '34567890C'),
(4, '2024-03-04', 40.00, '45678901D'),
(5, '2024-03-05', 30.00, '56789012E');

-- Insertar datos en la tabla LINEAS_DETALLE_VENTA
INSERT INTO LINEAS_DETALLE_VENTA (ID_Factura_Venta, ID_Stock, Cantidad, Precio_Unitario)
VALUES
(1, 1, 10, 1.50), -- Paracetamol
(1, 2, 5, 2.00), -- Ibuprofeno
(2, 3, 8, 1.75), -- Amoxicilina
(2, 5, 10, 0.90), -- Omeprazol
(3, 4, 2, 25.00); -- Insulina

