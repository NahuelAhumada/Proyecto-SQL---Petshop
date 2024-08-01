USE petshop_ecommerce;
CREATE OR REPLACE VIEW 
	petshop.view_compras_en_este_anio
    (fecha_de_compra, id_usuario, monto_de_compra)
	AS (
			SELECT
				fecha_de_orden,
                id_usuario,
                total_a_pagar
			FROM
				petshop_ecommerce.ordenes_de_compra
    );
    