CREATE DATABASE `bd_bank`;

USE `bd_bank`;

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(200) NOT NULL,
  `edad` int NOT NULL,
  `genero` int NOT NULL,
  `identificacion` varchar(30) NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `estado` bit(1) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`cliente_id`)
);

DROP TABLE IF EXISTS `cuentas`;
CREATE TABLE `cuentas` (
  `cuenta_id` int NOT NULL AUTO_INCREMENT,
  `estado` bit(1) NOT NULL,
  `numero` varchar(30) NOT NULL,
  `saldo_inicial` double NOT NULL,
  `tipo` int NOT NULL,
  `cliente_id` int NOT NULL,
  PRIMARY KEY (`cuenta_id`),
  KEY `fk_cuenta_cliente` (`cliente_id`),
  CONSTRAINT `fk_cuenta_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`)
);

DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE `movimientos` (
  `movimiento_id` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime(6) NOT NULL,
  `movimiento` double NOT NULL,
  `saldo_disponible` double NOT NULL,
  `tipo` int NOT NULL,
  `cuenta_id` int NOT NULL,
  PRIMARY KEY (`movimiento_id`),
  KEY `fk_movimiento_cuenta` (`cuenta_id`),
  CONSTRAINT `fk_movimiento_cuenta` FOREIGN KEY (`cuenta_id`) REFERENCES `cuentas` (`cuenta_id`)
);
