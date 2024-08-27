USE petshop_ecommerce;

SET GLOBAL local_infile=1;
-- Local Dir : F:/Programacion/CODERHOUSE/Proyecto/Primera_Entrega/Proyecto-SQL---Petshop

/*Tabla animales*/
INSERT INTO  petshop_ecommerce.ANIMALES (nombre)
VALUES
    ('Perros'),
    ('Gatos'),
    ('Aves'),
    ('Peces'),
    ('Roedores'),
    ('Otros');


/* Tabla categorias*/
INSERT INTO  petshop_ecommerce.CATEGORIAS
    (nombre, id_animal)
VALUES
    ('Alimentos',1),
    ('Snacks',1),
    ('Paseo y viajes',1),
    ('Juguetes',1),
    ('Camas e indumentaria',1),
    ('Salud',1),
    ('Alimentos',2),
    ('Accesorios',2),
    ('Paseo y viajes',2),
    ('Camas e indumentaria',2),
    ('Higiene y belleza',2),
    ('Salud',2),
    ('Alimentos',3),
    ('Accesorios',3),
    ('Salud',3),
    ('Alimentos',4),
    ('Peceras',4),
    ('Salud',4),
    ('Alimentos',5),
    ('Accesorios',5);

/*Tabla subcategorias*/
LOAD DATA LOCAL INFILE   '/sql_project/data_csv/subcategorias.csv'
    INTO TABLE petshop_ecommerce.SUBCATEGORIAS
    FIELDS TERMINATED BY ',' ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
    (nombre,id_categoria);

   
/* Tabla Marcas*/
INSERT INTO  petshop_ecommerce.MARCAS
	(nombre, contacto)
VALUES
	('Generico','-'),
	('Pro Plan','3429265350'),
    ('Royal Canin','114206331'),
    ('Old Prince','1115426007'),
    ('Vital Can','3839936103'),
    ('Mon Ami','3834139758'),
    ('Cancat','3831132665'),
    ('Kikadog','2643140711'),
    ('My Family','3425259116'),
    ('Millex','2233231746'),
    ('Zootec','3831188120'),
    ('Shulet','2217676112'),
    ('Marina','2214432393'),
    ('Aqua Clear','2648227515'),
    ('Nelsoni Ranch','3414082077'),
    ('Whiskas','3421138602'),
    ('Tetra','1196354869');

/* Tabla Productos*/
LOAD DATA LOCAL INFILE   '/sql_project/data_csv/productos.csv'
	INTO TABLE PRODUCTOS
    FIELDS TERMINATED BY ',' ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
    (nombre, descripcion,precio,imagen,cantidad_disponible,estado,id_subcategoria,id_marca);
/* Tabla Metodos de Pago*/

INSERT INTO petshop_ecommerce.METODOS_DE_PAGO
	(nombre,modifacion_precio)
VALUES
	('Efectivo',0.900),
    ('Debito',1.000),
    ('Transferencia bancaria',1.000),
    ('Credito a una cuota',1.000),
    ('Credito a tres cuotas',1.200);
/* Tabla Usuarios*/
LOAD DATA LOCAL INFILE '/sql_project/data_csv/usuarios.csv'
	INTO TABLE USUARIOS
    FIELDS TERMINATED BY ',' ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
    (nombre_de_usuario,nombres,apellidos, email, contrasena);

/* Tabla Direcciones de envio*/ 
LOAD DATA LOCAL INFILE '/sql_project/data_csv/direcciones_de_envio.csv'
	INTO TABLE DIRECCIONES_DE_ENVIO
    FIELDS TERMINATED BY ',' ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
    (calle,piso,localidad, provincia, pais, codigo_postal);


/* Tabla USUARIOS_DIRECCIONES*/
INSERT INTO petshop_ecommerce.USUARIOS_DIRECCIONES(id_usuario, id_direccion) VALUES
(1,1),(2,1),(2,2),(3,3),(4,4),(5,4),
(6,5),(7,6),(8,7),(9,8),(10,8),(11,9),
(12,10),(13,10),(14,11),(15,12),(16,12),
(17,13),(18,14),(19,15),(20,8);

/*Tabla CARRITOS*/
INSERT INTO petshop_ecommerce.CARRITOS (id_usuario, fecha_interaccion) VALUES
    (1, '2023-07-01 10:00:00'),
    (2, '2023-08-02 11:30:00'),
    (3, '2023-08-15 18:45:00'),
    (4, '2023-09-04 09:00:00'),
    (5, '2023-11-05 15:15:00'),
    (6, '2024-01-02 11:30:00'),
    (7, '2024-02-09 10:45:00'),
    (8, '2024-02-15 17:00:00'),
    (9, '2024-02-22 15:15:00'),
    (10, '2024-03-04 12:30:00'),
    (11, '2024-04-13 14:45:00'),
    (12, '2024-04-22 15:00:00'),
    (13, '2024-05-03 10:15:00'),
    (14, '2024-05-10 13:30:00'),
    (15, '2024-06-01 12:45:00'),
    (16, now()),
    (17, now()),
    (18, now()),
    (19, now()),
    (20, now());
/* Tabla ITEM_CARRITO*/

INSERT INTO petshop_ecommerce.ITEM_CARRITO 
    (id_carrito, id_producto, cantidad)
VALUES
    (1, 1, 2),
    (1, 2, 2),
    (2, 2, 1),
    (2, 3, 1),
    (3, 3, 3),
    (4, 4, 1),
    (4, 13, 1),
    (5, 1,  4),
    (5, 6,  1),
    (6, 7,  2),
    (7, 2,  1),
    (8, 8,  3),
    (9, 9,  1),
    (10, 10, 2),
    (10, 15,  1),
    (11, 2,  2),
    (11, 5,  4),
    (11, 6,  3),
    (12, 15,  1),
    (13, 12,  1),
    (14, 15,  3),
    (15, 14,  5),
    (16, 1,  2),
    (16, 5,  1),
    (16, 6,  3),
    (17, 4,  1),
    (17, 8,  4),
    (17, 14,  7),
    (18, 3,  5),
    (18, 7,  1),
    (19, 5,  2),
    (19, 15,  1),
    (20, 16, 1);

/* Tabla ORDENES_DE_COMPRA*/

INSERT INTO petshop_ecommerce.ORDENES_DE_COMPRA(id_usuario, estado,fecha_de_orden ) VALUE
    (1,'efectuada','2024-04-13 10:00:00'),
    (2,'efectuada','2024-04-15 12:00:00'),
    (3,'efectuada','2024-04-21 13:00:00'),
    (1,'efectuada','2024-04-28 17:00:00'),
    (4,'efectuada','2024-04-30 09:00:00'),
    (5,'efectuada','2024-05-03 10:00:00'),
    (6,'efectuada','2024-05-07 12:00:00'),
    (2,'efectuada','2024-05-13 09:00:00'),
    (5,'efectuada','2024-05-14 15:00:00'),
    (4,'efectuada','2024-05-15 14:00:00'),
    (7,'efectuada','2024-05-15 16:00:00'),
    (3,'efectuada','2024-05-21 16:00:00'),
    (10,'efectuada','2024-05-24 10:00:00'),
    (9,'efectuada','2024-05-25 11:00:00'),
    (8,'efectuada','2024-06-01 12:00:00'),
    (11,'efectuada','2024-06-03 17:00:00'),
    (1,'efectuada','2024-06-16 14:00:00'),
    (12,'efectuada','2024-06-21 10:00:00'),
    (13,'efectuada','2024-07-05 15:00:00'),
    (14,'pendiente','2024-07-06 16:00:00'),
    (15,'pendiente','2024-07-17 11:00:00');
	
/* Tabla DETALLE_DE_ORDEN*/

INSERT INTO petshop_ecommerce.DETALLE_DE_ORDEN(id_orden, id_producto, precio_final, cantidad)VALUES 
    (1,1,34400,1),
    (1,5,6240,3),
    (2,2,19500,1),
    (2,3,1870,2),
    (3,4,95000,1),
    (4,5,6230,3),
    (5,14,650,1),
    (6,2,19500,1),
    (6,3,1870,5),
    (7,1,34600,1),
    (8,8,2500,1),
    (9,11,2500,1),
    (10,9,25000,1),
    (10,10,25500,1),
    (11,12,136000,1),
    (12,2,19500,1),
    (13,3,1870,3),
    (13,1,34800,3),
    (14,13,115000,1),
    (14,14,650,2),
    (15,14,650,5),
    (16,15,81705,1),
    (17,10,25000,1),
    (17,11,2500,2),
    (18,12,136000,1),
    (19,16,150000,1),
    (20,4,95000,1),
    (20,8,2500,2),
    (21,12,136000,1);
    
INSERT INTO petshop_ecommerce.PAGOS
	(id_orden,id_metodo_pago,estado,fecha_pago,monto)
VALUES
	(1,2,'completado',"2024-04-13 10:00:30",53120),
	(2,3,'completado',"2024-04-15 12:00:30",23240),
    (3,4,'completado',"2024-04-21 13:00:30",95000),
    (4,3,'completado',"2024-04-28 17:00:30",18690),
    (5,2,'completado',"2024-04-30 09:00:30",650.00),
    (6,1,'completado',"2024-05-03 10:00:30",25965),
    (7,2,'completado',"2024-05-07 12:00:30",34600),
    (8,3,'completado',"2024-05-13 09:00:30",2500),
    (9,1,'completado',"2024-05-14 15:00:30",2250),
    (10,2,'completado',"2024-05-15 14:00:30",50500),
    (11,3,'completado',"2024-05-15 15:00:30",136000),
    (12,5,'completado',"2024-05-21 16:00:30",23400),
    (13,4,'completado',"2024-05-24 10:00:30",110010),
    (14,3,'completado',"2024-05-25 11:00:30",116300),
    (15,1,'completado',"2024-06-01 12:00:30",2925.00),
    (16,2,'completado',"2024-06-03 17:00:30",81705),
    (17,2,'completado',"2024-06-16 14:00:30",30000),
    (18,3,'completado',"2024-06-21 10:00:30",136000),
    (19,4,'completado',"2024-07-05 15:00:30",150000),
    (20,5,'pendiente',"2024-07-06 16:00:30",120000),
    (21,1,'pendiente',"2024-07-17 11:00:30",122400);
    
INSERT INTO petshop_ecommerce.DESPACHO_DE_PEDIDOS
	(id_orden,id_direccion,ultima_interaccion, detalle, estado_envio,retiro_en_local)
VALUES
	(1,1,"2024-04-14 10:00:00","Enviado y recibido en tiempo",'entregado',FALSE),
    (2,2,"2024-04-16 12:00:00","Enviado y recibido en tiempo",'entregado',FALSE),
    (3,3,"2024-04-22 13:00:40","Enviado y recibido",'entregado',FALSE),
    (4,null,"2024-04-29 17:00:10","Retirado en el local",'entregado',TRUE),
    (5,4,"2024-05-01 09:00:00","Enviado y recibido",'entregado',FALSE),
    (6,4,"2024-05-03 10:01:00","Enviado y recibido",'entregado',FALSE),
    (7,5,"2024-05-08 12:00:30","Enviado y recibido",'entregado',FALSE),
    (8,1,"2024-05-14 09:00:00","Enviado y recibido",'entregado',FALSE),
    (9,4,"2024-05-14 15:02:00","Enviado y recibido",'entregado',FALSE),
    (10,4,"2024-05-16 09:00:00","Enviado y recibido",'entregado',FALSE),
    (11,null, "2024-05-16 17:00:00","Retirado en el local",'entregado',TRUE),
    (12,3,"2024-05-22 16:00:00","Enviado y recibido",'entregado',FALSE),
    (13,8,"2024-05-25 12:00:00","Enviado y recibido",'entregado',FALSE),
    (14,null,"2024-05-28 11:00:00","Retirado en el local",'entregado',TRUE),
    (15,7,"2024-06-01 12:01:30","Enviado y recibido",'entregado',FALSE),
    (16,9,"2024-06-04 17:00:00","Enviado y recibido",'entregado',FALSE),
    (17,1,"2024-06-19 14:00:30","Enviado y recibido con demora",'entregado',FALSE),
    (18,null,"2024-06-21 10:03:30","Retirado en el local",'entregado',TRUE),
    (19,10,"2024-07-06 15:00:00","Enviado y recibido",'entregado',FALSE),
    (20,11,"2024-07-06 16:00:30","El pedido esta en camino",'enviado',FALSE),
    (21,null,"2024-07-17 11:00:30","El pedido se encuentra en el local",'en local',TRUE);