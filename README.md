# Proyecto-SQL Petshop

Repositorio creado para el Curso de SQL de Coderhouse

### Descripción

Esta es una base de datos diseñada para la gestión de un e-commerce con la tematica de articulos para mascotas.

### Requerimientos a cumplir

1. Gestion de usuarios: Debe almacenar la información de los usuarios, contemplando la posibilidad de que estos tengan asignados más de una dirección de residencia posible para realizar un envio.
2. Gestion de productos: Cada producto registrado debe estar categorizado tanto por el tipo de animal al que este destinado como por sus caracteristicas (Ejemplo: en un tienda puede haber alimentos para perros como para peces. Mientras que los alimentos para perros pueden categorizarse por edad, los alimentos para peces pueden categorizarse dependiendo de si son de agua fria o tropicales). Asimismo, cada registro debe contener información relevante para su publicación.
3. Gestion de Carrito de compra: Cada usuario debe estar relacionado a un carrito de compra con el cual podrá gestionar la compra de varios productos.
4. Gestion de Compras: Se debe llevar un registro de las compras efectuadas, teniendo los productos que la componen, incluyendo sus respectivas cantidades, el usuario que la efectua, la fecha y hora en la que se realize y el metodo de pago utilizado.
## Importante
Para la funcionalidad de los STORED PROCEDURES, es necesario correr la siguiente linea:

```sql
SET SQL_SAFE_UPDATE=FALSE;
```
En mi version de MYSQL WORKBENCH 8.0 generó un error y tuve que cambiarlo de la siguiente forma
-> Edit -> Preferences -> SQL Editor -> Destildar la opcion 'Safe updates'

### Tablas

1. **USUARIOS**
  - Almacena los datos de cada usuario registrado en el ecommerce
  - Atributos: id_usuario, nombre_de_usuario, nombres, apellidos,email, contresena
    
2. **DIRECCIONES**
  - Cada usuario tiene la posibilidad de tener más una dirección y, en ciertos casos, más de un usuario puede tener la misma dirección. Por lo tanto se utiliza una tabla de direcciones relacionadas a usuarios
  - Atributos: id_direccion, calle, piso, localidad, provincia, pais, codigo_postal

3. **USUARIOS_DIRECCIONES**
- Debido a que mas de un usuario puede compartir la mismo domicilio con otra persona y al mismo tiempo tener más de un domicilio valido para realizar un envio, estable una relación n a n
- Atributos: id_usuario, id_direccion
   
4. **CARRITOS**
  - Tabla de Carrito de compra. Cada uno esta asignado a un unico usuario. Pasado cierto tiempo, un carrito de compra que no haya efecutado una compra debería vaciarse, por lo tanto se almacena la fecha de creación para poder verificarla.
  - Atributos: id_carrito, id_usuario, fecha_creacion, total_a_pagar

5. **ITEM_CARRITO**
  - Tabla intermedia para la relación de carritos con los productos.
  - Atributos: id_carrito, id_producto, cantidad

6. **ORDENES_DE_COMPRA**
  - Tabla para hechos que registra en que momento se realiza transaccion de compra y el usuario la efectua.
  - Atributos: id_orden, id_usuario, id_metodo_pago, fecha_de_orden, total_a_pagar
  
7. **DETALLE_DE_ORDEN**
  - Tabla de union para la relacion n-n entre las ordenes de compra y los productos. Debido a que es posible que el precio oficial de un producto no coincida con el precio final, se e agrego un campo extra de precio en esta tabla para que figure en la facturación final.
  - Atributos: id_orden, id_producto, id_cantida, precio_final

8. **METODOS_DE_PAGO**
  - Tabla para registrar los metodos de pago disponibles
  - Atributos: id_metodo_pago, nombre

9. **PRODUCTOS**
  - Registro de los productos disponible. Cada producto cuenta con sus respectivo precio, descripción, imagen de publicación, cantidad en stock y un dato que indica en que estado se encuentra (publicado, en borrador o no disponible). Los productos deben poder filtrarse dentro de la pagina, tanto por la marca como por su categoria.
  - Atributos: id_producto, nombre, descripción, imagen, cantidad_disponible, estado, id_subcategoria, id_marca

10. **MARCAS**
  - Tabla que almacena las marcas disponibles con las se trabaja
  - Atributos: id_marca, nombre

11. **SUBCATEGORIAS**
  - Ultimo nivel  de categorias para los productos. Cada subcategoria debe estar relacionada a la categoria que le corresponde(Ejemplo: La categoria de Salud puede relacionarse con las subcategorias Antiparacitarios y Medicamentos)
  - Atributos: id_subcategoria, nombre, id_categoria

12. **CATEGORIAS**
  - Tabla de categorias para los productos, relacionado a la especie animal para la cual esta dirigido.
  - Atributos: id_categoria, nombre, id_animal
  
13. **ANIMALES**
  - Tabla que almacena los tipos de animales para los cuales se van a vender los productos
  - Atributos: id_animales, nombre

![DRM](images/Petshop.png)

### Insercion
Los datos para cada tabla se obtienen al correr el archivo  'population.sql' por medio de multiples INSERT INTO

### Vistas

Se consideró de utilidad tener a disponición las siguientes vista:
1. TotalAPagarPorCarrito: Almacena una query que permite visualizar el precio de cada carrito de compra activo con el fin de tener a consideración las posibles ventas
2. DiezProductosMasComprados: Permite mostrar los 10 productos más vendidos historicamente

### STORED PROCEDURES

1. revision_carritos():
  Mediante este procedimiento se buscar automatizar el limpiado de aquellos carritos de compra que llevan abierto por más de 2 dos días. Si bien esta implementado como un STORED PROCEDURE, podría implementarse tambien como un EVENTO.

```sql
DELETE FROM ITEM_CARRITO
    WHERE id_carrito IN
		(SELECT c.id_carrito FROM CARRITOS as C
    WHERE c.fecha_interaccion<= date_sub(now(), INTERVAL 2 DAY)); 
```

2. realizar_compra(IN var_id_carrito INT, IN var_id_metodo_pago INT)
   Por medio de este procedimiento, una vez que sa validen los datos ingresados, se genera una nueva orden de compra correspondiendo al usuario dueño del carrito. Luego de esto, los datos de cada producto relacionado al carrito, pasan a ser relacionado a la orden de compra generada ingresandolos en la tabla DETALLE_ORDEN. Una vez hecho esto, se vacia el carrito de compra correspodiente al id_carrito que se pasó por parametro.

###Triggers
1. validar_productos_al_insertar()
2. validar_producto_al_actualizar
3. crear_carrito_para_usuario
   

### Ideas para integrar al proyecto final:
1. Llevar a cabo un registro de proveedores, de acuerdo a la marca de los productos
2. Gestionar los envios de acuerdo a la orden de compra y la dirección ingresada por el usuario
3. Revisar el estado de los pagos, en el caso de integrar compras con cuotas
4. Gestionar devoluciones y anulaciones de compra
5. Detallar el tipo de Facturación. En el caso de Factura A se debe incluir la entidad y el cuil
