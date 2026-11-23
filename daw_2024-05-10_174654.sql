-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: daw
-- ------------------------------------------------------
-- Server version	11.3.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `codigo_pedido` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `unidades` int(11) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`codigo_pedido`,`codigo_producto`),
  KEY `contiene` (`codigo_producto`),
  CONSTRAINT `contiene` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo`),
  CONSTRAINT `referentea` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedidos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
INSERT INTO `detalle` VALUES (45,1,1,300.00),(45,4,1,7400.00),(45,6,1,1000.00),(46,2,1,300.00),(46,3,1,900.00),(47,5,1,600.00),(47,6,1,1000.00),(47,7,2,1000.00),(48,14,1,10000.00),(48,15,1,90.00),(49,6,1,1000.00),(49,8,1,1000.00);
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Pendiente'),(2,'Enviado'),(3,'Cancelado'),(4,'Entregado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `persona` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `importe` decimal(8,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `descripción` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `pedidopor` (`persona`),
  KEY `enestado` (`estado`),
  CONSTRAINT `enestado` FOREIGN KEY (`estado`) REFERENCES `estados` (`codigo`),
  CONSTRAINT `pedidopor` FOREIGN KEY (`persona`) REFERENCES `usuarios` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (45,1,'2024-05-10',8700.00,3,NULL),(46,1,'2024-05-10',1200.00,1,NULL),(47,2,'2024-05-10',3600.00,1,NULL),(48,3,'2024-05-10',10090.00,1,NULL),(49,1,'2024-05-10',2000.00,1,NULL);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',300.00,7,'./img/imagen1.jpg','Producto 1'),(2,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',300.00,20,'./img/imagen2.jpg','Producto 2'),(3,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',900.00,9,'./img/imagen3.jpg','Producto 3'),(4,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',7400.00,8,'./img/imagen8.jpg','Producto 4'),(5,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',600.00,10,'./img/imagen5.jpg','Producto 5'),(6,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',1000.00,1,'./img/imagen6.jpg','Producto 6'),(7,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',1000.00,2,'./img/imagen7.jpg','Producto 7'),(8,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',1000.00,5,'./img/imagen4.jpg','Producto 8'),(9,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',900.00,6,'./img/imagen9.jpg','Producto 9'),(10,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',70.00,8,'./img/imagen10.jpg','Producto 10'),(11,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',50.00,3,'./img/imagen11.jpg','Producto 11'),(12,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',20.00,2,'./img/imagen12.jpg','Producto 12'),(13,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',30.00,1,'./img/imagen13.jpg','Producto 13'),(14,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',10000.00,5,'./img/imagen14.jpg','Producto 14'),(15,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',90.00,8,'./img/imagen15.jpg','Producto 15'),(16,'Anillo elegante y moderno, perfecto para cualquier ocasión. Fabricado con oro de 18 quilates y un deslumbrante diamante central, este anillo añade un toque de lujo y sofisticación a tu estilo.',50.00,2,'./img/imagen16.jpg','Producto 16');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `usuario` varchar(32) DEFAULT NULL,
  `clave` varchar(32) DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellidos` varchar(128) DEFAULT NULL,
  `domicilio` varchar(128) DEFAULT NULL,
  `poblacion` varchar(64) DEFAULT NULL,
  `provincia` varchar(32) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,0,0,'m','1','m','val','cll','vlct','vlc','2345','634534558'),(2,0,0,'valse','12','maciel','vale','calle','vlc','vlc','46034','634534568'),(3,0,0,'maciel','123','maciel','segovia','calle','bc','bc','46030','634534509'),(4,NULL,NULL,'mac','1234','maciel',NULL,'wkeh','34tudsf','sagf3','34','78965479');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

--
-- Dumping routines for database 'daw'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-10 17:47:03
