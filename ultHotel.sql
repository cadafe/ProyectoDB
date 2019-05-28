CREATE DATABASE /*!32312 IF NOT EXISTS*/ TPHotel;
USE TPHotel;

DROP TABLE IF EXISTS `fecha`;
CREATE TABLE fecha (
	`fecha` date NOT NULL, 
	PRIMARY KEY (`fecha`),
	CONSTRAINT `restric_fecha` CHECK (`fecha` > `2010-01-01`)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE tipo (
	`cod_tipo` int(4) NOT NULL,
	`descripcion` varchar(100),
	`costo` float(10),
	PRIMARY KEY (`cod_tipo`)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `habitacion`;
CREATE TABLE habitacion (
	`nro_habitacion` int(3) NOT NULL,
	`cant_camas` int(2),
	`cod_tipo` int(4) NOT NULL,
	PRIMARY KEY (`nro_habitacion`),
	CONSTRAINT `fk_cod_tipo` FOREIGN KEY (`cod_tipo`) REFERENCES `tipo` (`cod_tipo`)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `persona`;
CREATE TABLE persona (
	`dni` int(8) NOT NULL,
	`nombre` varchar(32),
	`apellido` varchar(32),
	`fecha_nacimiento` date,
	`edad` int(3),
	PRIMARY KEY (`dni`)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE cliente (
	`numero_cliente` int(4) NOT NULL auto_increment,
	`dni` int(8),
	`fecha_ingreso` date,
	`estado_civil` varchar(15), 
	`fecha` date NOT NULL,
	PRIMARY KEY (`numero_cliente`, `dni`),
	CONSTRAINT `restri_estado_civil` CHECK (`estado_civil`='soltero' || `estado_civil`='casado' || `estado_civil`='divorciado'),
    CONSTRAINT `fk_dni_cliente` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`),
	CONSTRAINT `fk_fecha_ocupada` FOREIGN KEY (`fecha`) REFERENCES `fecha` (`fecha`)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `empleado`;
CREATE TABLE empleado (
	`antiguedad` int(2),
	`sueldo` float(10),
	`dni` int(8) NOT NULL,
	PRIMARY KEY (`dni`),
	CONSTRAINT `fk_dni_empleado` FOREIGN KEY (`dni`) REFERENCES `persona` (`dni`)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `mucama`;
CREATE TABLE mucama (
	`dni` int(8) NOT NULL,
	`antiguedad_mucama` int(2),
	`sueldo_mucama` float(10),
	PRIMARY KEY (`dni`),
	CONSTRAINT `fk_dni_mucama2` FOREIGN KEY (`dni`) REFERENCES `empleado` (`dni`)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `gerente`;
CREATE TABLE gerente (
	`dni` int(8) NOT NULL,
	`antiguedad_gerente` int(2),
	`sueldo_gerente` float(10),
	`comision` float(10),
    PRIMARY KEY (`dni`),
	CONSTRAINT `fk_dni_gerente` FOREIGN KEY (`dni`) REFERENCES `empleado` (`dni`)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `atiende`;
CREATE TABLE atiende (
	`nro_habitacion` int(3) NOT NULL,
	`dni` int(8) NOT NULL,
	CONSTRAINT `unique_atiende` UNIQUE (`nro_habitacion`, `dni`),
	CONSTRAINT `fk_habitacion1` FOREIGN KEY (`nro_habitacion`) REFERENCES `habitacion` (`nro_habitacion`),
	CONSTRAINT `fk_dni_mucama1` FOREIGN KEY (`dni`) REFERENCES `mucama` (`dni`)
)	ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `ocupadaEn`;
CREATE TABLE ocupadaEn (		
	`nro_habitacion` int(3) NOT NULL,
	`fecha` date NOT NULL,
    CONSTRAINT `unique_ocpadaEn` UNIQUE (`nro_habitacion`, `fecha`),
	CONSTRAINT `fk_habitacion2` FOREIGN KEY (`nro_habitacion`) REFERENCES `habitacion` (`nro_habitacion`),
	CONSTRAINT `fk_fecha` FOREIGN KEY (`fecha`) REFERENCES `fecha` (`fecha`)
)	ENGINE=InnoDB default CHARSET=latin1;

DROP TABLE IF EXISTS `cambio_costo`;
CREATE TABLE cambio_costo (
	`cod_tipo` int(4) NOT NULL,
	`costo_n` float(10),
	`costo_v` float(10),
	`usuario` varchar(30),
	`fecha` date,
	PRIMARY KEY (`cod_tipo`)
)

delimiter $$
CREATE TRIGGER trigger_insert_fecha 
	BEFORE INSERT ON fecha
	FOR EACH ROW 
	IF 
		NEW.fecha < '2010-01-01' THEN SET NEW.fecha = '2010-01-01';
	END IF$$ 
delimiter ;

delimiter $$
CREATE TRIGGER trigger_cambio_costo 
	AFTER UPDATE ON tipo
	FOR EACH ROW 
	BEGIN 
		INSERT INTO cambio_costo(cod_tipo,costo_n,costo_v,usuario,fecha) VALUES (NEW.cod_tipo, NEW.costo,OLD.costo, CURRENT_USER(),NOW());
	END$$ 
delimiter ;



