CREATE DATABASE  IF NOT EXISTS `pizza_orders` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pizza_orders`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: pizza_orders
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `idcustomers` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcustomers`),
  UNIQUE KEY `phone number_UNIQUE` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Trevor','Page','266-555-4982'),(2,'John','Doe','555-555-9498');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_pizzas`
--

DROP TABLE IF EXISTS `ordered_pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_pizzas` (
  `idorders` int NOT NULL,
  `idpizza` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`idorders`,`idpizza`),
  KEY `idpizza_idx` (`idpizza`),
  CONSTRAINT `idorders` FOREIGN KEY (`idorders`) REFERENCES `orders` (`idorders`),
  CONSTRAINT `idpizza` FOREIGN KEY (`idpizza`) REFERENCES `pizza_types` (`idpizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_pizzas`
--

LOCK TABLES `ordered_pizzas` WRITE;
/*!40000 ALTER TABLE `ordered_pizzas` DISABLE KEYS */;
INSERT INTO `ordered_pizzas` VALUES (1,1,1),(1,3,1),(2,2,1),(2,3,2),(3,3,1),(3,4,1),(4,2,3),(4,4,1);
/*!40000 ALTER TABLE `ordered_pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idorders` int NOT NULL AUTO_INCREMENT,
  `idcustomers` int DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`idorders`),
  KEY `idcustomers_idx` (`idcustomers`),
  CONSTRAINT `idcustomers` FOREIGN KEY (`idcustomers`) REFERENCES `customers` (`idcustomers`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2023-09-10 09:47:00'),(2,2,'2023-09-10 13:20:00'),(3,1,'2023-09-10 09:47:00'),(4,2,'2023-10-10 10:37:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza_types`
--

DROP TABLE IF EXISTS `pizza_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_types` (
  `idpizza` int NOT NULL AUTO_INCREMENT,
  `pizza_type` varchar(45) NOT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idpizza`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza_types`
--

LOCK TABLES `pizza_types` WRITE;
/*!40000 ALTER TABLE `pizza_types` DISABLE KEYS */;
INSERT INTO `pizza_types` VALUES (1,'Pepperoni & cheese',7.99),(2,'Vegetarian',9.99),(3,'Meat Lovers',14.99),(4,'Hawaiian',12.99);
/*!40000 ALTER TABLE `pizza_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-03  7:34:50
