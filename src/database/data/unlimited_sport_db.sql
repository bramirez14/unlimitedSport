CREATE DATABASE  IF NOT EXISTS `base_unlimited_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `base_unlimited_db`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: base_unlimited_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Nike','NIKE.jpg','2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(2,'Adidas','ADIDAS.png','2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(3,'Puma','PUMA.jpg','2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(4,'New Balance','NB.png','2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(5,'Converse','CONVERSE.jpg','2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(6,'Lotto','lotto.jpg','2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(7,'Reebok','REEBOK.png','2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(8,'Under Armour','UA.png','2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(9,'Penalty','penalty.jpg','2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(10,'Diadora','diadora.jpg','2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(11,'Fila','fila.png','2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(12,'Umbro','umbro.png','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_products`
--

DROP TABLE IF EXISTS `cliente_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `clienteId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `clienteId` (`clienteId`),
  CONSTRAINT `cliente_products_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  CONSTRAINT `cliente_products_ibfk_2` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_products`
--

LOCK TABLES `cliente_products` WRITE;
/*!40000 ALTER TABLE `cliente_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `fechaNacimiento` datetime DEFAULT NULL,
  `rememberToken` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles`
--

DROP TABLE IF EXISTS `detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `talla` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles`
--

LOCK TABLES `detalles` WRITE;
/*!40000 ALTER TABLE `detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modo` varchar(255) DEFAULT NULL,
  `fechaDePago` datetime DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  `descuento` int(11) DEFAULT NULL,
  `deporte` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `categoriaId` int(11) DEFAULT NULL,
  `detalleId` int(11) DEFAULT NULL,
  `pagoId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoriaId` (`categoriaId`),
  KEY `detalleId` (`detalleId`),
  KEY `pagoId` (`pagoId`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoriaId`) REFERENCES `categorias` (`id`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`detalleId`) REFERENCES `detalles` (`id`),
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`pagoId`) REFERENCES `pagos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Botines Lotto Pro 2',4999,10,'Fútbol','Buenas zapatillas Lotto!!','image-1594852029846.jpg',6,NULL,NULL,'2020-07-15 22:27:09','2020-07-15 22:27:09','0000-00-00 00:00:00'),(2,'Puma Enzo 2.25',3999,5,'running','Buenas zapatillas para correr !!','image-1594854022733.jpg',3,NULL,NULL,'2020-07-15 23:00:22','2020-07-15 23:00:22','0000-00-00 00:00:00'),(3,'Nike clasic 365',3599,3,'clasic','nuevas zapatillas clasicas de Nike! Modelos unicos','image-1594868878588.jpg',1,NULL,NULL,'2020-07-16 03:07:58','2020-07-16 03:07:58','0000-00-00 00:00:00'),(4,'Puma nitro 65 D',2699,0,'clasic','Una de las colecciones de Puma en modelo clasic','image-1594869044031.jpg',3,NULL,NULL,'2020-07-16 03:10:44','2020-07-16 03:10:44','0000-00-00 00:00:00'),(5,'Puma model 98-NG',2500,2,'clasic','Una de las colecciones de Puma en modelo clasic','image-1594869224315.jpg',3,NULL,NULL,'2020-07-16 03:13:44','2020-07-16 03:13:44','0000-00-00 00:00:00'),(6,'Adidas 2020 fx',3299,5,'clasic','La zapatilla fx de Adidas, es un modelo de coleccion y diseño','image-1594869500113.jpg',2,NULL,NULL,'2020-07-16 03:18:20','2020-07-16 03:18:20','0000-00-00 00:00:00'),(7,'Adidas jacke black-1',5899,2,'running','Muy buenas para hacer deporte!! ','image-1594869637457.jpg',2,NULL,NULL,'2020-07-16 03:20:37','2020-07-16 03:20:37','0000-00-00 00:00:00'),(8,'Model all-start',3699,5,'clasic','Modelos de coleccion de la marca Converse','image-1594869753389.jpg',5,NULL,NULL,'2020-07-16 03:22:33','2020-07-16 03:22:33','0000-00-00 00:00:00'),(9,'Umbro botin campo 25ZX',2499,2,'Fútbol','comodas para partidos de futbol muy calientes !','image-1594870013768.jpg',12,NULL,NULL,'2020-07-16 03:26:53','2020-07-16 03:26:53','0000-00-00 00:00:00'),(10,'Adidas bolso-black 21K',4899,3,'running','Excelente material y resistente..!! Diseño extraido de modelos antiguos !!','image-1594870601604.jpg',2,NULL,NULL,'2020-07-16 03:36:41','2020-07-16 03:36:41','0000-00-00 00:00:00'),(11,'FG 45 KL Runn',2399,2,'running','Excelentes para correr y material muy resistente para todo terreno..!','image-1594870740401.png',2,NULL,NULL,'2020-07-16 03:39:00','2020-07-16 03:39:00','0000-00-00 00:00:00'),(12,'comet Puma 21D',3399,0,'clasic','Calzado comodo para toda ocacion..! Muy buen material y Acto para cualquier momento','image-1594870946457.jpg',3,NULL,NULL,'2020-07-16 03:42:26','2020-07-16 03:42:26','0000-00-00 00:00:00'),(13,'Puma 45 FSC',5100,3,'clasic','Puma 45 FSC reconocida por los amantes de los paseos comodos y tranquilos ! ','image-1594871086525.jpg',3,NULL,NULL,'2020-07-16 03:44:46','2020-07-16 03:44:46','0000-00-00 00:00:00'),(14,'Adidas nemezis 25LF',4299,0,'Fútbol','Durables y agiles para cualquier partido de futbol !!','image-1594871184774.jpg',2,NULL,NULL,'2020-07-16 03:46:24','2020-07-16 03:46:24','0000-00-00 00:00:00'),(15,'Pelota 12 FG',2299,5,'Fútbol','Pelota de buen material !! Resistente en cualquier tipo de cancha!!','image-1594871331123.jpg',2,NULL,NULL,'2020-07-16 03:48:51','2020-07-16 03:48:51','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequelizemeta`
--

DROP TABLE IF EXISTS `sequelizemeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequelizemeta`
--

LOCK TABLES `sequelizemeta` WRITE;
/*!40000 ALTER TABLE `sequelizemeta` DISABLE KEYS */;
INSERT INTO `sequelizemeta` VALUES ('20200711002308-create-clientes.js'),('20200711002851-create-categorias.js'),('20200711003038-create-detalles.js'),('20200711003257-create-pagos.js'),('20200711012820-create-products.js'),('20200711013205-create-cliente-product.js');
/*!40000 ALTER TABLE `sequelizemeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-16 21:10:25
