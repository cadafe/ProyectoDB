
INSERT INTO `fecha` (`fecha`) VALUES
	('2019-02-18'),
	('2019-03-12'),
	('2019-01-22'),
	('2019-04-11'),
	('2019-02-14'),
	('2019-01-19'),
	('2009-09-09');
	
INSERT INTO `tipo` (`cod_tipo`,`descripcion`,`costo`) VALUES
	(1, 'estandar', 400),
	(2, 'superior', 800),
	(3, 'suite', 3000);

INSERT INTO `habitacion` (`nro_habitacion`,`cant_camas`,`cod_tipo`) VALUES
	(1,1,1),
	(2,1,2),
	(3,1,3),
	(4,2,1),
	(5,2,2),
	(6,2,3),
	(7,3,1),
	(8,3,2),
	(9,3,3);

INSERT INTO `persona` (`dni`,`nombre`,`apellido`,`fecha_nacimiento`,`edad`) VALUES 
	(40297574, 'Juan', 'Lopez', '1994-11-11',24),
	(39888000, 'Pedro', 'Gomez', '1974-03-22',45),
	(35603438, 'Laura', 'Fernandez', '1987-03-15',32),
	(30697345, 'Sofia', 'Martinez', '1992-07-02',27),
	(32567987, 'Esteban', 'Cuesta', '1963-01-30',56),
	(30887621, 'Matias', 'Formento', '1989-12-05',30),
	(31562856, 'Lucia', 'Moreno', '1952-03-03',67),
	(29987432, 'Camila', 'Sosa', '1960-02-18',59),
	(33498123, 'Mariana', 'Aguilar', '1985-04-10',34),
	(27098348, 'Paulina', 'Perez', '1954-05-22',62),
	(25375932, 'Facundo', 'Brusatti', '1976-08-06',43),
	(20763929, 'Mariano', 'Lerda', '1970-09-11',49),
	(21345987, 'Kevin', 'Salazar', '1964-10-13',55),
	(25476234, 'Susana', 'Messi', '1975-04-28',44),
	(22752405, 'Alvaro', 'Vidal', '1995-11-25',23);

INSERT INTO `cliente` (`numero_cliente`,`dni`,`fecha_ingreso`,`estado_civil`,`fecha`) VALUES
	(1,40297574,'2019-01-24','soltero','2019-02-18'),
	(2,35603438,'2019-02-13','soltero','2019-03-12'),
	(3,22752405,'2018-08-05','casado','2019-01-22'),
	(4,21345987,'2016-11-08','divorciado','2019-04-11'),
	(5,31562856,'2018-09-28','casado','2019-02-14'),
	(6,27098348,'2019-03-18','divorciado','2019-01-19');

INSERT INTO `empleado` (`dni`,`antiguedad`,`sueldo`) VALUES
	(25476234,3,15658.10),
	(33498123,4,16256.30),
	(30697345,5,18020.75),
	(39888000,10,45000.50);

INSERT INTO `mucama` (`dni`,`antiguedad_mucama`,`sueldo_mucama`) VALUES
	(25476234,3,15658.10),
	(33498123,4,16256.30),
	(30697345,5,18020.75);

INSERT INTO `gerente` (`dni`,`antiguedad_gerente`,`sueldo_gerente`,`comision`) VALUES
	(39888000,10,45000.50,2000.60);

INSERT INTO `atiende` (`nro_habitacion`,`dni`) VALUES
	(1,25476234),
	(8,25476234),
	(4,25476234),
	(2,33498123),
	(3,33498123),
	(5,30697345),
	(7,30697345),
	(6,30697345);

INSERT INTO `ocupadaEn` (`nro_habitacion`,`fecha`) VALUES
	(1,'2019-03-12'),
	(2,'2019-01-22'),
	(3,'2019-04-11'),
	(4,'2019-02-14'),
	(5,'2019-01-19');
