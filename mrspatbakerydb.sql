-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: mrspatbakerydb
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredientId` int NOT NULL AUTO_INCREMENT,
  `ingredient` varchar(50) NOT NULL,
  `nutrient` varchar(500) NOT NULL,
  PRIMARY KEY (`ingredientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientitem`
--

DROP TABLE IF EXISTS `ingredientitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientitem` (
  `ingredientItemId` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL DEFAULT '0',
  `ingredientId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ingredientItemId`),
  KEY `FK1 ingredient and ingredientLineItem` (`ingredientId`),
  CONSTRAINT `FK1 ingredient and ingredientLineItem` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient` (`ingredientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientitem`
--

LOCK TABLES `ingredientitem` WRITE;
/*!40000 ALTER TABLE `ingredientitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientstock`
--

DROP TABLE IF EXISTS `ingredientstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientstock` (
  `ingredientStockId` int NOT NULL,
  `qty` int DEFAULT NULL,
  `ingredientId` int DEFAULT NULL,
  PRIMARY KEY (`ingredientStockId`),
  KEY `FK1 ingredientItem and IngredientStock` (`ingredientId`),
  CONSTRAINT `FK1 ingredientItem and IngredientStock` FOREIGN KEY (`ingredientId`) REFERENCES `ingredientitem` (`ingredientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientstock`
--

LOCK TABLES `ingredientstock` WRITE;
/*!40000 ALTER TABLE `ingredientstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredientstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `productId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL DEFAULT '',
  `picture` varchar(900) NOT NULL DEFAULT '',
  `price` double DEFAULT '0',
  `Category` varchar(50) NOT NULL,
  `warning` varchar(900) NOT NULL DEFAULT '0',
  `description` varchar(900) NOT NULL,
  `recipeId` int NOT NULL DEFAULT '0',
  `isActive` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`productId`),
  KEY `FK_Product_And_recipe` (`recipeId`),
  CONSTRAINT `FK1 productAndRecipe` FOREIGN KEY (`recipeId`) REFERENCES `recipe` (`recipeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='STORING PRODUCTS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Cake','https://images.app.goo.gl/iDohSwKBUXTP6t3k8',150,'cakes','contains nuts','Awesome yummie chocolate cake',83,'N');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productlineitem`
--

DROP TABLE IF EXISTS `productlineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productlineitem` (
  `lineItemId` int NOT NULL AUTO_INCREMENT,
  `qty` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  PRIMARY KEY (`lineItemId`),
  KEY `FK1 product and lineItem` (`productId`),
  CONSTRAINT `FK1 product and lineItem` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productlineitem`
--

LOCK TABLES `productlineitem` WRITE;
/*!40000 ALTER TABLE `productlineitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `productlineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productstock`
--

DROP TABLE IF EXISTS `productstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productstock` (
  `stockId` int NOT NULL AUTO_INCREMENT,
  `qty` int DEFAULT '0',
  `productId` int DEFAULT '0',
  PRIMARY KEY (`stockId`),
  KEY `FK1stock and product lineitem` (`productId`),
  CONSTRAINT `FK1stock and product lineitem` FOREIGN KEY (`productId`) REFERENCES `productlineitem` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstock`
--

LOCK TABLES `productstock` WRITE;
/*!40000 ALTER TABLE `productstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `productstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `recipeId` int NOT NULL,
  `recipeName` varchar(50) NOT NULL DEFAULT '',
  `ingredients` varchar(900) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `Steps` varchar(900) NOT NULL DEFAULT '',
  `isActive` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`recipeId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='storing product recipe';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (83,'','','Blah Blah Blah','Y');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `firstName` varchar(100) NOT NULL DEFAULT '',
  `lastName` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `contactNumber` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `isClient` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Y',
  `isActive` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Y',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Storing all the users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Mr','Sylverster','TheMan','ksylverster@gmail.com','0712345678','kanyane','N','Y'),(4,'mr','kanyane','kanyane','kkk@gmail.com','07123456789','kkk','N','Y'),(5,'Ms','Mary','Hairy','maryh@gmail.com','07123456780','eieio','Y','Y'),(6,'Ms','Mary','Scary','marys@gmail.com','07123459876','lamb','Y','Y'),(7,'Ms','Mary','Scary','maryscary@gmail.com','07123459876','lamb','Y','Y'),(8,'mr','Manqoba','Manqoba','kkkkkk@gmail.com','07123456789','123456','N','N');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-20 15:30:35
