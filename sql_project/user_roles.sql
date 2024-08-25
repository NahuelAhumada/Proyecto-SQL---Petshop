USE petshop_ecommerce;

-- Creacion de roles
CREATE ROLE IF NOT EXISTS 'rol_administrador';
GRANT ALL PRIVILEGES ON petshop_ecommerce.* TO 'rol_administrador' WITH GRANT OPTION;

CREATE ROLE IF NOT EXISTS 'rol_ventas';
GRANT SELECT ON petshop_ecommerce.CARRITOS TO 'rol_ventas';
GRANT SELECT ON petshop_ecommerce.ITEM_CARRITO TO 'rol_ventas';
GRANT SELECT ON petshop_ecommerce.METODOS_DE_PAGO TO 'rol_ventas';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.ORDENES_DE_COMPRA TO 'rol_ventas';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.DETALLE_DE_ORDEN TO 'rol_ventas';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.PAGOS TO 'rol_ventas';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.DESPACHO_DE_PEDIDOS TO 'rol_ventas';
GRANT EXECUTE ON PROCEDURE petshop_ecommerce.realizar_compra TO 'rol_ventas';
GRANT EXECUTE ON PROCEDURE petshop_ecommerce.cancelar_compra TO 'rol_ventas';

CREATE ROLE IF NOT EXISTS 'rol_marketing';
GRANT SELECT ON petshop_ecommerce.ORDENES_DE_COMPRA TO 'rol_marketing';
GRANT SELECT ON petshop_ecommerce.PRECIO_TOTAL_DE_CARRITOS TO 'rol_marketing';
GRANT SELECT ON petshop_ecommerce.TOTAL_A_PAGAR_POR_ORDEN_DE_COMPRA TO 'rol_marketing';
GRANT SELECT ON petshop_ecommerce.VISTA_PRODUCTOS_POR_TOTAL_VENDIDOS TO 'rol_marketing';
GRANT SELECT ON petshop_ecommerce.HISTORIAL_VENTA_DE_PRODUCTOS_POR_MONTO_FINAL TO 'rol_marketing';

CREATE ROLE IF NOT EXISTS 'rol_manager_de_productos';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.PRODUCTOS TO 'rol_manager_de_productos';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.MARCAS TO 'rol_manager_de_productos';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.ANIMALES TO 'rol_manager_de_productos';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.CATEGORIAS TO 'rol_manager_de_productos';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.SUBCATEGORIAS TO 'rol_manager_de_productos';

CREATE ROLE IF NOT EXISTS 'rol_manager_de_usuarios';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.USUARIOS TO 'rol_manager_de_usuarios';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.DIRECCIONES_DE_ENVIO TO 'rol_manager_de_usuarios';
GRANT SELECT, INSERT, UPDATE ON petshop_ecommerce.USUARIOS_DIRECCIONES TO 'rol_manager_de_usuarios';
GRANT SELECT ON USUARIOS_SIN_COMPRAS_HACE_3_MESES TO 'rol_manager_de_usuarios';

-- Creacion de usuarios
DROP USER IF EXISTS 'administrador'@'%';
CREATE USER 'administrador'@'%' IDENTIFIED BY 'admin123' FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 1;

DROP USER IF EXISTS 'diego_marketing'@'%';
CREATE USER 'diego_marketing'@'%' IDENTIFIED BY 'diego456' FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 1;

DROP USER IF EXISTS 'sofia_ventas'@'%';
CREATE USER 'sofia_ventas'@'%' IDENTIFIED BY 'sofia923' FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 1;

DROP USER IF EXISTS 'sergio_productos'@'%';
CREATE USER 'sergio_productos'@'%' IDENTIFIED BY 'sergio678' FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 1;

DROP USER IF EXISTS 'paula_usuarios'@'%';
CREATE USER 'paula_usuarios'@'%' IDENTIFIED BY 'puala423' FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 1;

-- Asignacion de roles

GRANT 'rol_administrador' TO 'administrador'@'%' ;
SET DEFAULT ROLE 'rol_administrador' TO 'administrador'@'%';

GRANT 'rol_ventas' TO  'sofia_ventas'@'%';
SET DEFAULT ROLE 'rol_ventas' TO  'sofia_ventas'@'%';

GRANT 'rol_marketing' TO 'diego_marketing'@'%';
SET DEFAULT ROLE 'rol_marketing' TO 'diego_marketing'@'%';

GRANT 'rol_manager_de_productos' TO 'sergio_productos'@'%';
SET DEFAULT ROLE 'rol_manager_de_productos' TO 'sergio_productos'@'%';

GRANT 'rol_manager_de_usuarios' TO 'paula_usuarios'@'%';
SET DEFAULT ROLE 'rol_manager_de_usuarios' TO 'paula_usuarios'@'%';

FLUSH PRIVILEGES;
