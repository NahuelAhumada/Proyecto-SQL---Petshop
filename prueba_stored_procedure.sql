USE petshop_ecommerce;

SELECT * FROM ITEM_CARRITO WHERE id_carrito IN (1,2,3);
SELECT id_usuario, id_carrito FROM CARRITOS WHERE id_carrito IN (1,2,3);
SELECT * FROM PRODUCTOS WHERE id_producto IN (1,2,3);
SELECT calcular_precio_final(calcular_precio_total_de_carrito(1), 2);

/*Al llamar realizar_compra() con carrito 1, la cantidad del producto 1 debe bajar a 6 y la del producto 2 a 4 y se generan los nuevos registros*/
CALL realizar_compra(1, 2, NULL);
/*Al cancelar la compra, el stock vuelve a recomponerse*/
CALL cancelar_compra(id_ultima_orden_de_compra_de_usuario(1));

/*Error al intentar pasar un id de direccion no relacionada al usuario*/
CALL realizar_compra(2, 1, 6);
/*Al pagar en efectivo, el monto en el pago será 10% menos*/
CALL realizar_compra(2, 1, 2);
SELECT calcular_precio_total_de_orden(id_ultima_orden_de_compra_de_usuario(2));
SELECT * FROM petshop_ecommerce.PAGOS WHERE id_orden = id_ultima_orden_de_compra_de_usuario(2);