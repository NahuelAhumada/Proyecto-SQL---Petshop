USE petshop_ecommerce;
CREATE OR REPLACE VIEW PRECIO_TOTAL_DE_CARRITOS AS 
		SELECT
			us.id_usuario,
			us.nombre_de_usuario,
			calcular_precio_total_de_carrito(cart.id_carrito) AS total_a_pagar
		FROM CARRITOS AS cart
        INNER JOIN USUARIOS as us ON (us.id_usuario=cart.id_usuario)
        GROUP BY us.id_usuario, us.nombre_de_usuario;

CREATE OR REPLACE VIEW TOTAL_A_PAGAR_POR_ORDEN_DE_COMPRA AS
    SELECT
		id_orden,
        id_usuario,
        estado,
        fecha_de_orden,
        calcular_precio_total_de_orden(id_orden) as monto_estandar
	FROM ORDENES_DE_COMPRA;
    
CREATE OR REPLACE VIEW VISTA_PRODUCTOS_POR_TOTAL_VENDIDOS AS
SELECT 
    p.id_producto,
    p.nombre,
    SUM(detalles.cantidad) AS total_vendido
FROM 
    PRODUCTOS p
JOIN 
    DETALLE_DE_ORDEN detalles ON p.id_producto = detalles.id_producto
GROUP BY 
    p.id_producto, p.nombre;

CREATE OR REPLACE VIEW 
	HISTORIAL_VENTA_DE_PRODUCTOS_POR_MONTO_FINAL AS
	SELECT
		o.id_orden,
		o.fecha_de_orden,
		p.id_producto,
		p.nombre as nombre_de_producto,
		mostrar_precio(d.precio_final) AS precio_de_venta,
		d.cantidad
    FROM
    PRODUCTOS as P
    JOIN DETALLE_DE_ORDEN AS d ON (p.id_producto = d.id_producto)
	JOIN ORDENES_DE_COMPRA AS o ON(d.id_orden = o.id_orden);

CREATE OR REPLACE VIEW 
	VISUALIZACION_DE_SUBCATEGORIAS AS
	SELECT sub.id_subcategoria, sub.nombre as 'Subcategoria', cat.nombre as 'Categoria', a.nombre as 'Animal'
	FROM SUBCATEGORIAS as sub
	JOIN CATEGORIAS as cat ON (sub.id_categoria = cat.id_categoria)
	JOIN ANIMALES as a ON (cat.id_animal = a.id_animal);

CREATE OR REPLACE VIEW  
	USUARIOS_SIN_COMPRAS_HACE_3_MESES AS
	SELECT u.id_usuario, u.nombre_de_usuario, u.email
	FROM USUARIOS AS u
	WHERE u.id_usuario NOT IN(
		SELECT DISTINCT o.id_usuario
		FROM ORDENES_DE_COMPRA as o
		WHERE fecha_de_orden >= DATE_SUB(NOW(), INTERVAL 3 MONTH)
    );
