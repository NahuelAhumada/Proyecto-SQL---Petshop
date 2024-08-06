USE petshop_ecommerce;
CREATE OR REPLACE VIEW 
	TotalAPagarPorCarrito
	AS 
		SELECT us.nombre_de_usuario,
			SUM(items.precio_final * items.cantidad ) AS total_a_pagar
		FROM ITEM_CARRITO as items
        INNER JOIN CARRITOS as cart ON (cart.id_carrito=items.id_carrito)
        INNER JOIN USUARIOS as us ON (us.id_usuario=cart.id_usuario)
        GROUP BY us.nombre_de_usuario;

CREATE OR REPLACE VIEW
	DiezProductosMasComprados
    AS
		SELECT id_producto, SUM(cantidad) AS Total_Comprado
        FROM DETALLE_DE_ORDEN
        GROUP BY id_producto
        ORDER BY Total_Comprado DESC
        LIMIT 10;
CREATE OR REPLACE VIEW ProductosVendidoPorPrecioFinal AS
	SELECT
    o.fecha_de_orden,
    o.id_orden,
    p.id_producto,
    p.nombre,
    p.cantidad_disponible,
    CONCAT('$ ', CAST(d.precio_final AS CHAR(13))) AS 'Precio Final'
    FROM
    Productos as P
    JOIN DETALLE_DE_ORDEN AS d ON (p.id_producto = d.id_producto)
	JOIN ORDENES_DE_COMPRA AS o ON(d.id_orden = o.id_orden)
    ORDER by o.fecha_de_orden DESC;

CREATE OR REPLACE VIEW FechaUltimaCompraDeCadaUsuario AS
	SELECT u.id_usuario, o.id_orden ,u.nombre_de_usuario, u.email, MAX(o.fecha_de_orden) as 'Ultima fechas de compra' 
	FROM USUARIOS AS u
	JOIN ORDENES_DE_COMPRA AS o ON(u.id_usuario=o.id_usuario)
	GROUP BY  u.id_usuario, u.nombre_de_usuario, u.email;
    
CREATE OR REPLACE VIEW VisualizacionDeSubcategorias AS
	SELECT sub.id_subcategoria, sub.nombre as 'Subcategoria', cat.nombre as 'Categoria', a.nombre as 'Animal'
    FROM SUBCATEGORIAS as sub
    JOIN CATEGORIAS as cat ON (sub.id_categoria = cat.id_categoria)
    JOIN ANIMALES as a ON (cat.id_animal = a.id_animal);
CREATE OR REPLACE VIEW  UsuariosQueNoCompraronEn3Meses AS
	SELECT u.nombre_de_usuario, u.email
    FROM USUARIOS AS u
    WHERE u.id_usuario NOT IN(
		SELECT o.id_usuario
        FROM ORDENES_DE_COMPRA
        WHERE fecha_de_orden >= DATE_SUB(NOW(), INTERVAL 3 MONTH)
    );