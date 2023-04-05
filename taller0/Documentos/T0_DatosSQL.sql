-- Selecciona la BD a usar
use taller_0;
-- Crear sexos
insert into sexo (sexo) values 
	('otro'),
	('hombre'),
    ('mujer');
-- Crea un primer registro dummy
insert into persona		(nombre, apellido, edad, telefono, sexo)	values	('nn','nn','0','999999999','3');

-- Con el anterior registro permite crear los demas elementos
insert into municipio	(nombre,area,presupuesto,gobernador)		values	('Bogota','10','1500','1');
insert into vivienda	(direccion,capacidsexoad,niveles,ubicacion)		values	('Cra 24 69 22','20','4','1');
insert into propietarios(persona_id,vivienda_id)					values	('1','1');

-- ahora podemos hacer que vivienda y cabeza de hogar sean obligatorios
-- Pero primero debemos agregar la informacion restante al registro ya creado
update persona set vivienda = '1' where id = '1';
update persona set cabeza_hogar = '1' where id = '1';
-- ahora si
alter table persona modify column vivienda int not null;
alter table persona modify column cabeza_hogar int not null;

alter table persona modify column cabeza_hogar int default 1;

-- creamos 10 personas para que gobiernen 10 nuevos municipios
insert into persona		(nombre, apellido, edad, telefono, sexo, vivienda, cabeza_hogar)	values	('Sara','Selene'		,'23','1234567890'	,'2','1','1');
insert into persona		(nombre, apellido, edad, telefono, sexo, vivienda, cabeza_hogar)	values	('Juan','Sanchez'		,'22','1837041495'	,'1','1','1');
insert into persona		(nombre, apellido, edad, telefono, sexo, vivienda, cabeza_hogar)	values	('Holga','Set'			,'50','8286408233'	,'2','1','1');
insert into persona		(nombre, apellido, edad, telefono, sexo, vivienda, cabeza_hogar)	values	('Esteban','Gonzalez'	,'30','9984565558'	,'1','1','1');
insert into persona		(nombre, apellido, edad, telefono, sexo, vivienda, cabeza_hogar)	values	('Amelia','Gutierrez'	,'60','5421322353'	,'2','1','1');
insert into persona		(nombre, apellido, edad, telefono, sexo, vivienda, cabeza_hogar)	values	('Catalina','Zambrano'	,'24','5280088970'	,'2','1','1');
insert into persona		(nombre, apellido, edad, telefono, sexo, vivienda, cabeza_hogar)	values	('David','Gonzalez'		,'45','9466600051'	,'1','1','1');
insert into persona		(nombre, apellido, edad, telefono, sexo, vivienda, cabeza_hogar)	values	('Alejandra','Villate'	,'25','5867012887'	,'2','1','1');
insert into persona		(nombre, apellido, edad, telefono, sexo, vivienda, cabeza_hogar)	values	('Camilo','Rubio'		,'26','3875543590'	,'1','1','1');
insert into persona		(nombre, apellido, edad, telefono, sexo, vivienda, cabeza_hogar)	values	('Diomedes','Dias'		,'27','4081649033'	,'1','1','1');
insert into persona		(nombre, apellido, edad, telefono, sexo, vivienda)					values	('Zendaya','Gutierrez'	,'25','1593578526'	,'1','1');

-- municipios
-- la data a continuacion es generada de forma automatica
INSERT INTO `municipio` (`nombre`,`area`,`presupuesto`,`gobernador`)
VALUES
  ("Hessen","481.57",1331,2),
  ("Ancash","507.78",441,3),
  ("Minnesota","530.68",1296,4),
  ("Östergötlands län","416.92",856,5),
  ("Montana","509.28",243,6),
  ("Oslo","412.34",859,7),
  ("Indiana","555.33",1314,8),
  ("Leinster","474.67",1013,9),
  ("Imo","475.04",989,10),
  ("Troms og Finnmark","662.65",1284,11);

-- viviendas
INSERT INTO `vivienda` (`direccion`,`capacidad`,`niveles`,`ubicacion`)
VALUES
  ("Ap #816-8012 Luctus. Road",18,4,4),
  ("Ap #780-6555 Cras St.",9,3,2),
  ("P.O. Box 490, 8951 Sed Rd.",12,5,8),
  ("3903 Justo St.",14,4,11),
  ("535-5547 Eros St.",13,2,1),
  ("343-1124 Elementum, Ave",2,2,8),
  ("863-8445 Vestibulum St.",17,2,1),
  ("Ap #726-4461 Sit St.",20,2,8),
  ("Ap #828-8317 Tristique Av.",18,3,5),
  ("938-2143 Pede St.",14,3,2);
INSERT INTO `vivienda` (`direccion`,`capacidad`,`niveles`,`ubicacion`)
VALUES
  ("4146 Est St.",11,3,5),
  ("Ap #208-7128 Vivamus Street",6,4,10),
  ("690-9080 Malesuada Street",4,2,1),
  ("Ap #997-7096 Sed St.",10,2,9),
  ("165-440 Duis Road",4,4,11),
  ("Ap #288-2422 Integer Road",17,4,4),
  ("Ap #718-4151 Aenean Avenue",18,4,9),
  ("P.O. Box 617, 5435 Justo. St.",18,1,3),
  ("1691 Nulla Rd.",16,2,11),
  ("286 Elit St.",6,3,7);
INSERT INTO `vivienda` (`direccion`,`capacidad`,`niveles`,`ubicacion`)
VALUES
  ("Ap #972-9263 Tristique Av.",4,4,10),
  ("P.O. Box 958, 771 Vitae St.",15,3,5),
  ("Ap #804-2187 Blandit Ave",10,2,9),
  ("Ap #639-1169 Consequat Rd.",14,3,7),
  ("9164 Placerat, Ave",11,1,3),
  ("Ap #171-6603 Phasellus Rd.",13,5,2),
  ("163-396 Tempor Rd.",9,4,10),
  ("134-7749 Vel Av.",5,3,4),
  ("Ap #527-4867 Pellentesque Ave",9,4,3),
  ("672-2393 Urna. St.",4,2,3);
INSERT INTO `vivienda` (`direccion`,`capacidad`,`niveles`,`ubicacion`)
VALUES
  ("Ap #585-3424 Lacus. St.",10,5,4),
  ("887-355 Sapien Rd.",7,4,4),
  ("Ap #124-5277 Ornare Avenue",13,3,8),
  ("863-2416 Phasellus Road",18,3,3),
  ("1225 Eu Rd.",13,2,10),
  ("697-7336 Augue Road",6,2,4),
  ("P.O. Box 536, 8109 Sed Avenue",6,3,7),
  ("P.O. Box 123, 6765 Augue Rd.",15,5,5),
  ("918-5829 Nisi Rd.",19,2,3),
  ("246-3066 Curae Road",8,2,5);
INSERT INTO `vivienda` (`direccion`,`capacidad`,`niveles`,`ubicacion`)
VALUES
  ("Ap #118-3252 Ac Avenue",14,5,8),
  ("483-9462 Gravida St.",19,2,1),
  ("8268 Eros Avenue",12,2,9),
  ("3522 Arcu. Av.",6,4,5),
  ("784-3027 Pellentesque, Av.",14,3,6),
  ("Ap #153-7044 Nunc St.",8,3,2),
  ("Ap #564-632 Enim. St.",10,2,4),
  ("Ap #549-8239 Nibh. Av.",14,3,9),
  ("Ap #663-3810 Nostra, St.",12,1,5),
  ("8669 Convallis Rd.",7,3,7);
INSERT INTO `vivienda` (`direccion`,`capacidad`,`niveles`,`ubicacion`)
VALUES
  ("292-3180 Eget, Av.",10,4,2),
  ("Ap #459-3357 Magna. Ave",18,1,6),
  ("Ap #687-233 Blandit St.",15,3,11),
  ("953-7381 Ac Ave",3,2,3),
  ("Ap #516-267 Fringilla, St.",13,5,3),
  ("4170 Sagittis Av.",3,5,7),
  ("762-4463 Nascetur Rd.",11,4,10),
  ("Ap #457-3680 Luctus St.",18,3,9),
  ("Ap #104-7748 Enim, Ave",20,4,6),
  ("705-3328 Vivamus Avenue",3,3,2);
INSERT INTO `vivienda` (`direccion`,`capacidad`,`niveles`,`ubicacion`)
VALUES
  ("731-1850 Elementum, Av.",4,3,10),
  ("P.O. Box 959, 1778 Quam, St.",4,4,6),
  ("901-3325 Ut Ave",10,5,11),
  ("P.O. Box 713, 3324 Integer Ave",8,3,9),
  ("Ap #476-4655 Diam. Ave",10,5,6),
  ("Ap #306-2990 Erat St.",8,2,5),
  ("Ap #704-3796 Sollicitudin Street",13,5,11),
  ("501-1169 Risus. St.",9,3,7),
  ("P.O. Box 505, 5895 Dictum. Street",18,3,4),
  ("P.O. Box 543, 5945 Morbi Avenue",19,4,3);
INSERT INTO `vivienda` (`direccion`,`capacidad`,`niveles`,`ubicacion`)
VALUES
  ("713-9713 Malesuada Ave",8,5,4),
  ("788-7869 Id, St.",18,3,9),
  ("Ap #294-6263 Est Avenue",4,3,2),
  ("P.O. Box 291, 5400 Dui Rd.",20,2,7),
  ("P.O. Box 346, 6772 A Ave",7,4,9),
  ("Ap #248-2770 Ut, Ave",17,4,7),
  ("P.O. Box 539, 698 Lobortis, Street",4,3,6),
  ("P.O. Box 731, 6213 Lorem Street",8,1,8),
  ("Ap #310-1258 Congue, Road",9,3,4),
  ("Ap #168-5970 Pharetra. St.",19,3,5);
INSERT INTO `vivienda` (`direccion`,`capacidad`,`niveles`,`ubicacion`)
VALUES
  ("466-6409 Libero. Ave",14,1,8),
  ("6768 Donec Rd.",14,1,6),
  ("172-6964 Mauris Street",17,4,6),
  ("Ap #151-6119 At Street",13,5,1),
  ("P.O. Box 763, 9737 Ligula. Rd.",4,2,9),
  ("Ap #206-6055 Sodales Avenue",5,1,2),
  ("P.O. Box 667, 1233 Metus. Road",5,1,5),
  ("P.O. Box 205, 7785 Gravida Rd.",19,3,9),
  ("Ap #197-7512 Libero Rd.",15,1,10),
  ("Ap #418-2960 Varius Ave",3,4,6);
INSERT INTO `vivienda` (`direccion`,`capacidad`,`niveles`,`ubicacion`)
VALUES
  ("Ap #906-6769 Orci Road",17,4,1),
  ("Ap #281-2027 Nunc Rd.",9,2,6),
  ("9725 Lorem St.",17,2,10),
  ("P.O. Box 798, 7329 Sapien St.",13,2,3),
  ("Ap #717-3395 Arcu Rd.",4,3,7),
  ("817-6099 Etiam Street",3,5,6),
  ("Ap #695-7580 Est. Avenue",6,2,7),
  ("P.O. Box 754, 7662 Lectus. Road",15,2,5),
  ("8227 Turpis Rd.",9,3,6),
  ("1546 Massa. Av.",14,1,9);

-- personas (hombres)
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Keaton","Leonard",48,3661428078,1,53,11),
  ("Neville","Pruitt",20,692953509,1,59,9),
  ("Raymond","Buchanan",53,8539559662,1,96,6),
  ("Otto","Robertson",25,8450846141,1,30,11),
  ("Zahir","Blankenship",86,9055603250,1,87,5),
  ("Felix","Savage",31,5875032725,1,43,4),
  ("Duncan","Franks",3,5924861814,1,91,11),
  ("Preston","Colon",93,7977960017,1,8,8),
  ("Keane","Lambert",56,3443633517,1,62,6),
  ("Trevor","Henry",83,3970000808,1,26,4);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Clinton","Noel",14,253955279,1,35,5),
  ("Kirk","Alvarado",15,6321408208,1,37,8),
  ("Vance","Barnett",92,1879198986,1,71,10),
  ("Amery","Mcgowan",95,3741058587,1,17,4),
  ("Kenneth","Sanders",52,1880880929,1,15,3),
  ("Xanthus","Barnett",61,7457517245,1,48,3),
  ("Len","Nichols",89,9366452044,1,84,4),
  ("Giacomo","Paul",31,6067980575,1,7,8),
  ("Beau","Bass",60,2456018578,1,74,5),
  ("Justin","Francis",53,8358693706,1,76,8);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Shad","Weeks",54,2339650904,1,13,8),
  ("Edan","Brown",73,4027908160,1,22,2),
  ("Nathan","Fry",32,7800633137,1,99,7),
  ("Steel","Serrano",46,5146884117,1,51,10),
  ("Lamar","Barnes",68,4886266891,1,57,10),
  ("Oscar","Le",53,6971395495,1,33,5),
  ("Keane","Jackson",17,525640139,1,42,7),
  ("Mark","Lancaster",66,60886521,1,70,4),
  ("Sean","Graham",19,8482861475,1,95,10),
  ("Leonard","Brown",63,3535821188,1,56,9);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Griffith","Faulkner",60,7013446991,1,72,4),
  ("Branden","Leblanc",40,9924356465,1,16,6),
  ("Brenden","Hanson",88,3856861087,1,7,6),
  ("Howard","Albert",34,5534407592,1,63,11),
  ("Nehru","Mercer",43,3635698366,1,65,4),
  ("Carl","Hopper",57,9860586661,1,22,6),
  ("Jordan","Knowles",64,2347514229,1,62,11),
  ("Solomon","Maxwell",62,6425233936,1,20,8),
  ("Rajah","Gamble",5,5425968161,1,19,11),
  ("Wesley","Mcknight",53,5054666710,1,57,4);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Mason","Oneil",14,160213653,1,98,7),
  ("Cade","Beach",46,8278419374,1,100,4),
  ("Nolan","Martinez",74,3155138357,1,44,7),
  ("Merritt","Reid",66,5591229460,1,91,11),
  ("Chase","Fletcher",57,983849702,1,7,6),
  ("Brock","Caldwell",63,2103896754,1,45,3),
  ("Hayes","Lucas",19,9273405061,1,21,5),
  ("Philip","Hartman",52,6093201825,1,11,2),
  ("Orson","Ferrell",18,9598816759,1,65,4),
  ("Chaney","Battle",78,4749487076,1,96,6);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Simon","Fisher",22,5834238730,1,81,11),
  ("Lee","Wong",27,7604509136,1,73,3),
  ("Thaddeus","Duke",68,9029829335,1,9,9),
  ("Chandler","Ellison",35,8871850658,1,63,11),
  ("Rahim","Houston",62,1813988347,1,76,8),
  ("Howard","Maddox",86,5423003357,1,47,12),
  ("Calvin","Tyler",13,9242470089,1,83,4),
  ("Caldwell","Jacobson",46,2350464740,1,14,11),
  ("Arsenio","Robinson",40,7534438639,1,71,5),
  ("Conan","Beck",64,9710686777,1,14,11);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Cole","White",49,3697984386,1,46,7),
  ("Alvin","Wise",94,5609713472,1,52,7),
  ("Keane","Walker",74,548628255,1,29,2),
  ("Adam","Holder",68,9310717597,1,64,5),
  ("Chancellor","Humphrey",38,578378751,1,30,3),
  ("Ethan","George",71,4273474112,1,72,11),
  ("Charles","Farley",81,3316052794,1,82,6),
  ("Caldwell","Bright",65,357023078,1,37,8),
  ("Dante","Mccormick",28,3715447372,1,32,11),
  ("Acton","Alston",25,7626562646,1,59,4);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Amal","Gilbert",58,1332436829,1,16,6),
  ("Ferdinand","Frye",62,5739487180,1,9,6),
  ("Nehru","Potter",51,4492023711,1,16,4),
  ("Nicholas","Floyd",74,8645741687,1,56,6),
  ("Elliott","Goff",9,3637291418,1,21,4),
  ("Phillip","Coffey",19,1271972631,1,31,11),
  ("Kennedy","Ray",70,5751260178,1,13,4),
  ("Raymond","Keller",88,5859551225,1,58,6),
  ("Kirk","Salinas",7,8203688908,1,100,10),
  ("Joel","Schultz",60,9747597582,1,95,7);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Eagan","Burgess",51,6258946142,1,90,10),
  ("Ali","Hess",61,1029358271,1,59,3),
  ("Wylie","Suarez",29,6428329318,1,2,7),
  ("Lee","Hughes",97,3893528861,1,10,3),
  ("Griffin","Barker",24,7757481649,1,84,4),
  ("Stone","Thompson",44,7475864289,1,53,2),
  ("Paul","Bolton",53,3691154917,1,81,6),
  ("Harding","Parks",48,645232043,1,16,3),
  ("Arden","Downs",93,2800794320,1,19,7),
  ("Richard","Vang",46,1324002898,1,30,6);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Duncan","Mullins",98,6697297293,1,44,10),
  ("Basil","Stark",82,5609999114,1,26,8),
  ("Vernon","Burris",30,9067615960,1,98,11),
  ("Lars","Chapman",85,9039786061,1,71,3),
  ("Harding","Hurst",14,7432566664,1,17,9),
  ("Duncan","English",57,235186148,1,9,10),
  ("Lucas","Pickett",41,6314313008,1,47,7),
  ("Aladdin","Chavez",24,4384756410,1,21,3),
  ("Marshall","Long",15,1541022947,1,66,8),
  ("Talon","Mccarty",79,4198247398,1,30,6);

-- personas (mujeres)
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Kyla","Diaz",15,8896374532,2,5,6),
  ("Cheyenne","Barry",91,2518196728,2,11,10),
  ("Cherokee","Dawson",28,5245576561,2,34,4),
  ("Yen","Mullins",42,6449391354,2,12,4),
  ("Whoopi","Dunlap",42,1031946507,2,13,3),
  ("Amanda","Berg",31,1593999900,2,15,11),
  ("Adele","Briggs",35,9975495564,2,29,4),
  ("Ebony","Gould",28,2256279979,2,25,6),
  ("Fredericka","Terry",18,2377943356,2,11,11),
  ("Lacey","Dunlap",57,8973282459,2,32,3);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Yoko","Chase",87,1417881726,2,16,10),
  ("Kirestin","Conner",69,7915216773,2,30,4),
  ("Rhonda","Murray",10,8192902047,2,96,6),
  ("Phoebe","Gibbs",23,952713894,2,52,3),
  ("Stacey","Manning",97,3639952130,2,49,6),
  ("Miriam","Pearson",54,583645322,2,58,4),
  ("Kirby","Tyson",38,2286099009,2,65,4),
  ("Katell","Rush",98,2627547963,2,83,3),
  ("Leilani","Church",72,8414272023,2,53,9),
  ("Irma","Dudley",14,8862628341,2,63,9);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Lisandra","Clemons",43,5880788991,2,31,6),
  ("Savannah","Knapp",64,9312843949,2,55,6),
  ("Adrienne","Whitfield",97,1747214983,2,28,10),
  ("Amanda","Osborne",85,2510919232,2,70,11),
  ("Amber","Pacheco",53,2466624353,2,15,3),
  ("Desirae","Lawrence",1,2408482973,2,30,5),
  ("Remedios","Trevino",29,1870053112,2,100,7),
  ("Wyoming","Hull",29,2041750594,2,30,5),
  ("Iona","Townsend",32,997262419,2,89,9),
  ("Kay","Austin",67,1884682965,2,69,5);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Barbara","Jones",69,8494247244,2,48,11),
  ("Lysandra","Jacobs",8,9098651567,2,88,7),
  ("Germane","England",93,3824712062,2,36,10),
  ("Marah","Caldwell",8,124666559,2,49,11),
  ("Jescie","Quinn",44,9289917655,2,33,7),
  ("Fay","Kidd",29,9163629646,2,11,8),
  ("Sharon","Mcmahon",34,9475203880,2,96,2),
  ("Aspen","Booth",70,2540140381,2,31,11),
  ("Rachel","Schneider",52,2405872364,2,67,5),
  ("Yvette","Collier",30,4212048202,2,4,2);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Samantha","Luna",68,4864350324,2,96,9),
  ("Nina","Holloway",91,2341380336,2,76,11),
  ("Rae","Boyle",3,6092769361,2,44,4),
  ("Brenda","Allison",48,6777723559,2,92,2),
  ("Whoopi","Fitzgerald",31,4832045194,2,91,8),
  ("Serina","Fulton",58,9856681670,2,92,5),
  ("Madeson","Woodward",76,5398416853,2,68,4),
  ("Oprah","King",32,7734292870,2,80,2),
  ("Karleigh","Carr",24,8235103358,2,20,10),
  ("Miranda","Ruiz",65,6416761564,2,80,2);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Dorothy","Hawkins",22,7295918089,2,77,9),
  ("Nichole","Aguirre",62,447485083,2,12,10),
  ("Karina","Hudson",19,5531003614,2,89,11),
  ("Justina","Lamb",21,1450304733,2,86,7),
  ("Teegan","Reeves",53,5767931561,2,22,6),
  ("Gillian","Wyatt",25,3216014637,2,87,3),
  ("Montana","Gill",11,4096754744,2,93,10),
  ("Tatyana","Mccoy",7,8274600538,2,37,10),
  ("Chanda","Marquez",96,1963898487,2,65,4),
  ("Kevyn","Ray",37,9660727635,2,40,4);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Anne","Pacheco",64,7677338007,2,57,9),
  ("Unity","Cooley",42,727484569,2,27,5),
  ("Brielle","Dillard",51,1663409745,2,27,10),
  ("Priscilla","Simon",57,4153286367,2,78,9),
  ("Bethany","Le",11,656829320,2,89,5),
  ("Amena","Crosby",69,1867825508,2,101,7),
  ("Athena","Le",92,1844419011,2,41,11),
  ("Odessa","Morris",57,4542823847,2,19,9),
  ("Eugenia","Little",6,5912242799,2,3,9),
  ("Mariko","Savage",76,2418391425,2,60,4);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Althea","Mcconnell",39,5786834690,2,95,9),
  ("Paula","Joyce",83,3637671182,2,81,7),
  ("Shafira","Carver",98,8241021363,2,79,4),
  ("Kylan","Puckett",49,1063304300,2,73,3),
  ("Giselle","Hunter",60,8270428390,2,17,5),
  ("Jemima","Butler",80,8970218933,2,30,10),
  ("Emi","Hill",29,4742867861,2,15,7),
  ("Astra","Hughes",11,5905681975,2,64,9),
  ("Sonia","Good",72,391563602,2,86,7),
  ("Ora","Fowler",6,9686514849,2,40,3);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Zelenia","Tran",20,7632479280,2,80,3),
  ("Emi","Hoffman",87,1014038067,2,53,7),
  ("Kylan","Kramer",87,5323662619,2,50,7),
  ("Sybil","Franco",15,3254323749,2,81,9),
  ("Ivory","Mullins",12,4544443009,2,68,10),
  ("Amena","Sargent",39,7443857931,2,92,7),
  ("Leandra","Kidd",51,30437314,2,58,5),
  ("Hiroko","Le",43,6208944650,2,46,8),
  ("Clare","Bridges",34,5265817980,2,45,2),
  ("Ignacia","Morgan",76,4649358489,2,24,7);
INSERT INTO `persona` (`nombre`,`apellido`,`edad`,`telefono`,`sexo`,`vivienda`,`cabeza_hogar`)
VALUES
  ("Yuri","Dale",15,7832701220,2,53,7),
  ("Tana","Byrd",89,5792256807,2,100,4),
  ("Hadley","Kirk",60,8664818355,2,101,9),
  ("Aiko","Frank",24,281802099,2,88,4),
  ("Isadora","Hutchinson",89,9189134406,2,37,3),
  ("Flavia","Richards",85,4242556693,2,48,7),
  ("Vanna","Patel",50,5281868693,2,89,10),
  ("Melissa","Sloan",35,8310033097,2,24,3),
  ("Kathleen","Tyson",20,8635066466,2,59,12);

-- propietarios
INSERT INTO `propietarios` (`Persona_id`,`Vivienda_id`)
VALUES
  (132,2),
  (112,3),
  (92,4),
  (105,5),
  (123,6),
  (179,7),
  (161,8),
  (184,9),
  (183,10),
  (108,11);
INSERT INTO `propietarios` (`Persona_id`,`Vivienda_id`)
VALUES
  (194,12),
  (30,13),
  (18,14),
  (127,15),
  (19,16),
  (76,17),
  (159,18),
  (188,19),
  (131,20),
  (84,21);
INSERT INTO `propietarios` (`Persona_id`,`Vivienda_id`)
VALUES
  (201,22),
  (57,23),
  (165,24),
  (100,25),
  (113,26),
  (80,27),
  (73,28),
  (79,29),
  (34,30),
  (146,31);
INSERT INTO `propietarios` (`Persona_id`,`Vivienda_id`)
VALUES
  (158,32),
  (190,33),
  (148,34),
  (205,35),
  (21,36),
  (53,37),
  (91,38),
  (78,39),
  (205,40),
  (68,41);
INSERT INTO `propietarios` (`Persona_id`,`Vivienda_id`)
VALUES
  (58,42),
  (58,43),
  (128,44),
  (69,45),
  (187,46),
  (176,47),
  (135,48),
  (156,49),
  (96,50),
  (136,51);
INSERT INTO `propietarios` (`Persona_id`,`Vivienda_id`)
VALUES
  (76,52),
  (18,53),
  (94,54),
  (209,55),
  (55,56),
  (172,57),
  (33,58),
  (117,59),
  (179,60),
  (182,61);
INSERT INTO `propietarios` (`Persona_id`,`Vivienda_id`)
VALUES
  (149,62),
  (40,63),
  (75,64),
  (113,65),
  (131,66),
  (95,67),
  (75,68),
  (7,69),
  (130,70),
  (35,71);
INSERT INTO `propietarios` (`Persona_id`,`Vivienda_id`)
VALUES
  (205,72),
  (80,73),
  (192,74),
  (174,75),
  (209,76),
  (24,77),
  (30,78),
  (98,79),
  (129,80),
  (191,81);
INSERT INTO `propietarios` (`Persona_id`,`Vivienda_id`)
VALUES
  (104,82),
  (32,83),
  (185,84),
  (114,85),
  (64,86),
  (198,87),
  (158,88),
  (119,89),
  (174,90),
  (127,91);
INSERT INTO `propietarios` (`Persona_id`,`Vivienda_id`)
VALUES
  (210,92),
  (61,93),
  (10,94),
  (22,95),
  (137,96),
  (112,97),
  (164,98),
  (77,99),
  (147,100),
  (93,101);




