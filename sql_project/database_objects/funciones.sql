DELIMITER //

CREATE FUNCTION UltimaFechaDeCompra(var_id_usuario INT) RETURNS DATETIME
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE ultima_fecha DATETIME;
    SELECT MAX(fecha_de_orden)
    INTO ultima_fecha
    FROM ordenes_de_compra
    WHERE id_usuario = var_id_usuario;
    
    RETURN ultima_fecha;
END //
DELIMITER ;



DROP FUNCTION IF EXISTS CalcularPrecioTotalDeOrden;
DELIMITER //
CREATE FUNCTION CalcularPrecioTotalDeOrden(var_id_orden INT) RETURNS FLOAT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE resultado FLOAT;
    SELECT SUM(precio_final * cantidad) 
    INTO resultado
    FROM DETALLE_DE_ORDEN
    WHERE id_orden = var_id_orden;
    
    RETURN RESULTADO;
END //
DELIMITER ;

SELECT id_orden, CalcularPrecioTotalDeOrden(id_orden) AS 'Total a pagar'
FROM detalle_de_orden
GROUP BY id_orden;