USE petshop_ecommerce;

SHOW TABLE STATUS LIKE 'ORDENES_DE_COMPRA';
/*Paso a paso*/
-- 1 nueva orden de compra del usuario 1
INSERT INTO ORDENES_DE_COMPRA (id_usuario) VALUE (1);
SELECT * FROM ORDENES_DE_COMPRA ORDER BY id_orden DESC;
-- 2 Probando el trigger DETALLE_DE_ORDEN
-- 2.1 Insertar demasiado de un producto
INSERT INTO DETALLE_DE_ORDEN (id_orden,id_producto,precio_final, cantidad) VALUE (id_ultima_orden_de_compra_de_usuario(1), 1,15000,235);

-- 2.2 Insertar producto no disponible
INSERT INTO DETALLE_DE_ORDEN (id_orden,id_producto,precio_final, cantidad) VALUE (id_ultima_orden_de_compra_de_usuario(1), 21,15000,1);

-- 2.3 producto pasa a estar no disponible
INSERT INTO DETALLE_DE_ORDEN (id_orden,id_producto,precio_final, cantidad) VALUE (id_ultima_orden_de_compra_de_usuario(1), 12,15000,3);
SELECT * FROM PRODUCTOS WHERE id_producto=12;

-- 2.4 no insertar en orden cancelada o efectuada
UPDATE ORDENES_DE_COMPRA
SET estado = 'cancelada'
WHERE id_orden = id_ultima_orden_de_compra_de_usuario(1);
INSERT INTO DETALLE_DE_ORDEN (id_orden,id_producto,precio_final, cantidad) VALUE (id_ultima_orden_de_compra_de_usuario(1), 3,15000,1);


