USE petshop_ecommerce;
/*SET SQL_SAFE_UPDATE=FALSE;*/
/*Tabla animales*/
INSERT INTO  petshop_ecommerce.ANIMALES (nombre)
 VALUES
('Perros'),
('Gatos'),
('Aves'),
('Peces'),
('Roedores'),
('Otros');


/* Tabla categorias*/
INSERT INTO  petshop_ecommerce.CATEGORIAS
(nombre,
id_animal)
VALUES
('Alimentos',1),
('Snacks',1),
('Paseo y viajes',1),
('Juguetes',1),
('Camas e indumentaria',1),
('Salud',1),
('Alimentos',2),
('Accesorios',2),
('Paseo y viajes',2),
('Camas e indumentaria',2),
('Higiene y belleza',2),
('Salud',2),
('Alimentos',3),
('Accesorios',3),
('Salud',3),
('Alimentos',4),
('Peceras',4),
('Salud',4),
('Alimentos',5),
('Accesorios',5);

/*Tabla subcategorias*/
INSERT INTO  petshop_ecommerce.SUBCATEGORIAS
(nombre , id_categoria)
VALUES
('Alimento Seco',1),
('Alimento Humedo',1),
('Alimento Medicado',1),
('Galletas Secas',2),
('Sticks dentales',2),
('Huesos',2),
('Bozales',3),
('Collares',3),
('Chapitas',3),
('Juguetes con sonido',4),
('Juguetes dentales',4),
('Sogas y pelotas',4),
('Camas',5),
('Colchonetas',5),
('Moises',5),
('Antiparacitos',6),
('Medicamentos',6),
('Alimento Seco',7),
('Alimento Humedo',7),
('Alimento Medicados',7),
('Hierbas',8),
('Juguetes',8),
('Rascadores',8),
('Chapitas',9),
('Collares y correas',9),
('Transportadoras',9),
('Camas',10),
('Colchonetas',10),
('Moises',10),
('Piedras',11),
('Arena',11),
('Antiparacitos',12),
('Medicamentos',12),
('Golosinas y Semillas',13),
('Jaulas y Jaulones',14),
('Juguetes - Accesorios',14),
('Medicamentos',15),
('Alimento de Agua Fria',16),
('Alimento de Agua Tropical',16),
('Accesorios',17),
('Calefaccion - Iluminacion - Filtrado',17),
('Peceras - Acuarios',17),
('Salud general',18),
('Balanceados',19),
('Hamsteras y Jaulas',20),
('Juguetes y Accesorios',20);

/* Tabla Marcas*/
INSERT INTO  petshop_ecommerce.MARCAS
	(nombre, contacto)
VALUES
	('Generico','-'),
	('Pro Plan','3429265350'),
    ('Royal Canin','114206331'),
    ('Old Prince','3515426007'),
    ('Vital Can','3839936103'),
    ('Mon Ami','3834139758'),
    ('Cancat','3831132665'),
    ('Kikadog','2643140711'),
    ('My Family','3425259116'),
    ('Millex','2233231746'),
    ('Zootec','3831188120'),
    ('Shulet','2217676112'),
    ('Marina','2214432393'),
    ('Aqua Clear','2648227515'),
    ('Nelsoni Ranch','3414082077'),
    ('Whiskas','3421138602');

/* Tabla Productos*/
INSERT INTO  petshop_ecommerce.PRODUCTOS
	(nombre,
	descripción,
    precio,
	imagen,
    cantidad_disponible,
    estado,
	id_subcategoria,
    id_marca)
VALUES
	('Old Prince Premium Adultos Pollo Y Carne X 20+3 Kg','Old Prince Premium Adultos sabor Pollo y Carne de 20+3kg es un alimento balanceado para perros adultos',34400.00,'/oldprince',3,'publicado',1,4),
    ('Pro Plan Perro Adulto Mediano X 15 Kg + 3 Kg','Pro Plan incorporó a su fórmula de alimentos balanceados la espirulina, componente que ayuda a proteger los sistemas inmune y digestivo de tu perro',19500.00,'/proplan',6,'publicado',1,2),
    ('Royal Canin Dachshund X 85 Gr','Royal Canin Dachshund es un alimento húmedo con textura tipo paté para perros, a partir de los 10 meses de edad',1868.00,'/royalcanninhum',4,'publicado',2,3),
	('Royal Canin Perro Veterinary Hipoalergénico X 10 Kg','Royal Canin Hypoallergenic DR 21 es un alimento balanceado de prescripción para perros, destinado a reducir la intolerancia a ingredientes y nutrientes (alergia alimentaria)',94975.00,'/royalcanninmed',1,'publicado',3,3),
    ('MON AMI STICK CHICKEN MEAT X 400 GR','Galletas secas con sabor a pollo',6224.00,'/dogchickencookie',10,'publicado',4,6),
    ('Snack Mon Ami Dental Clean X 400 Grs','Deliciosos snacks hecho de ingredientes de alta calidad. La higiene dental ayuda a prevenir enfermedades y mejora el aliento de tu mascota.',7098.00,'/monamisnackdental',10,'publicado',5,6),
    ('Hueso 20/21','Hueso para mascar.',25000.00,'/hueso2021',8,'publicado',6,1),
    ('Bozal Tipo Canasta De Alambre Para Rottweiler','Bozal canasta de metal está acolchonado con cuero natural, desarrollado especialmente para perro tipo Rottweiler o de raza similar.',2500.00,'/bozal1',2,'publicado',7,8),
    ('Pretal Regulable L 4 Cm Kikadog','Pretal regulable fabricado con materiales de óptima calidad y diseñado exclusivamente para que se ajuste de la forma correcta al pecho de tu mascota.',25000.00,'/pretal1',6,'publicado',8,8),
    ('Chapita Identiificatoria Classic Big Red Pawprint','Chapitas identificatorias producidas en metal por microfusión con material analérgico.',25500.00,'/chapitaroja',20,'publicado',9,9),
    ('Juguete Frisbee Plástico Perro','Divertido juguete de frisbee en simpáticos colores.',2500.00,'/frisbee1',10,'publicado',10,9),
    ('Royal Canin Gato Fit 32 X 15 Kg','Alimento para gatos adultos con peso ideal, actividad física moderada y que poseen acceso al exterior, de 1 a 7 años de edad.',136000.00,'/royalcanin15kg',3,'publicado',18,3),
    ('Pro Plan Gato Adulto X 15 Kg','Pro Plan Gato Adulto con Optiprebio contiene una combinación óptima de prebióticos y antioxidantes para optimizar la digestión y fortalecer las defensas de tu gato.',115000.00,'/proplangato15kg',1,'publicado',18,2),
    ('Pouch Whiskas Pollo En Salsa X 85 Grs Adulto','Whiskas Gato Sobrecito es alimento húmedo 100% completo y balanceado cocido al vapor.',650.00,'/whiskahumedo85g',8,'publicado',19,16),
    ('Royal Canin Gato Adulto Urinary High Dilution S/O X 7.5 Kg','Royal Canin Urinary High Dilution es un alimento dietético completo para gatos destinado a la disolución de los cálculos de estruvita y a la reducción de las recidivas por sus propiedades acidificantes y por su capacidad de generar un bajo nivel de saturación de la orina',81704.00,'/royalcaninuri7kg',1,'publicado',20,3),
    ('Marina Deluxe Aq.Kit 38L','Acuario de 38 Litros de altisima calidad',150000.00,'/marinakit38L',1,'borrador',42,13);

/* Tabla Metodos de Pago*/

INSERT INTO petshop_ecommerce.METODOS_DE_PAGO
	(nombre)
VALUES
	('Efectivo'),
    ('Debito'),
    ('Transferencia bancaria'),
    ('Credito a una cuota'),
    ('Credito a tres cuotas');
/* Tabla Usuarios*/
INSERT INTO petshop_ecommerce.USUARIOS 
    (nombre_de_usuario, nombres, apellidos, email, contrasena)
VALUES
    ('ChandB', 'Chand', 'Borel', 'cborel0@gmail.com', 'vN_Ud6x6F'),
    ('KATY_AR', 'Katy', 'Anker', 'kanker1@gmail.com', 'cS#pY~rmbOc8|z'),
    ('McBean_EU', 'Shelby', 'MacBean', 'smacbean2@europa.eu', 'mV?|&{XI~"dt}2'),
    ('S_Solano', 'Simon', 'Solano', 'ss_3215@gmail.com', 'aJ<b1(=7Z_NW<'),
    ('tucco', 'Tucco', 'Salamanca', 'tuccoS@gmail.com', 'wX$`42q@.'),
    ('Gandalf_W', 'Ryan', 'Dibdall', 'rdibdall5@gmail', 'rX\nF83"2qtd9t'),
    ('jfreeburn6', 'Jacquelynn', 'Freeburn', 'jfreeburn6@gmail', 'qD"II"+oH#7UP'),
    ('flakeland7', 'Florencia', 'Lakeland', 'flakeland7@stumbleupon.com', 'nW&B`S(Xo@>$.0Q'),
    ('rcusiter8', 'Rhetta', 'Cusiter', 'rcusiter8@nbcnews.com', 'fK''=84A|,3vSFr'''),
    ('ssandars9', 'Sheeree', 'Sandars', 'ssandars9@bing.com', 'eN<qWMe}K)UAT'),
    ('nsladea', 'Nanette', 'Slade', 'nsladea@newsvine.com', 'lK}Oap>/x"o9N{'),
    ('ff_1986', 'Frank', 'Fitzharris', 'ffitzharrisb@free.fr', 'gK''R<"`b10}E('),
    ('lmacpaikec', 'Lorne', 'MacPaike', 'lmacpaikec@nba.com', 'dL,GV+}mj)4!kw'),
    ('rtourotd', 'Ranee', 'Tourot', 'rtourotd@hud.gov', 'xE@onnJws+%>Q'),
    ('cloadwicke', 'Carlie', 'Loadwick', 'cloadwicke@goo.gl', 'xN`Ho?}R"yk&+7'),
    ('tmechellf', 'Theodoric', 'Mechell', 'tmechellf@google.cn', 'kC,!O/"Kxt=v'),
    ('dclementetg', 'Duffy', 'Clementet', 'dclementetg@imdb.com', 'zS*7W5Rn'),
    ('lhousinh', 'Lynnea', 'Housin', 'lhousinh@disqus.com', 'pX$N4P2=e>MM'),
    ('djemmetti', 'Donaugh', 'Jemmett', 'djemmetti@oakley.com', 'iW<1P2OgGe,0yK8+'),
    ('lruecastlej', 'Ludovico', 'Ruecastle', 'lruecastlej@marketwatch.com', 'vS.oRc_Z6|I"_Lu_');

/* Tabla Direcciones*/ 
INSERT INTO petshop_ecommerce.DIRECCIONES (calle, piso, localidad, provincia, pais, codigo_postal) VALUES
('Av. Juan Domingo Peron 742', '1A', 'Hurlingham', 'Buenos Aires', 'Argentina', '1234'),
('Churruca 5368', NULL, 'Córdoba', 'Córdoba', 'Argentina', '5678'),
('Peralta 223', '', 'Mendoza', 'Mendoza', 'Argentina', '9012'),
('Pasaje Los Olivos 852', 'PB', 'Rosario', 'Santa Fe', 'Argentina', '3456'),
('Diagonal Norte 445', '3C', 'La Plata', 'Buenos Aires', 'Argentina', '7890'),
('Av. del Libertador 1550', '5D', 'San Isidro', 'Buenos Aires', 'Argentina', '1122'),
('Perdiguero 4298', '6E', 'Tigre', 'Buenos Aires', 'Argentina', '3344'),
('Boulevard Oroño 999', '', 'Rosario', 'Santa Fe', 'Argentina', '5566'),
('Avenida de Mayo 1600', '4F', 'Buenos Aires', 'Buenos Aires', 'Argentina', '7788'),
('Camino de los Remedios 652', '7G', 'Salta', 'Salta', 'Argentina', '9900'),
('Av. Independencia 145', '8H', 'Jujuy', 'Jujuy', 'Argentina', '2233'),
('Calle Rivadavia 2020', '', 'Neuquén', 'Neuquén', 'Argentina', '4455'),
('Calle San Martín 303', '9I', 'Bariloche', 'Río Negro', 'Argentina', '6677'),
('Rivadavia 742', NULL, 'Comodoro Rivadavia', 'Chubut', 'Argentina', '8899'),
('Pasaje Luna Llena 963', '10J', 'Ushuaia', 'Tierra del Fuego', 'Argentina', '1010');


/* Tabla USUARIOS_DIRECCIONES*/
INSERT INTO petshop_ecommerce.USUARIOS_DIRECCIONES(id_usuario, id_direccion) VALUES
(1,1),(2,1),(2,2),(3,3),(4,4),(5,4),
(6,5),(7,6),(8,7),(9,8),(10,8),(11,9),
(12,10),(13,10),(14,11),(15,12),(16,12),
(17,13),(18,14),(19,15),(20,8);

/*Tabla CARRITOS*/
INSERT INTO petshop_ecommerce.CARRITOS (id_usuario, fecha_interaccion) VALUES
(1, '2023-07-01 10:00:00'),
(2, '2023-08-02 11:30:00'),
(3, '2023-08-15 18:45:00'),
(4, '2023-09-04 09:00:00'),
(5, '2023-11-05 15:15:00'),
(6, '2024-01-02 11:30:00'),
(7, '2024-02-09 10:45:00'),
(8, '2024-02-15 17:00:00'),
(9, '2024-02-22 15:15:00'),
(10, '2024-03-04 12:30:00'),
(11, '2024-04-13 14:45:00'),
(12, '2024-04-22 15:00:00'),
(13, '2024-05-03 10:15:00'),
(14, '2024-05-10 13:30:00'),
(15, '2024-06-01 12:45:00'),
(16, now()),
(17, now()),
(18, now()),
(19, now()),
(20, now());
/* Tabla ITEM_CARRITO*/
INSERT INTO petshop_ecommerce.ITEM_CARRITO (id_carrito, id_producto, precio_final, cantidad) VALUES
(1, 1, 35400.00, 2),
(1, 2, 19800.00, 2),
(2, 2, 19800.00, 1),
(2, 3, 1950.00, 1),
(3, 3, 1980.00, 3),
(4, 4, 95000.00, 1),
(4, 13, 115000.00, 1),
(5, 1, 34400.00, 4),
(5, 6, 36000.00, 1),
(6, 7, 26000.00, 2),
(7, 2, 19500.00, 1),
(8, 8, 2500.00, 3),
(9, 9, 25000.00, 1),
(10, 10, 25550.00, 2),
(10, 15, 81704.00, 1),
(11, 2, 20000.00, 2),
(11, 5, 6224.00, 4),
(11, 6, 7100.00, 3),
(12, 15, 81704.00, 1),
(13, 12, 140000.00, 1),
(14, 15, 82000.00, 3),
(15, 14, 850.00, 5),
(16, 1, 36000.00, 2),
(16, 5, 6400.00, 1),
(16, 6, 7500.00, 3),
(17, 4, 98000.00, 1),
(17, 8, 2700.00, 4),
(17, 14, 850.00, 7),
(18, 3, 2100.00, 5),
(18, 7, 30000.00, 1),
(19, 5, 7500.00, 2),
(19, 15, 83000.00, 1),
(20, 16, 16000.00, 1);

/* Tabla ORDENES_DE_COMPRA*/

INSERT INTO petshop_ecommerce.ORDENES_DE_COMPRA(id_usuario,id_metodo_pago,fecha_de_orden) VALUES
(1,1,'2024-04-13 10:00:00'),
(2,1,'2024-04-15 12:00:00'),
(3,2,'2024-04-21 13:00:00'),
(1,4,'2024-04-28 17:00:00'),
(4,2,'2024-04-30 09:00:00'),
(5,3,'2024-05-03 10:00:00'),
(6,1,'2024-05-07 12:00:00'),
(2,3,'2024-05-13 09:00:00'),
(5,4,'2024-05-14 15:00:00'),
(4,1,'2024-05-15 14:00:00'),
(7,5,'2024-05-15 13:00:00'),
(3,1,'2024-05-21 16:00:00'),
(10,1,'2024-05-24 10:00:00'),
(9,2,'2024-05-25 11:00:00'),
(8,2,'2024-06-01 12:00:00'),
(11,3,'2024-06-03 17:00:00'),
(1,3,'2024-06-16 14:00:00'),
(12,3,'2024-06-21 10:00:00'),
(13,1,'2024-07-05 15:00:00'),
(14,2,'2024-07-06 16:00:00'),
(15,2,'2024-07-17 11:00:00');

/* Tabla DETALLE_DE_ORDEN*/

INSERT INTO petshop_ecommerce.DETALLE_DE_ORDEN(id_orden, id_producto, precio_final, cantidad)VALUES 
(1,1,34400,1),
(1,5,6240,3),
(2,2,19500,1),
(2,3,1870,2),
(3,4,95000,1),
(4,5,6230,3),
(5,14,650,1),
(6,2,19500,1),
(6,3,1870,5),
(7,1,34400,1),
(8,8,2500,1),
(9,11,2500,1),
(10,9,25000,1),
(10,10,25500,1),
(11,12,136000,1),
(12,2,19500,1),
(13,3,1870,3),
(14,13,115000,1),
(14,14,650,2),
(15,14,650,5),
(16,15,81705,1),
(17,11,2500,1),
(18,12,136000,1),
(19,16,150000,1),
(20,4,95000,1);