-- Eliminar todas las tablas en cascada si ya existen
DROP TABLE IF EXISTS LINEAS_DETALLE_VENTA CASCADE;
DROP TABLE IF EXISTS FACTURAS_VENTA CASCADE;
DROP TABLE IF EXISTS MEDICACION_ADMINISTRADA CASCADE;
DROP TABLE IF EXISTS LINEAS_DETALLE_COMPRA CASCADE;
DROP TABLE IF EXISTS FACTURAS_COMPRA CASCADE;
DROP TABLE IF EXISTS STOCK CASCADE;
DROP TABLE IF EXISTS PACIENTES CASCADE;
DROP TABLE IF EXISTS PROVEEDORES CASCADE;

-- Tabla de proveedores
CREATE TABLE PROVEEDORES (
    CIF VARCHAR(20) PRIMARY KEY, -- Identificador unico del proveedor
    Nombre VARCHAR(100) NOT NULL, -- Nombre del proveedor
    Direccion TEXT, -- Direccion del proveedor
    Telefono VARCHAR(15), -- Telefono de contacto del proveedor
    Email VARCHAR(100) -- Correo electronico del proveedor
);

-- Tabla de productos en inventario (stock)
CREATE TABLE STOCK (
    ID_Stock SERIAL PRIMARY KEY, -- Identificador unico del producto en stock
    Nombre_Producto VARCHAR(100) NOT NULL, -- Nombre del producto
    Cantidad_Disponible INT NOT NULL, -- Cantidad disponible en el inventario
    Precio_Unitario NUMERIC(10, 2), -- Precio unitario de venta del producto
    Fecha_Entrada DATE -- Fecha de entrada del producto al inventario
);

-- Tabla de pacientes actualizada
CREATE TABLE PACIENTES (
    DNI_NIF VARCHAR(9) PRIMARY KEY, -- Identificador unico del paciente
    Nombre VARCHAR(100) NOT NULL, -- Nombre del paciente
    Apellidos VARCHAR(100), -- Apellidos del paciente
    Fecha_Nacimiento DATE, -- Fecha de nacimiento del paciente
    Direccion TEXT, -- Direccion del paciente
    Telefono VARCHAR(15), -- Telefono de contacto del paciente
    Email VARCHAR(100) -- Correo electronico del paciente
);

-- Tabla de facturas de compra
CREATE TABLE FACTURAS_COMPRA (
    ID_Factura_Compra SERIAL PRIMARY KEY, -- Identificador unico de la factura de compra
    Fecha DATE NOT NULL, -- Fecha de la factura de compra
    Precio_Total NUMERIC(10, 2), -- Precio total de la factura de compra
    CIF_Proveedor VARCHAR(20) REFERENCES PROVEEDORES(CIF) -- Relacion con el proveedor que emitio la factura
);

-- Tabla de líneas de detalle de compra con clave primaria compuesta
CREATE TABLE LINEAS_DETALLE_COMPRA (
    ID_Factura_Compra INT REFERENCES FACTURAS_COMPRA(ID_Factura_Compra), -- Relacion con la factura de compra
    ID_Stock INT REFERENCES STOCK(ID_Stock), -- Relacion con el producto en el stock
    Cantidad INT NOT NULL, -- Cantidad comprada del producto
    Precio_Unitario NUMERIC(10, 2) NOT NULL, -- Precio unitario del producto comprado
    PRIMARY KEY (ID_Factura_Compra, ID_Stock) -- Clave primaria compuesta
);

-- Tabla de medicación administrada actualizada con clave primaria compuesta
CREATE TABLE MEDICACION_ADMINISTRADA (
    DNI_NIF VARCHAR(9) REFERENCES PACIENTES(DNI_NIF), -- Relacion con el paciente que recibió la medicación
    ID_Stock INT REFERENCES STOCK(ID_Stock), -- Relacion con el producto del stock administrado
    Fecha_Administracion DATE NOT NULL, -- Fecha en que se administró la medicación
    PRIMARY KEY (DNI_NIF, ID_Stock, Fecha_Administracion) -- Clave primaria compuesta
);

-- Tabla de facturas de venta actualizada
CREATE TABLE FACTURAS_VENTA (
    ID_Factura_Venta SERIAL PRIMARY KEY, -- Identificador unico de la factura de venta
    Fecha DATE NOT NULL, -- Fecha de la factura de venta
    Precio_Total NUMERIC(10, 2), -- Precio total de la factura de venta
    DNI_NIF VARCHAR(9) REFERENCES PACIENTES(DNI_NIF) -- Relacion con el paciente asociado a la factura
);

-- Tabla de líneas de detalle de venta con clave primaria compuesta
CREATE TABLE LINEAS_DETALLE_VENTA (
    ID_Factura_Venta INT REFERENCES FACTURAS_VENTA(ID_Factura_Venta), -- Relacion con la factura de venta
    ID_Stock INT REFERENCES STOCK(ID_Stock), -- Relacion con el producto en el stock
    Cantidad INT NOT NULL, -- Cantidad vendida del producto
    Precio_Unitario NUMERIC(10, 2) NOT NULL, -- Precio unitario del producto vendido
    PRIMARY KEY (ID_Factura_Venta, ID_Stock) -- Clave primaria compuesta
);
