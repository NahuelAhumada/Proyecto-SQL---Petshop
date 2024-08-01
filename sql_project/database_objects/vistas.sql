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
