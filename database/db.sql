CREATE DATABASE  IF NOT EXISTS `schedule_assistant` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `schedule_assistant`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: schedule_assistant
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
-- Table structure for table `course_lines`
--

DROP TABLE IF EXISTS `course_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_lines` (
  `Course_idCourse` int NOT NULL,
  `Line_idLine` int NOT NULL,
  PRIMARY KEY (`Course_idCourse`,`Line_idLine`),
  KEY `FK_CL_LINE_IDLINE_idx` (`Line_idLine`),
  CONSTRAINT `FK_CL_COURSE_IDCOURSE` FOREIGN KEY (`Course_idCourse`) REFERENCES `courses` (`idcourse`),
  CONSTRAINT `FK_CL_LINE_IDLINE` FOREIGN KEY (`Line_idLine`) REFERENCES `lines` (`idline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_lines`
--

LOCK TABLES `course_lines` WRITE;
/*!40000 ALTER TABLE `course_lines` DISABLE KEYS */;
INSERT INTO `course_lines` VALUES (32,1),(43,1),(51,1),(31,2),(40,2),(53,2),(33,3),(41,3),(50,3);
/*!40000 ALTER TABLE `course_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `idcourse` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `key` varchar(45) DEFAULT NULL,
  `credits` double DEFAULT NULL,
  `hours_per_week` double DEFAULT NULL,
  `hours_practice_per_week` double DEFAULT NULL,
  `period` int DEFAULT NULL,
  PRIMARY KEY (`idcourse`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'MATEMÁTICAS DISCRETAS','OBLIGATORIA','N101',7,3,1,1),(2,'FUNDAMENTOS DE FÍSICA','OBLIGATORIA','N102',8,4,0,1),(3,'FÍSICA GENERAL EXPERIMENTAL','OBLIGATORIA','N103',2,0,2,1),(4,'COMUNICACIÓN PROFESIONAL INTERDISCIPLINARIA','OBLIGATORIA','N104',5,2,1,1),(5,'FUNDAMENTOS DE ADMINISTRACIÓN','OBLIGATORIA','N105',7,3,1,1),(6,'RESPONSABILIDAD SOCIAL Y ÉTICA','OBLIGATORIA','N106',5,2,1,1),(7,'LÓGICA DE PROGRAMACIÓN','OBLIGATORIA','N107',6,2,2,1),(8,'CÁLCULO DIFERENCIAL E INTEGRAL','OBLIGATORIA','N201',7,3,1,2),(9,'PSICOLOGÍA EN EL TRABAJO','OBLIGATORIA','N202',5,2,1,2),(10,'METODOLOGÍA DE LA INVESTIGACIÓN','OBLIGATORIA','N203',5,2,1,2),(11,'SISTEMAS DIGITALES','OBLIGATORIA','N204',5,2,1,2),(12,'APLICACIÓN DE SISTEMAS DIGITALES','OBLIGATORIA','N205',4,1,2,2),(13,'FUNDAMENTOS DE INGENIERÍA DE SOFTWARE','OBLIGATORIA','N206',5,2,1,2),(14,'ESTRUCTURA DE DATOS','OBLIGATORIA','N207',6,2,2,2),(15,'PROGRAMACIÓN DE BAJO NIVEL','OBLIGATORIA','N208',6,2,2,2),(16,'PROBABILIDAD','OBLIGATORIA','N301',7,3,1,3),(17,'ALGORITMOS COMPUTACIONALES','OBLIGATORIA','N302',6,2,2,3),(18,'INGENIERÍA DE REQUERIMIENTOS','OBLIGATORIA','N303',6,2,2,3),(19,'DISEÑO DE INTERFACES DE USUARIO','OBLIGATORIA','N304',5,2,1,3),(20,'ARQUITECTURA Y ORGANIZACIÓN DE LAS COMPUTADORAS','OBLIGATORIA','N305',7,3,1,3),(21,'CONSTRUCCIÓN DE BASES DE DATOS','OBLIGATORIA','N306',6,2,2,3),(22,'PROGRAMACIÓN ORIENTADA A OBJETOS','OBLIGATORIA','N307',6,2,2,3),(23,'ESTADÍSTICA','OBLIGATORIA','N401',7,3,1,4),(24,'DISPOSITIVOS PROGRAMABLES','OBLIGATORIA','N402',5,1,3,4),(25,'INGENIERÍA DE DISEÑO','OBLIGATORIA','N403',6,2,2,4),(26,'ADMINISTRACIÓN DE BASES DE DATOS','OBLIGATORIA','N404',6,2,2,4),(27,'SEGURIDAD INFORMÁTICA','OBLIGATORIA','N405',6,2,2,4),(28,'SISTEMAS OPERATIVOS','OBLIGATORIA','N406',7,3,1,4),(29,'ADQUISICIÓN DE DATOS','OBLIGATORIA','N407',6,2,2,4),(30,'ÁLGEBRA LINEAL','OBLIGATORIA','N501',7,3,1,5),(31,'ESCENARIOS VIRTUALES (COMPUTACIÓN)','OPTATIVA','A501',5,2,1,5),(32,'HACKEO ÉTICO (INFORMÁTICA)','OPTATIVA','S501',5,2,1,5),(33,'SISTEMAS EMBEBIDOS (LABORATORIO DE ELECTRICIDAD Y CONTROL)','OPTATIVA','T501',5,2,1,5),(34,'MÉTODOS NUMÉRICOS','OBLIGATORIA','N502',7,3,1,5),(35,'CONTABILIDAD FINANCIERA Y DE COSTOS','OBLIGATORIA','N503',7,3,1,5),(36,'APLICACIÓN DE LA CIENCIA ECONÓMICA','OBLIGATORIA','N504',7,3,1,5),(37,'TEORÍA DE LA COMPUTACIÓN Y COMPILADORES','OBLIGATORIA','N505',7,3,1,5),(38,'COMUNICACIÓN DE DATOS','OBLIGATORIA','N506',7,3,1,5),(39,'PROGRAMACIÓN WEB','OBLIGATORIA','N507',6,2,2,5),(40,'AMBIENTES VIRTUALES INMERSIVOS (COMPUTACIÓN)','OPTATIVA','A601',5,2,1,6),(41,'INFORMÁTICA EN AMBIENTES PRODUCTIVOS (PRODUCCIÓN)','OPTATIVA','T601',5,2,1,6),(42,'MODELOS DETERMINÍSTICOS DE INVESTIGACIÓN DE OPERACIONES','OBLIGATORIA','N601',7,3,1,6),(43,'VIROLOGÍA Y CRIPTOGRAFÍA (COMPUTACIÓN)','OPTATIVA','S601',5,2,1,6),(44,'INGENIERÍA ECONÓMICA','OBLIGATORIA','N602',5,2,1,6),(45,'PRESUPUESTO Y FINANZAS','OBLIGATORIA','N603',7,3,1,6),(46,'REDES Y CONECTIVIDAD','OBLIGATORIA','N604',7,3,1,6),(47,'FUNDAMENTOS DE INTELIGENCIA ARTIFICIAL','OBLIGATORIA','N605',7,3,1,6),(48,'INGENIERÍA DE PRUEBAS','OBLIGATORIA','N606',6,2,2,6),(49,'PROGRAMACIÓN MÓVIL','OBLIGATORIA','N607',6,2,2,6),(50,'BIG DATA Y TOMA DE DECISIONES (INFORMÁTICA)','OPTATIVA','T701',5,2,1,7),(51,'MONITOREO Y ADMINISTRACIÓN DE REDES (COMPUTACIÓN)','OPTATIVA','S701',5,2,1,7),(52,'REDES Y MODELOS DE SIMULACIÓN','OBLIGATORIA','N701',7,3,1,7),(53,'SIMULADORES VIRTUALES (COMPUTACIÓN)','OPTATIVA','A701',5,2,1,7),(54,'ADMINISTRACIÓN ESTRATÉGICA','OBLIGATORIA','N702',6,2,2,7),(55,'LEGISLACIÓN INFORMÁTICA','OBLIGATORIA','N703',7,3,1,7),(56,'FORMULACIÓN Y EVALUACIÓN DE PROYECTOS','OBLIGATORIA','N704',5,1,3,7),(57,'INGENIERÍA DEL CONOCIMIENTO','OBLIGATORIA','N705',6,2,2,7),(58,'INTERNET DE LAS COSAS','OBLIGATORIA','N706',6,2,2,7),(59,'SEGURIDAD EN REDES','OBLIGATORIA','N707',7,3,1,7),(60,'HABILIDADES DIRECTIVAS','OBLIGATORIA','N801',4,1,2,8),(61,'INFORMÁTICA EMPRESARIAL','OBLIGATORIA','N802',5,2,1,8),(62,'PROYECTO DE TITULACIÓN','OBLIGATORIA','N803',3,0,3,8),(63,'GESTIÓN DE PROYECTOS','OBLIGATORIA','N804',5,1,3,8),(64,'CALIDAD Y NORMALIZACIÓN DE SOFTWARE','OBLIGATORIA','N805',6,2,2,8),(65,'ADMINISTRACIÓN DE TECNOLOGÍAS','OBLIGATORIA','N806',6,2,2,8),(66,'FUNDAMENTOS DE ANALÍTICA DE DATOS','OBLIGATORIA','N807',6,2,2,8),(67,'COMPUTACIÓN EN LA NUBE','OBLIGATORIA','N808',6,2,2,8);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `idgroup` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idgroup`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'1NM10'),(2,'1NM11'),(3,'1NM12'),(4,'1NM18'),(5,'1NM19'),(6,'1NV10'),(7,'1NV11'),(8,'1NV12'),(9,'1NV18'),(10,'1NV19'),(11,'2NM20'),(12,'2NM21'),(13,'2NM22'),(14,'2NM23'),(15,'2NM24'),(16,'2NM25'),(17,'2NM40'),(18,'2NM41'),(19,'2NM50'),(20,'2NM60'),(21,'2NM61'),(22,'2NM70'),(23,'2NM72'),(24,'2NM2A'),(25,'2NM2B'),(26,'2NM2C'),(27,'2NM2E'),(28,'2NM2F'),(29,'2NV20'),(30,'2NV21'),(31,'2NV22'),(32,'2NV23'),(33,'2NV24'),(34,'2NV40'),(35,'2NV50'),(36,'2NV60'),(37,'2NV75'),(38,'2NV2A'),(39,'2NV2B'),(40,'2NV2D'),(41,'3NM30'),(42,'3NM31'),(43,'3NM32'),(44,'3NM40'),(45,'3NM42'),(46,'3NM45'),(47,'3NM48'),(48,'3NM50'),(49,'3NM51'),(50,'3NM60'),(51,'3NM61'),(52,'3NM64'),(53,'3NM70'),(54,'3NM71'),(55,'3NV30'),(56,'3NV31'),(57,'3NV32'),(58,'3NV40'),(59,'3NV50'),(60,'3NV51'),(61,'3NV59'),(62,'3NV60'),(63,'3NV69'),(64,'3NV70'),(65,'3NV71'),(66,'3NV78'),(67,'4NM40'),(68,'4NM41'),(69,'4NM42'),(70,'4NM43'),(71,'4NM50'),(72,'4NM52'),(73,'4NM60'),(74,'4NM61'),(75,'4NM63'),(76,'4NM70'),(77,'4NM71'),(78,'4NM73'),(79,'4NM74'),(80,'4NM75'),(81,'4NM80'),(82,'4NM81'),(83,'4NM4A'),(84,'4NM4B'),(85,'4NM4C'),(86,'4NV40'),(87,'4NV41'),(88,'4NV42'),(89,'4NV46'),(90,'4NV50'),(91,'4NV51'),(92,'4NV60'),(93,'4NV67'),(94,'4NV70'),(95,'4NV71'),(96,'4NV80'),(97,'4NV81'),(98,'4NV4A'),(99,'4NV4B'),(100,'4NV4C'),(101,'5NM50'),(102,'5NM51'),(103,'5NM52'),(104,'5NM57'),(105,'5NM58'),(106,'5NM59'),(107,'5NM70'),(108,'5NM71'),(109,'5NM80'),(110,'5NM81'),(111,'5NM89'),(112,'5NV50'),(113,'5NV51'),(114,'5NV57'),(115,'5NV58'),(116,'5NV59'),(117,'5NV70'),(118,'5NV71'),(119,'5NV80'),(120,'5NV81'),(121,'5NV82'),(122,'6NM60'),(123,'6NM61'),(124,'6NM67'),(125,'6NM68'),(126,'6NM69'),(127,'6NV60'),(128,'6NV61'),(129,'6NV67'),(130,'6NV68'),(131,'6NV69'),(132,'7NM70'),(133,'7NM77'),(134,'7NM78'),(135,'7NM79'),(136,'7NV70'),(137,'7NV79');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lines`
--

DROP TABLE IF EXISTS `lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lines` (
  `idline` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`idline`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lines`
--

LOCK TABLES `lines` WRITE;
/*!40000 ALTER TABLE `lines` DISABLE KEYS */;
INSERT INTO `lines` VALUES (1,'SEGURIDAD'),(2,'SIMULACION DE AMBIENTES VIRTUALES'),(3,'TI PARA LA INDUSTRIA COMPUTARIZADA');
/*!40000 ALTER TABLE `lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedules` (
  `idschedule` int NOT NULL AUTO_INCREMENT,
  `shift` varchar(5) DEFAULT NULL,
  `group_idgroup` int DEFAULT NULL,
  `course_idCourse` int DEFAULT NULL,
  `teacher_idTeacher` int DEFAULT NULL,
  `building` varchar(3) DEFAULT NULL,
  `classroom` tinyint DEFAULT NULL,
  `monday` json DEFAULT NULL,
  `tuesday` json DEFAULT NULL,
  `wednesday` json DEFAULT NULL,
  `thursday` json DEFAULT NULL,
  `friday` json DEFAULT NULL,
  PRIMARY KEY (`idschedule`),
  KEY `fk_schedule_teacher_idTeacher_idx` (`teacher_idTeacher`),
  KEY `fk_schedule_group_idGroup_idx` (`group_idgroup`),
  KEY `fk_schedule_course_idCourse_idx` (`course_idCourse`),
  CONSTRAINT `fk_schedule_course_idCourse` FOREIGN KEY (`course_idCourse`) REFERENCES `courses` (`idcourse`),
  CONSTRAINT `fk_schedule_group_idGroup` FOREIGN KEY (`group_idgroup`) REFERENCES `groups` (`idgroup`),
  CONSTRAINT `fk_schedule_teacher_idTeacher` FOREIGN KEY (`teacher_idTeacher`) REFERENCES `teachers` (`idteacher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_courses` (
  `student_idStudent` int NOT NULL AUTO_INCREMENT,
  `course_idCourse` int NOT NULL,
  `state` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`student_idStudent`,`course_idCourse`),
  KEY `fk_sc_course_idCourse_idx` (`course_idCourse`),
  CONSTRAINT `fk_sc_course_idCourse` FOREIGN KEY (`course_idCourse`) REFERENCES `courses` (`idcourse`),
  CONSTRAINT `fk_sc_student_idStudent` FOREIGN KEY (`student_idStudent`) REFERENCES `students` (`boleta`),
  CONSTRAINT `chk_state_sc` CHECK (((`state` = 0) or (`state` = 1) or (`state` = NULL)))
) ENGINE=InnoDB AUTO_INCREMENT=2020600021 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_courses`
--

LOCK TABLES `student_courses` WRITE;
/*!40000 ALTER TABLE `student_courses` DISABLE KEYS */;
INSERT INTO `student_courses` VALUES (2020600020,1,1),(2020600020,2,1),(2020600020,3,1),(2020600020,4,1),(2020600020,5,1),(2020600020,6,1),(2020600020,7,1),(2020600020,8,1),(2020600020,9,1),(2020600020,10,1),(2020600020,11,1),(2020600020,12,1),(2020600020,13,1),(2020600020,14,1),(2020600020,15,1),(2020600020,16,1),(2020600020,17,1),(2020600020,18,1),(2020600020,19,0),(2020600020,20,1),(2020600020,21,1),(2020600020,22,1);
/*!40000 ALTER TABLE `student_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `boleta` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `ape_pat` varchar(45) DEFAULT NULL,
  `ape_mat` varchar(45) DEFAULT NULL,
  `line_idline` int DEFAULT NULL,
  PRIMARY KEY (`boleta`),
  KEY `FK_S_IDLINE` (`line_idline`),
  CONSTRAINT `FK_S_IDLINE` FOREIGN KEY (`line_idline`) REFERENCES `lines` (`idline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (2020600001,'Juan','Pérez','Gómez',1),(2020600002,'María','García','López',NULL),(2020600003,'Carlos','Hernández','Martínez',NULL),(2020600004,'Ana','Rodríguez','Sánchez',1),(2020600005,'Pedro','Martínez','López',NULL),(2020600020,'simja','Coto','Sinta',3);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `idteacher` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `ape_pat` varchar(45) DEFAULT NULL,
  `ape_mat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idteacher`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'ESTEBAN','MATUS','MIRANDA'),(2,'GERMAN','RIVERA','VAZQUEZ'),(3,'GEORGINA','GONZALEZ','MILLAN'),(4,'FAUSTO','COTE','GUTIERREZ'),(5,'ÁNGEL','AGUILAR','GARCÍA'),(6,'ADRIAN','ZACARIAS','JIMENEZ'),(7,'ESTRELLA DE LA CRUZ','SANCHEZ','HERRERA'),(8,'SILVIA','MERA','OLGUIN'),(9,'MARCELA','ROJAS','MAYA'),(10,'ENRIQUE M.','ALVAREZ','GONZALEZ'),(11,'MARLIN SANDRA','GODINEZ','TORRES'),(12,'EDGAR','GARCIA','MANRIQUE'),(13,'BRANDON','ALTUZAR','CALZADA'),(14,'BEATRIZ','RAMIREZ','WOOLRICH'),(15,'ITANDEHUI','HERNANDEZ','AGUILAR'),(16,'ALEJANDRA','ZALLES','VIDAL'),(17,'ISRAEL MIGUEL','JAIMES','CAMACHO'),(18,'LAURA ANDROMEDA','FONSECA','MONTERRUBIO'),(19,'JUDITH','SONCK','LEDESMA'),(20,'HERMINIO','SUAREZ','QUIROZ'),(21,'EDGAR VICENTE','TORRES','GONZÁLEZ'),(22,'DONALDO ROBERTO','CRISTOBAL','VAZQUEZ'),(23,'JESUS ARTEMIO','VELAZCO','CLIMACO'),(24,'MIGUEL','HERNANDEZ','VICTOR'),(25,'GABRIELA','FRAUSTO','RODRIGUEZ'),(26,'JOSUE','AUSTRIA','PEREZ'),(27,'MARIA DEL ROCIO','FLORES','SANCHEZ'),(28,'JORGE','VIERA','HARO'),(29,'MAXIMINO','LAGUNES','VASQUEZ'),(30,'CESAR ALEJANDRO','NERIA','SUMANO'),(31,'MARBEL IGNACIA','HERNANDEZ','ORTIZ'),(32,'GILBERTO SAUL','CASTRO','MENDEZ'),(33,'LUIS ANGEL','VILLAMIL','LUNA'),(34,'ANGEL G.','LOPEZ','SANTACRUZ'),(35,'RUBEN','BELTRAN','DE PAZ'),(36,'ANTONIO','DIAZ','SANCHEZ'),(37,'GABRIEL','HARO','AGUILAR'),(38,'JUAN MANUEL','JUAREZ','TREVIÑO'),(39,'EMETERIO GONZALO','LEYRA','GALAN'),(40,'VICTOR MANUEL','SANCHEZ','LOPEZ'),(41,'CARLOS ALBERTO','BADILLO','RUIZ'),(42,'GIOVANNY DE JESUS','QUESADA','MARTINEZ'),(43,'NANCY JUDITH','VARGAS','MONTIEL'),(44,'ROBERTO','HERRERA','MEJIA'),(45,'JOSE LUIS','GARCIA','RODRIGUEZ'),(46,'PAULA','LEON','ALVARADO'),(47,'ROSA ISELA','RODRIGUEZ','NIETO'),(48,'MARIO ALBERTO','SESMA','MARTINEZ'),(49,'NANCY LORENA','ORTIZ','CASTREJON'),(50,'JOSE','TERAN','MORALES'),(51,'MARCIAL','PALACIOS','GARCIA'),(52,'IVAN','AQUINO','LICONA'),(53,'YVENTZ','ENTZANA','GARDUñO'),(54,'EUGENIO','PEREZ','HUERTA'),(55,'ERNESTO','BARBA','MENDEZ'),(56,'ALEJANDRO','CASILLAS','RIVAS'),(57,'SERGIO','LAZARO','GONZALEZ'),(58,'JULIA ALICIA','ORTEGA','AVALOS'),(59,'MARIA DE LOURDES','MUÑOZ','AGUIRRE'),(60,'JOSE LUIS','X','RODRIGUEZ'),(61,'LUCRECIA GUADALUPE','FLORES','ROSETE'),(62,'VICTOR','HERNANDEZ','RUBI'),(63,'DR. JOSE LUIS','LOPEZ','GOYTIA'),(64,'MANUEL ROBERTO','MONTES','ORTIZ'),(65,'LIC. DANIEL OSWALDO','RICO','ARAGON'),(66,'SUSANA','CUEVAS','ESCOBAR'),(67,'MIGUEL ANGEL','CORTES','NORIEGA'),(68,'ALFONSO LEOBARDO','ZARCO','ISTIGA'),(69,'HECTOR ALBERTO','GARCIA','ROMERO'),(70,'ARACELI','PONCE','MARTINEZ'),(71,'ALEJANDRA','HERNANDEZ','ROJAS'),(72,'JULIO CESAR','NIEVES','GODINEZ'),(73,'RUBEN','BENITEZ','LOPEZ'),(74,'ADAUTO ISRAEL','ORTIZ','ROMERO'),(75,'MA. EUGENIA','MARES','ROMERO'),(76,'ARTURO','FLORES','ZARATE'),(77,'ABEL','MELENDEZ','MANRIQUE'),(78,'SILVIA','OCHOA','AYALA'),(79,'VICTOR','MORALES','CASTILLO'),(80,'OSCAR','ORTIZ','CASTILLO'),(81,'GILBERTO','VILLAVICENCIO','ORTIZ'),(82,'NOE CESAR','MENDEZ','HERNANDEZ'),(83,'GABRIELA','TAPIA','JAIMES'),(84,'SERAFIN','ORTEGA','DE LA CRUZ'),(85,'HUGO','BETANZOS','MENDEZ'),(86,'MARCO FERNANDO','ANDRADE','CEDILLO'),(87,'ENRIQUE','RODRIGUEZ','VALDEZ'),(88,'ANTONINO','DANIEL','MEDEROS'),(89,'ENRIQUE GERARDO','DEL CASTILLO','NEWMANN'),(90,'NOE','ROSAS','ORTIZ'),(91,'ALMA PATRICIA','BOCARDO','RAMIREZ'),(92,'ADALBERTO','AVENDAÑO','PRIETO'),(93,'MONICA ELIZABETH','GARCIA','RODRIGUEZ'),(94,'FRANCISCO JAVIER','BUENO','VASQUEZ'),(95,'SILVIA MARCELA','ARMAS','GUZMAN'),(96,'FERNANDO','BUGARINI','HERNANDEZ'),(97,'LAURA ANGELICA','GOMEZ','ARAGON'),(98,'OSKAR ARMANDO','GOMEZ','CORONEL'),(99,'ERIC','PEREZ','ALTAMIRANO'),(100,'M EN C. SERGIO','FUENLABRADA','VELAZQUEZ'),(101,'CARLOS ALEJANDRO','MERLO','ZAPATA'),(102,'EDNA MARTHA','MIRANDA','CHAVEZ'),(103,'SUSANA','JAUREGUI','HONORATO'),(104,'BRENDA AURORA','CABAÑAS','VILLANUEVA'),(105,'ERICK','HUERTA','VALDEPEÑA'),(106,'ARTURO','ANGELES','JACINTO'),(107,'JUAN','HERNANDEZ','GUERRERO'),(108,'JUAN ROBERTO','REYES','ENCISO'),(109,'ARMANDO','TORRES','CORONEL'),(110,'MIGUEL ÁNGEL','GONZÁLEZ','JÍMENEZ'),(111,'ABEL','MUÑOZ','DE LUNA'),(112,'ROCIO','BUSTAMANTE','TRANQUILINO'),(113,'MARIA CRISTINA','GUZMAN','CORDERO'),(114,'SUSANA','NONATO','RAMIREZ'),(115,'KARLA','MONTIEL','LUCIO'),(116,'JUAN CARLOS','CRUZ','ROMERO'),(117,'VICTOR','GARDUÑO','MENDIETA'),(118,'YENNELY ELOISA','GOYCOCHEA','PINEDA'),(119,'JESUS','PIMENTEL','CRUZ'),(120,'MARIA DE LOS ANGELES','GUTIERREZ','GARCIA'),(121,'JESUS M.','OLIVARES','CEJA'),(122,'FERNANDO','LUQUE','MARQUEZ'),(123,'GUILLERMO','RIVERA','RANGEL'),(124,'GUSTAVO','MARTINEZ','VAZQUEZ'),(125,'FRANCISCO J.','PINGARRON','MORALES'),(126,'RAMON','RODRIGUEZ','JIMENEZ'),(127,'JOSE LUIS','CHAVEZ','PEREZ'),(128,'JORGE','CHECA','ROSAS'),(129,'JOSE ANTONIO','VELASCO','CONTRERAS'),(130,'OSCAR','MOTA','MARQUEZ'),(131,'JONATHAN','LUNA','MARTINEZ'),(132,'JUAN ALBERTO','SEGUNDO','MIRANDA'),(133,'ENRIQUE','PEREZ','JIMENEZ'),(134,'ADRIAN','PALMA','CASTILLO'),(135,'CARLOS','OLICON','NAVA'),(136,'ANA VELIA','ARELLANO','LOPEZ'),(137,'XOCHITL','DURAN','ANDRADE'),(138,'RICARDO','HERNANDEZ','CERON'),(139,'PABLO EMILIO','ESCAMILLA','GARCÍA'),(140,'LUCIANO','VARELA','CORONEL'),(141,'RUTH','BLAS','VAZQUEZ'),(142,'MARIANA','PINEDA','MENDEZ'),(143,'VICTOR L.','SANDOVAL','GONZALEZ'),(144,'MILDRED KARINA','ORTIZ','ALVAREZ'),(145,'SAUL','LOPEZ','AVILA'),(146,'RAMON','CHAVEZ','LOPEZ'),(147,'MARTIN','MANCERA','LOPEZ'),(148,'CARLOS','JESUS','CARRILLO'),(149,'ALFONSO','AVALOS','LUNA'),(150,'LILIANA','MACEDO','MARTINEZ'),(151,'ILIANA','LOPEZ','VALERIANO'),(152,'BELINDA','MOLINA','BAÑUELOS'),(153,'MARIA ELOISA','AYUSO','NARANJO'),(154,'MIGUEL A.','ROJAS','LOPEZ PORTILLO'),(155,'ROCIO','GARCIA','PEDRAZA'),(156,'GABRIEL','INIESTRA','NAVARRETE'),(157,'EDUARDO','SANCHEZ','SOLORZANO'),(158,'MA.DEL ROCIO','VELAZQUEZ','SERRANO'),(159,'MIGUEL A.','MARTINEZ','TLAHUEL'),(160,'ENRIQUE','AGUILAR','PEREZ'),(161,'MARILÚ','VALENCIA','ELIZALDE'),(162,'FATIMA MARGARITA','LECHUGA','BLANCO'),(163,'CLAUDIA','AZORIN','VEGA'),(164,'ANTONIO','JIMENEZ','SANCHEZ'),(165,'CARLOS','MORTERA','ZENTENO'),(166,'JOSE DE JESUS','LOPEZ','HARO'),(167,'CARLOS RODRIGO','RODRIGUEZ','CALDERON DE LA BARCA'),(168,'RENE','RAMIREZ','HERNANDEZ'),(169,'RICARDO','GARCIA','ESPINOSA'),(170,'RAYMUNDO','MENESES','GONZALEZ'),(171,'CLAUDIA BEATRIZ','ALONSO','PEREZ'),(172,'LUIS FERNANDO','ZEPEDA','FLORES'),(173,'JOB','BELTRAN','MURGUIA'),(174,'YOLANDA','GUADARRAMA','ALBA'),(175,'JOSE ARTURO','VERDUZCO','VERA'),(176,'RAFAEL','GUTIERREZ','ESTRADA'),(177,'GUSTAVO','MAZCORRO','TELLEZ'),(178,'BERNARDO','HERNANDEZ','CRUZ'),(179,'ELIZABETH','CARRIZOSA','RIVERA'),(180,'GERMAN','VERA','MARTINEZ'),(181,'JOSE LUIS','MELGOZA','MARAVILLA'),(182,'JOSE','DELGADO','RIVERA'),(183,'FRANCISCO FABIA','GONZALEZ','DE LA O'),(184,'ANTONIO','ROMERO','HERNANDEZ'),(185,'FIDEL','CISNEROS','MOLINA'),(186,'ANTONIO','VELASCO','GOMEZ'),(187,'EMMANUEL','GARCIA','LUNA'),(188,'JUAN','GARCIA','GUZMAN'),(189,'OSCAR IVAN','HERNANDEZ','BAUTISTA'),(190,'FAUSTINO RICARDO','GARCIA','SOSA'),(191,'E. ANTONIO','CORDOVA','VILLAGRAN'),(192,'JORGE','MARTINEZ','VALDEZ'),(193,'ALFREDO','CANELA','LUNA'),(194,'VICTOR ALFREDO','GALLARDO','SANCHEZ'),(195,'JORGE A.','CEREZO','HERNANDEZ'),(196,'RAMON','CRUZ','MARTINEZ'),(197,'GUILLERMO R.','DOMINGUEZ','DE LEON'),(198,'ALMA DELIA V.','LOPEZ','JARQUIN'),(199,'LILIA','GONZALEZ','ARROYO'),(200,'ANEL','HERNANDEZ','ISLAS'),(201,'LUIS','CHAVEZ','GARCIA'),(202,'HUMBERTO','OVIEDO','GALDEANO'),(203,'MONICA PAOLA','VELASCO','LIRA'),(204,'ABEL','BUENO','MEZA'),(205,'JUAN JOSE','CRUZ','MONTOYA'),(206,'JESUS MICHEL','LEGAL','HERNANDEZ'),(207,'HUITZILIHUITL','SANCHEZ','RODRIGUEZ'),(208,'RICARDO ARMANDO','MACHORRO','REYES'),(209,'JUAN','ALVARADO','Y ALVARADO'),(210,'RICARDO ISAY','GONSEN','HUERTA'),(211,'DENISSE','DIAZ','DE LEON'),(212,'JORGE','GUERRERO','CORONA'),(213,'JUAN CARLOS','GUTIERREZ','MATUS'),(214,'MARICRUZ','GONZALEZ','ROGEL'),(215,'ARACELI','GUERRERO','HUERTA');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'schedule_assistant'
--

--
-- Dumping routines for database 'schedule_assistant'
--
/*!50003 DROP PROCEDURE IF EXISTS `explain_statement` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `explain_statement`(IN query TEXT)
BEGIN
    SET @explain := CONCAT('EXPLAIN FORMAT=json ', query);
    PREPARE stmt FROM @explain;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-17 20:17:23
