USE petshop_ecommerce;
CREATE OR REPLACE VIEW 
	TotalAPagarPorCarrito AS 
		SELECT
			us.id_usuario,
			us.nombre_de_usuario,
			calcular_precio_total_de_carrito(cart.id_carrito) AS total_a_pagar
		FROM CARRITOS AS cart
        INNER JOIN USUARIOS as us ON (us.id_usuario=cart.id_usuario)
        GROUP BY us.id_usuario, us.nombre_de_usuario;

CREATE OR REPLACE VIEW
	CantidadCompradaDeProductos AS
		SELECT calculo.id_producto, p.nombre,  calculo.Cantidad_Comprada
        FROM (SELECT id_producto, SUM(cantidad) AS Total_Comprado
			FROM DETALLE_DE_ORDEN
			GROUP BY id_producto) as calculo
		JOIN PRODUCTOS as p
        ON (calculo.id_producto = p.id_producto);

CREATE OR REPLACE VIEW 
	ProductosVendidoPorPrecioFinal AS
	SELECT
	o.id_orden,
    o.fecha_de_orden,
    p.id_producto,
    p.nombre as nombre_de_producto,
    CONCAT('$ ', CAST(d.precio_final AS CHAR(13))) AS 'Precio de venta',
    d.cantidad
    FROM
    Productos as P
    JOIN DETALLE_DE_ORDEN AS d ON (p.id_producto = d.id_producto)
	JOIN ORDENES_DE_COMPRA AS o ON(d.id_orden = o.id_orden);

CREATE OR REPLACE VIEW 
	FechaUltimaCompraDeCadaUsuario AS
		SELECT u.id_usuario, u.nombre_de_usuario, u.email, MAX(o.fecha_de_orden) as 'Ultima fecha de compra' 
		FROM USUARIOS AS u
		JOIN ORDENES_DE_COMPRA AS o ON(u.id_usuario=o.id_usuario)
		GROUP BY  u.id_usuario, u.nombre_de_usuario, u.email;
    
CREATE OR REPLACE VIEW 
	VisualizacionDeSubcategorias AS
		SELECT sub.id_subcategoria, sub.nombre as 'Subcategoria', cat.nombre as 'Categoria', a.nombre as 'Animal'
		FROM SUBCATEGORIAS as sub
		JOIN CATEGORIAS as cat ON (sub.id_categoria = cat.id_categoria)
		JOIN ANIMALES as a ON (cat.id_animal = a.id_animal);

CREATE OR REPLACE VIEW  
	UsuariosQueNoCompraronEn3Meses AS
		SELECT u.id_usuarios, u.nombre_de_usuario, u.email
		FROM USUARIOS AS u
		WHERE u.id_usuario NOT IN(
			SELECT o.id_usuario
			FROM ORDENES_DE_COMPRA
			WHERE fecha_de_orden >= DATE_SUB(NOW(), INTERVAL 3 MONTH)
    );