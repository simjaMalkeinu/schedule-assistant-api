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
  `monday` varchar(15) DEFAULT NULL,
  `tuesday` varchar(15) DEFAULT NULL,
  `wednesday` varchar(15) DEFAULT NULL,
  `thursday` varchar(15) DEFAULT NULL,
  `friday` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idschedule`),
  KEY `fk_schedule_teacher_idTeacher_idx` (`teacher_idTeacher`),
  KEY `fk_schedule_group_idGroup_idx` (`group_idgroup`),
  KEY `fk_schedule_course_idCourse_idx` (`course_idCourse`),
  CONSTRAINT `fk_schedule_course_idCourse` FOREIGN KEY (`course_idCourse`) REFERENCES `courses` (`idcourse`),
  CONSTRAINT `fk_schedule_group_idGroup` FOREIGN KEY (`group_idgroup`) REFERENCES `groups` (`idgroup`),
  CONSTRAINT `fk_schedule_teacher_idTeacher` FOREIGN KEY (`teacher_idTeacher`) REFERENCES `teachers` (`idteacher`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-26 22:06:59
