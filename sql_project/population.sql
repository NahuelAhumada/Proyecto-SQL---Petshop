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
SELECT cat.id_categoria, cat.nombre, a.nombre FROM CATEGORIAS as cat
JOIN ANIMALES as a
ON cat.id_animal = a.id_animal;
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
INSERT INTO USUARIOS 
    (nombre_de_usuario, nombres, apellidos, email, contrasena)
VALUES
    ('cborel0', 'Chandal', 'Borel', 'cborel0@kickstarter.com', 'vN_Ud6x6F'),
    ('kanker1', 'Katy', 'Anker', 'kanker1@si.edu', 'cS#pY~rmbOc8|z'),
    ('smacbean2', 'Shelby', 'MacBean', 'smacbean2@europa.eu', 'mV?|&{XI~"dt}2'),
    ('gszymonowicz3', 'Gypsy', 'Szymonowicz', 'gszymonowicz3@163.com', 'aJ<b1(=7Z_NW<'),
    ('tcuckoo4', 'Tamma', 'Cuckoo', 'tcuckoo4@photobucket.com', 'wX$`42q@.'),
    ('rdibdall5', 'Ryan', 'Dibdall', 'rdibdall5@loc.gov', 'rX\nF83"2qtd9t'),
    ('jfreeburn6', 'Jacquelynn', 'Freeburn', 'jfreeburn6@google.com.hk', 'qD"II"+oH#7UP'),
    ('flakeland7', 'Florencia', 'Lakeland', 'flakeland7@stumbleupon.com', 'nW&B`S(Xo@>$.0Q'),
    ('rcusiter8', 'Rhetta', 'Cusiter', 'rcusiter8@nbcnews.com', 'fK''=84A|,3vSFr'''),
    ('ssandars9', 'Sheeree', 'Sandars', 'ssandars9@bing.com', 'eN<qWMe}K)UAT'),
    ('nsladea', 'Nanette', 'Slade', 'nsladea@newsvine.com', 'lK}Oap>/x"o9N{'),
    ('ffitzharrisb', 'Fielding', 'Fitzharris', 'ffitzharrisb@free.fr', 'gK''R<"`b10}E('),
    ('lmacpaikec', 'Lorne', 'MacPaike', 'lmacpaikec@nba.com', 'dL,GV+}mj)4!kw'),
    ('rtourotd', 'Ranee', 'Tourot', 'rtourotd@hud.gov', 'xE@onnJws+%>Q'),
    ('cloadwicke', 'Carlie', 'Loadwick', 'cloadwicke@goo.gl', 'xN`Ho?}R"yk&+7'),
    ('tmechellf', 'Theodoric', 'Mechell', 'tmechellf@google.cn', 'kC,!O/"Kxt=v'),
    ('dclementetg', 'Duffy', 'Clementet', 'dclementetg@imdb.com', 'zS*7W5Rn'),
    ('lhousinh', 'Lynnea', 'Housin', 'lhousinh@disqus.com', 'pX$N4P2=e>MM'),
    ('djemmetti', 'Donaugh', 'Jemmett', 'djemmetti@oakley.com', 'iW<1P2OgGe,0yK8+'),
    ('lruecastlej', 'Ludovico', 'Ruecastle', 'lruecastlej@marketwatch.com', 'vS.oRc_Z6|I"_Lu_');

/* Tabla Direcciones*/ 
INSERT INTO DIRECCIONES (calle, piso, localidad, provincia, pais, codigo_postal) VALUES
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
INSERT INTO USUARIOS_DIRECCIONES(id_usuario, id_direccion) VALUES
(1,1),
(2,1),
(2,2),
(3,3),
(4,4),
(5,4),
(6,5);