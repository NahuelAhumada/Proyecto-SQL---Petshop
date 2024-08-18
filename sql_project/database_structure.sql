-- Creacion y borrado si existe de la base de datos
DROP DATABASE IF EXISTS petshop_ecommerce;
CREATE DATABASE IF NOT EXISTS petshop_ecommerce;
USE petshop_ecommerce;

-- Tablas
CREATE TABLE USUARIOS (
	id_usuario int PRIMARY KEY AUTO_INCREMENT,
	nombre_de_usuario varchar(60) NOT NULL UNIQUE,
	nombres varchar(80) NOT NULL,
	apellidos varchar(80) NOT NULL,
	email varchar(100) NOT NULL UNIQUE,
    contrasena varchar(60) NOT NULL
)COMMENT 'Tabla para almacenar información de los usuarios';

CREATE TABLE DIRECCIONES_DE_ENVIO (
	id_direccion int PRIMARY KEY AUTO_INCREMENT,
	calle varchar(60) NOT NULL,
    piso varchar(10),
	localidad varchar(60) NOT NULL,
    provincia varchar(60) NOT NULL,
    pais varchar(60) NOT NULL,
    codigo_postal varchar(20) NOT NULL
)COMMENT 'Tabla para almacenar los datos de cada direccion de envio registradas por los usuarios';

CREATE TABLE USUARIOS_DIRECCIONES(
	id_usuario int NOT NULL,
    id_direccion int NOT NULL
)COMMENT 'Tabla de relacion n-n entre los usuarios y las direcciones de envio';

CREATE TABLE CARRITOS (
	id_carrito int PRIMARY KEY AUTO_INCREMENT,
    id_usuario int UNIQUE NOT NULL,
    fecha_interaccion datetime NOT NULL DEFAULT(now())
)COMMENT 'Tabla de carrito de compra relacionado a cada usuario con la y hora de su ultima interaccion';

CREATE TABLE ITEM_CARRITO (
    id_carrito int NOT NULL,
    id_producto int NOT NULL,
    cantidad int NOT NULL,
    PRIMARY KEY (id_carrito, id_producto)
)COMMENT 'Tabla de relacion CARRITOS - PRODUCTOS. Contiene el la cantidad de cada producto pedido en un determinado carrito de compra';

CREATE TABLE PRODUCTOS (
	id_producto int PRIMARY KEY AUTO_INCREMENT,
	nombre varchar(100) NOT NULL,
	descripcion varchar(350) NOT NULL,
    precio decimal(10, 2), -- Precio de lista
	imagen varchar(100),
    cantidad_disponible int DEFAULT 1,
    estado enum ('publicado','borrador','no disponible') DEFAULT 'borrador',
	id_subcategoria	 int NOT NULL,
    id_marca int
)COMMENT 'Tabla de productos del ecommerce. El precio almacenado se corresponde al precio de lista actual';

CREATE TABLE MARCAS(
	id_marca int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(60),
    contacto varchar(60)
) COMMENT 'Tabla de las marcas de cada producto';

CREATE TABLE SUBCATEGORIAS (
	id_subcategoria int PRIMARY KEY AUTO_INCREMENT,
	nombre varchar(60) NOT NULL,
	id_categoria int NOT NULL
)COMMENT 'Tabla de subcategorias disponibles de cada producto';

CREATE TABLE CATEGORIAS (
	id_categoria int PRIMARY KEY AUTO_INCREMENT,
	nombre varchar(60)NOT NULL,
	id_animal int NOT NULL
)COMMENT 'Tabla de categorias de los cuales dependen las subcategorias';

CREATE TABLE ANIMALES (
	id_animal int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(60) NOT NULL
)COMMENT 'Tabla de los animales ligados a las categorias de productos';

CREATE TABLE ORDENES_DE_COMPRA (
	id_orden int PRIMARY KEY AUTO_INCREMENT,
    id_usuario int NOT NULL,
    estado enum('pendiente', 'pagado', 'cancelado') DEFAULT 'pendiente',
    fecha_de_orden datetime NOT NULL DEFAULT(now())
)COMMENT 'Tabla de las ordenes de compra registradas historiamente, relacionada al usuario que la pidio';

CREATE TABLE DETALLE_DE_ORDEN (
	id_orden int NOT NULL,
	id_producto int NOT NULL,
    precio_final decimal(10, 2),
	cantidad int NOT NULL,
    PRIMARY KEY (id_orden, id_producto)
)COMMENT 'Tabla de relacion n-n entre ordenes de compra y los productos correspondiente de cada compra';

CREATE TABLE METODOS_DE_PAGO(
	id_metodo_pago int PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(35),
    modifacion_precio decimal (1,3)
)COMMENT 'Tabla que almacena los metodos de pagos disponibles para cada compra';

CREATE TABLE PAGOS (
    id_pago int PRIMARY KEY AUTO_INCREMENT,
    id_orden int NOT NULL UNIQUE,
    id_metodo_pago int NOT NULL,
    estado enum('pendiente','completado','cancelado') DEFAULT 'pendiente',
    fecha_pago datetime NOT NULL DEFAULT(now()),
    monto decimal(15, 2) NOT NULL DEFAULT 0
)COMMENT 'Tabla que registra los pagos de cada orden de compra';

CREATE TABLE DESPACHO_DE_PEDIDOS(
	id_despacho int PRIMARY KEY AUTO_INCREMENT,
    id_orden int NOT NULL,
    id_direccion int, -- Puede ser NULL si es retiro en local
    fecha_ultima_actualizacion datetime NOT NULL DEFAULT(now()),
    detalle varchar(50),
    estado_envio enum('en local', 'enviado', 'entregado', 'cancelado') DEFAULT 'en local',
    retiro_en_local BOOLEAN DEFAULT FALSE
)COMMENT 'Tabla que registra la entrega de los pedidos. Pueden ser por envio o retiro del local';



-- Claves foraneas
ALTER TABLE USUARIOS_DIRECCIONES ADD FOREIGN KEY (id_usuario) REFERENCES USUARIOS (id_usuario)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE USUARIOS_DIRECCIONES ADD FOREIGN KEY (id_direccion) REFERENCES DIRECCIONES_DE_ENVIO (id_direccion)
ON UPDATE CASCADE
ON DELETE RESTRICT;

ALTER TABLE CARRITOS ADD FOREIGN KEY (id_usuario) REFERENCES USUARIOS (id_usuario)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE ITEM_CARRITO ADD FOREIGN KEY (id_carrito) REFERENCES CARRITOS (id_carrito);

ALTER TABLE ITEM_CARRITO ADD FOREIGN KEY (id_producto) REFERENCES PRODUCTOS (id_producto);

ALTER TABLE PRODUCTOS ADD FOREIGN KEY (id_subcategoria) REFERENCES SUBCATEGORIAS (id_subcategoria);

ALTER TABLE PRODUCTOS ADD FOREIGN KEY (id_marca) REFERENCES MARCAS (id_marca);

ALTER TABLE SUBCATEGORIAS ADD FOREIGN KEY (id_categoria) REFERENCES CATEGORIAS (id_categoria)
ON UPDATE CASCADE;

ALTER TABLE CATEGORIAS ADD FOREIGN KEY (id_animal) REFERENCES ANIMALES (id_animal)
ON UPDATE CASCADE;

ALTER TABLE DETALLE_DE_ORDEN ADD FOREIGN KEY (id_orden) REFERENCES ORDENES_DE_COMPRA (id_orden);

ALTER TABLE DETALLE_DE_ORDEN ADD FOREIGN KEY (id_producto) REFERENCES PRODUCTOS (id_producto);

ALTER TABLE ORDENES_DE_COMPRA ADD FOREIGN KEY (id_usuario) REFERENCES USUARIOS (id_usuario);

ALTER TABLE PAGOS ADD FOREIGN KEY (id_orden) REFERENCES ORDENES_DE_COMPRA (id_orden);

ALTER TABLE PAGOS ADD FOREIGN KEY (id_metodo_pago) REFERENCES METODOS_DE_PAGO (id_metodo_pago);

ALTER TABLE DESPACHO_DE_PEDIDOS ADD FOREIGN KEY (id_orden) REFERENCES ORDENES_DE_COMPRA (id_orden);

ALTER TABLE DESPACHO_DE_PEDIDOS ADD FOREIGN KEY (id_direccion) REFERENCES DIRECCIONES_DE_ENVIO (id_direccion);