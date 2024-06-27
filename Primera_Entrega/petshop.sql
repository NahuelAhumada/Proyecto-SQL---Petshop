-- Creacion y borrado si existe de la base de datos
DROP DATABASE IF EXISTS petshop_ecommerce;
CREATE DATABASE IF NOT EXISTS petshop_ecommerce;
USE petshop_ecommerce;

-- Tablas
CREATE TABLE USUARIOS (
	id_usuario int PRIMARY KEY,
	nombre_de_usuario varchar(200) NOT NULL,
	nombre varchar(200) NOT NULL,
	apellido varchar(200) NOT NULL,
	email varchar(200) NOT NULL,
    contrasena varchar(200) NOT NULL
);

CREATE TABLE DIRECCIONES (
	id_direccion int PRIMARY KEY,
	calle varchar(200) NOT NULL,
    piso varchar(10),
	localidad varchar(200) NOT NULL,
    provincia varchar(200) NOT NULL,
    pais varchar(200) NOT NULL,
    codigo_postal varchar(20) NOT NULL,
	id_usuario int NOT NULL
);
CREATE TABLE CARRITOS (
	id_carrito int PRIMARY KEY,
    id_usuario int UNIQUE NOT NULL,
    fecha_creacion datetime NOT NULL,
    total_a_pagar int
);
CREATE TABLE ITEM_CARRITO (
	id int PRIMARY KEY,
    id_carrito int NOT NULL,
    id_producto int NOT NULL,
    cantidad int NOT NULL
);

CREATE TABLE ORDENES_DE_COMPRA (
	id_orden integer PRIMARY KEY,
    id_usuario int NOT NULL,
    id_metodo_pago int NOT NULL,
    fecha_de_orden date NOT NULL,
    total_a_pagar int
);

CREATE TABLE DETALLE_ORDEN (
	id integer PRIMARY KEY,
	id_orden integer NOT NULL,
	id_producto integer NOT NULL,
	cantidad integer NOT NULL
);

CREATE TABLE METODOS_DE_PAGO(
	id_metodo_pago int PRIMARY KEY,
    nombre varchar(200)
);

CREATE TABLE PRODUCTOS (
	id_producto integer PRIMARY KEY,
	nombre varchar(200) NOT NULL,
	descripción varchar(200) NOT NULL,
	imagen varchar(200),
	id_subcategoria	 integer NOT NULL
);

CREATE TABLE SUBCATEGORIAS (
	id_subcategoria integer PRIMARY KEY,
	nombre varchar(200) NOT NULL,
	id_categoria integer NOT NULL
);

CREATE TABLE CATEGORIAS (
	id_categoria integer PRIMARY KEY,
	nombre varchar(200)NOT NULL,
	id_animal integer NOT NULL
);

CREATE TABLE ANIMALES (
	id_animal integer PRIMARY KEY,
    nombre varchar(200) NOT NULL
);

-- Claves foraneas
ALTER TABLE DIRECCIONES ADD FOREIGN KEY (id_usuario) REFERENCES USUARIOS (id_usuario);

ALTER TABLE CARRITOS ADD FOREIGN KEY (id_usuario) REFERENCES USUARIOS (id_usuario);

ALTER TABLE PRODUCTOS ADD FOREIGN KEY (id_subcategoria) REFERENCES SUBCATEGORIAS (id_subcategoria);

ALTER TABLE SUBCATEGORIAS ADD FOREIGN KEY (id_categoria) REFERENCES CATEGORIAS (id_categoria);

ALTER TABLE CATEGORIAS ADD FOREIGN KEY (id_animal) REFERENCES ANIMALES (id_animal);

ALTER TABLE ITEM_CARRITO ADD FOREIGN KEY (id_carrito) REFERENCES CARRITOS (id_carrito);

ALTER TABLE ITEM_CARRITO ADD FOREIGN KEY (id_producto) REFERENCES PRODUCTOS (id_producto);

ALTER TABLE DETALLE_ORDEN ADD FOREIGN KEY (id_orden) REFERENCES ORDENES_DE_COMPRA (id_orden);

ALTER TABLE DETALLE_ORDEN ADD FOREIGN KEY (id_producto) REFERENCES PRODUCTOS (id_producto);

ALTER TABLE ORDENES_DE_COMPRA ADD FOREIGN KEY (id_usuario) REFERENCES USUARIOS (id_usuario);

ALTER TABLE ORDENES_DE_COMPRA ADD FOREIGN KEY (id_metodo_pago) REFERENCES METODOS_DE_PAGO (id_metodo_pago);

