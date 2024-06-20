CREATE DATABASE  IF NOT EXISTS `sysfacturas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sysfacturas`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: sysfacturas
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idclientes` int NOT NULL AUTO_INCREMENT,
  `usuariocliente` varchar(45) NOT NULL,
  `nombrecliente` varchar(45) NOT NULL,
  `correocliente` varchar(45) NOT NULL,
  `telefonocliente` varchar(8) NOT NULL,
  `idproveedor` int NOT NULL,
  PRIMARY KEY (`idclientes`),
  KEY `fk_cliente_proveedor` (`idproveedor`),
  CONSTRAINT `fk_cliente_proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'byr65','Bayron Vega','bayronV@yahoo.com','67812359',1),(2,'rod12','Rodney Morera Scott','rodneyM@hotmail.com','61755980',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturados`
--

DROP TABLE IF EXISTS `facturados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturados` (
  `idfacturados` int NOT NULL AUTO_INCREMENT,
  `idfactura` int NOT NULL,
  `idproducto` int NOT NULL,
  `cantidad` int NOT NULL,
  `preciounitario` double NOT NULL,
  `totalproducto` double NOT NULL,
  PRIMARY KEY (`idfacturados`),
  KEY `fk_facturados_factura` (`idfactura`),
  CONSTRAINT `fk_facturados_factura` FOREIGN KEY (`idfactura`) REFERENCES `facturas` (`idfactura`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturados`
--

LOCK TABLES `facturados` WRITE;
/*!40000 ALTER TABLE `facturados` DISABLE KEYS */;
INSERT INTO `facturados` VALUES (16,11,5,3,850,2550);
/*!40000 ALTER TABLE `facturados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `idfactura` int NOT NULL AUTO_INCREMENT,
  `idproveedor` int NOT NULL,
  `idcliente` int NOT NULL,
  `fechaemision` date NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `fk_factura_proveedor` (`idproveedor`),
  KEY `fk_factura_cliente` (`idcliente`),
  CONSTRAINT `fk_factura_cliente` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idclientes`),
  CONSTRAINT `fk_factura_proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (11,1,1,'2024-05-27',2550);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idprimario` int NOT NULL AUTO_INCREMENT,
  `idproductos` int NOT NULL,
  `cantidad` int NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `precio` double NOT NULL,
  `idproveedor` int NOT NULL,
  PRIMARY KEY (`idprimario`),
  KEY `fk_producto_proveedor` (`idproveedor`),
  CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedores`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (3,3,200,'Empanada',600,52),(4,4,150,'Baguette',700,1),(5,5,200,'Natillero',850,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idproveedores` int NOT NULL AUTO_INCREMENT,
  `usuarioproveedor` varchar(45) NOT NULL,
  `nombreproveedor` varchar(45) NOT NULL,
  `nombreempresa` varchar(45) NOT NULL,
  `correoprovedor` varchar(45) NOT NULL,
  `telefonoproveedor` varchar(45) NOT NULL,
  `estadoproveedor` varchar(15) NOT NULL,
  PRIMARY KEY (`idproveedores`),
  UNIQUE KEY `usuarioproveedor_UNIQUE` (`usuarioproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'gab61','Gabriel','Mil sabores','gabriel@hotmail.com','61755980','Habilitado'),(52,'NPC123','Andres','Chicharrones','npc@gmail.com','11111111','Habilitado'),(53,'marco','marco','Chicharrones','d@rodney.com','11111111','Deshabilitado');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `rol` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','ADM','admin'),(2,'gab61','PRO','paso99'),(12,'NPC123','PRO','123');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-27 20:07:35
