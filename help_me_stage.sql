/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-12.2.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: help_me_stage
-- ------------------------------------------------------
-- Server version	12.2.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `candidatures`
--

DROP TABLE IF EXISTS `candidatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidatures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_user_id` int(11) NOT NULL,
  `offre_id` int(11) NOT NULL,
  `status` enum('envoyee','en_etude','acceptee','refusee') NOT NULL DEFAULT 'envoyee',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `lettre_motivation` text DEFAULT NULL,
  `cv_filename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_user_id` (`student_user_id`),
  KEY `offre_id` (`offre_id`),
  CONSTRAINT `1` FOREIGN KEY (`student_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`offre_id`) REFERENCES `offres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatures`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `candidatures` WRITE;
/*!40000 ALTER TABLE `candidatures` DISABLE KEYS */;
INSERT INTO `candidatures` VALUES
(75,13,1,'acceptee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-13.pdf'),
(77,16,1,'acceptee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-16.pdf'),
(78,17,1,'en_etude','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-17.pdf'),
(79,19,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-19.pdf'),
(81,21,1,'en_etude','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-21.pdf'),
(82,22,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-22.pdf'),
(83,23,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-23.pdf'),
(84,24,1,'acceptee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-24.pdf'),
(86,26,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-26.pdf'),
(87,27,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-27.pdf'),
(88,28,1,'acceptee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-28.pdf'),
(89,29,1,'en_etude','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-29.pdf'),
(91,31,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-31.pdf'),
(92,32,1,'acceptee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-32.pdf'),
(93,33,1,'en_etude','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-33.pdf'),
(94,34,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-34.pdf'),
(96,36,1,'acceptee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-36.pdf'),
(97,37,1,'en_etude','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-37.pdf'),
(98,38,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-38.pdf'),
(99,39,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-39.pdf'),
(101,41,1,'en_etude','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-41.pdf'),
(102,42,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-42.pdf'),
(103,43,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-43.pdf'),
(104,51,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-51.pdf'),
(105,52,1,'acceptee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-52.pdf'),
(106,53,1,'en_etude','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-53.pdf'),
(107,54,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-54.pdf'),
(109,56,1,'acceptee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-56.pdf'),
(110,57,1,'en_etude','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-57.pdf'),
(111,58,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-58.pdf'),
(112,59,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-59.pdf'),
(114,61,1,'en_etude','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-61.pdf'),
(115,62,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-62.pdf'),
(116,63,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-63.pdf'),
(117,64,1,'acceptee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-64.pdf'),
(119,66,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-66.pdf'),
(120,67,1,'envoyee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-67.pdf'),
(121,68,1,'acceptee','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-68.pdf'),
(122,69,1,'en_etude','2026-03-17 23:00:00','Candidature automatique réaliste.','cv-69.pdf'),
(124,13,2,'envoyee','2026-03-23 08:43:15','fdédéiufyuénfiunfiuzniuznciznfdiznfinzfizfizc','bastien.pdf'),
(125,13,38,'envoyee','2026-03-23 08:58:03','nbZCBZYUCLNUICXnNCIUMZNMIUZNCMZ','bastien.pdf'),
(126,13,51,'envoyee','2026-03-24 07:39:38','ny<vyYBVUvuimlnviunv','bastien.pdf'),
(127,13,52,'envoyee','2026-03-24 08:13:17','fdcecknznclezcn,ec\",kc\"c\"c\"c','jhcxl.pdf');
/*!40000 ALTER TABLE `candidatures` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `competences`
--

DROP TABLE IF EXISTS `competences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `competences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competences`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `competences` WRITE;
/*!40000 ALTER TABLE `competences` DISABLE KEYS */;
INSERT INTO `competences` VALUES
(8,'Figma'),
(5,'Google Ads'),
(3,'MongoDB'),
(2,'Node.js'),
(6,'Python'),
(1,'React'),
(4,'SEO'),
(7,'SQL');
/*!40000 ALTER TABLE `competences` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `cookie_consents`
--

DROP TABLE IF EXISTS `cookie_consents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cookie_consents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consent_token` varchar(64) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `essential` tinyint(1) NOT NULL DEFAULT 1,
  `analytics` tinyint(1) NOT NULL DEFAULT 0,
  `marketing` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_cookie_consents_token` (`consent_token`),
  KEY `idx_cookie_consents_user_id` (`user_id`),
  CONSTRAINT `fk_cookie_consents_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cookie_consents`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `cookie_consents` WRITE;
/*!40000 ALTER TABLE `cookie_consents` DISABLE KEYS */;
INSERT INTO `cookie_consents` VALUES
(1,'423a855a4bf4acda71b365f37fd1d28fe6083fe4b7869a55df184a8b0d2e1ddf',82,1,1,1,'2026-03-17 15:39:47','2026-03-24 08:17:13');
/*!40000 ALTER TABLE `cookie_consents` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `entreprises`
--

DROP TABLE IF EXISTS `entreprises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entreprises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `secteur` varchar(150) DEFAULT NULL,
  `ville` varchar(150) DEFAULT NULL,
  `site_web` varchar(255) DEFAULT NULL,
  `note` decimal(3,1) DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_entreprises_nom` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entreprises`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `entreprises` WRITE;
/*!40000 ALTER TABLE `entreprises` DISABLE KEYS */;
INSERT INTO `entreprises` VALUES
(1,'TechStart','Développement web','Paris','https://techstart.example.com',4.5,'Entreprise dynamique avec de bonnes missions.','2026-03-18 20:16:01','2026-03-18 20:16:01'),
(2,'Digital Agency','Marketing digital','Lyon','https://digitalagency.example.com',4.0,'Bonne structure pour découvrir la communication digitale.','2026-03-18 20:16:01','2026-03-18 20:16:01'),
(3,'DataCorp','Data / BI','Marseille','https://datacorp.example.com',4.2,'Environnement intéressant pour la data analyse.','2026-03-18 20:16:01','2026-03-18 20:16:01'),
(4,'LogiWave','Systèmes / Linux','Lyon','https://logiwave.example.com',3.8,'Cadre technique solide et missions variées.','2026-03-18 20:16:01','2026-03-18 20:16:01'),
(5,'CyberLink','Cybersécurité','Nancy','https://cyberlink.example.com',4.7,'Très bonne exposition aux sujets sécurité.','2026-03-18 20:16:01','2026-03-18 20:16:01'),
(21,'bastiendata','meca','marly','https://bastmeca.example.com',5.0,'Parfait','2026-03-21 16:06:14','2026-03-21 16:06:14');
/*!40000 ALTER TABLE `entreprises` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `offre_competence`
--

DROP TABLE IF EXISTS `offre_competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `offre_competence` (
  `offre_id` int(11) NOT NULL,
  `competence_id` int(11) NOT NULL,
  PRIMARY KEY (`offre_id`,`competence_id`),
  KEY `competence_id` (`competence_id`),
  CONSTRAINT `1` FOREIGN KEY (`offre_id`) REFERENCES `offres` (`id`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`competence_id`) REFERENCES `competences` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre_competence`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `offre_competence` WRITE;
/*!40000 ALTER TABLE `offre_competence` DISABLE KEYS */;
INSERT INTO `offre_competence` VALUES
(1,1),
(1,2),
(1,3),
(2,4),
(2,5),
(3,6),
(3,7);
/*!40000 ALTER TABLE `offre_competence` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `offres`
--

DROP TABLE IF EXISTS `offres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `offres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `entreprise_id` int(11) DEFAULT NULL,
  `entreprise` varchar(255) NOT NULL,
  `lieu` varchar(150) DEFAULT NULL,
  `duree_semaines` int(11) DEFAULT NULL,
  `remuneration` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_offres_entreprise` (`entreprise_id`),
  CONSTRAINT `fk_offres_entreprise` FOREIGN KEY (`entreprise_id`) REFERENCES `entreprises` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offres`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `offres` WRITE;
/*!40000 ALTER TABLE `offres` DISABLE KEYS */;
INSERT INTO `offres` VALUES
(1,'Stage Développeur Web Full-Stack',1,'TechStart','Paris',12,650.00,'Développement web','2026-03-11 18:28:15'),
(2,'Stage Marketing Digital',2,'Digital Agency','Lyon',10,600.00,'Gestion campagnes marketing','2026-03-11 18:28:15'),
(3,'Stage Data Analyst',3,'DataCorp','Marseille',16,700.00,'Analyse de données','2026-03-11 18:28:15'),
(4,'Stage Développeur Web PHP #1',NULL,'TechNova','Metz',12,650.00,'Participation au développement d’applications web en PHP/Twig, maintenance et amélioration continue.','2026-01-10 08:00:00'),
(5,'Stage Développeur Front-End #2',NULL,'BluePixel','Nancy',10,600.00,'Intégration HTML/CSS/JS d’interfaces web et amélioration UX/UI.','2026-01-11 08:00:00'),
(6,'Stage Développeur Back-End #3',NULL,'HexaSoft','Luxembourg',16,800.00,'Développement côté serveur, API, base de données et tests.','2026-01-12 08:00:00'),
(7,'Stage Réseaux et Systèmes #4',NULL,'NetOrion','Strasbourg',12,700.00,'Support réseau, supervision, configuration switchs et documentation.','2026-01-13 08:00:00'),
(8,'Stage Technicien Support IT #5',NULL,'Synapse IT','Paris',8,580.00,'Support utilisateurs, postes clients, incidents et suivi ticketing.','2026-01-14 08:00:00'),
(9,'Stage Développeur Python #6',NULL,'DataPulse','Lyon',12,700.00,'Scripts Python, automatisation et traitement de données.','2026-01-15 08:00:00'),
(10,'Stage Base de Données SQL #7',3,'DataCorp','Reims',10,680.00,'Requêtes SQL, optimisation et suivi qualité des données.','2026-01-16 08:00:00'),
(11,'Stage Développeur Full Stack #8',NULL,'Asteria Digital','Lille',16,750.00,'Développement full stack sur projet applicatif interne.','2026-01-17 08:00:00'),
(12,'Stage Cybersécurité Junior #9',5,'CyberLink','Toulouse',12,780.00,'Contrôles de sécurité, audit technique et bonnes pratiques.','2026-01-18 08:00:00'),
(13,'Stage Admin Linux #10',4,'LogiWave','Orléans',10,690.00,'Administration Linux, scripts shell et supervision.','2026-01-19 08:00:00'),
(14,'Stage Développeur Web PHP #11',NULL,'TechNova','Nancy',12,650.00,'Développement PHP orienté MVC, correction de bugs et évolutions fonctionnelles.','2026-01-20 08:00:00'),
(15,'Stage Développeur Front-End #12',NULL,'BluePixel','Metz',10,620.00,'Création de composants front-end responsives en HTML/CSS/JS.','2026-01-21 08:00:00'),
(16,'Stage Développeur Back-End #13',NULL,'HexaSoft','Paris',16,820.00,'Conception d’API internes et interactions base de données.','2026-01-22 08:00:00'),
(17,'Stage Réseaux et Systèmes #14',NULL,'NetOrion','Lyon',12,720.00,'Configuration réseau, supervision et support infrastructure.','2026-01-23 08:00:00'),
(18,'Stage Technicien Support IT #15',NULL,'Synapse IT','Luxembourg',8,600.00,'Assistance de proximité, masterisation et support bureautique.','2026-01-24 08:00:00'),
(19,'Stage Développeur Python #16',NULL,'DataPulse','Strasbourg',12,710.00,'Développement Python pour outils internes et automatisation.','2026-01-25 08:00:00'),
(20,'Stage Base de Données SQL #17',3,'DataCorp','Paris',10,690.00,'Exploitation SQL, vues, reporting et contrôle de cohérence.','2026-01-26 08:00:00'),
(21,'Stage Développeur Full Stack #18',NULL,'Asteria Digital','Toulouse',16,760.00,'Développement d’un portail web avec front et back intégrés.','2026-01-27 08:00:00'),
(22,'Stage Cybersécurité Junior #19',5,'CyberLink','Metz',12,790.00,'Analyse de vulnérabilités et suivi des remédiations.','2026-01-28 08:00:00'),
(23,'Stage Admin Linux #20',4,'LogiWave','Nancy',10,700.00,'Administration Linux, monitoring et scripts de maintenance.','2026-01-29 08:00:00'),
(24,'Stage Développeur Web PHP #21',NULL,'TechNova','Reims',12,640.00,'Travaux de développement web, formulaires, sessions et sécurité.','2026-01-30 08:00:00'),
(25,'Stage Développeur Front-End #22',NULL,'BluePixel','Lille',10,610.00,'Intégration graphique et amélioration responsive.','2026-01-31 08:00:00'),
(26,'Stage Développeur Back-End #23',NULL,'HexaSoft','Metz',16,810.00,'Travail sur logique métier, architecture MVC et SQL.','2026-02-01 08:00:00'),
(27,'Stage Réseaux et Systèmes #24',NULL,'NetOrion','Orléans',12,710.00,'Participation à l’exploitation réseau et documentation technique.','2026-02-02 08:00:00'),
(28,'Stage Technicien Support IT #25',NULL,'Synapse IT','Lille',8,590.00,'Support utilisateurs, diagnostic et résolution d’incidents.','2026-02-03 08:00:00'),
(29,'Stage Développeur Python #26',NULL,'DataPulse','Paris',12,730.00,'Développement d’outils Python et traitement automatisé.','2026-02-04 08:00:00'),
(30,'Stage Base de Données SQL #27',3,'DataCorp','Nancy',10,675.00,'Manipulation de données, requêtes SQL et reporting.','2026-02-05 08:00:00'),
(31,'Stage Développeur Full Stack #28',NULL,'Asteria Digital','Strasbourg',16,770.00,'Développement d’une application web interne.','2026-02-06 08:00:00'),
(32,'Stage Cybersécurité Junior #29',5,'CyberLink','Reims',12,785.00,'Contrôles techniques et analyses sécurité.','2026-02-07 08:00:00'),
(33,'Stage Admin Linux #30',4,'LogiWave','Paris',10,710.00,'Administration système Linux et suivi de production.','2026-02-08 08:00:00'),
(34,'Stage Développeur Web PHP #31',NULL,'TechNova','Orléans',12,660.00,'Développement PHP/Twig et amélioration d’outils métiers.','2026-02-09 08:00:00'),
(35,'Stage Développeur Front-End #32',NULL,'BluePixel','Toulouse',10,615.00,'Travail sur UI web, composants et responsive design.','2026-02-10 08:00:00'),
(36,'Stage Développeur Back-End #33',NULL,'HexaSoft','Lyon',16,805.00,'Développement serveur, API et sécurité applicative.','2026-02-11 08:00:00'),
(37,'Stage Réseaux et Systèmes #34',NULL,'NetOrion','Metz',12,725.00,'Suivi d’infrastructure, documentation et support réseau.','2026-02-12 08:00:00'),
(38,'Stage Technicien Support IT #35',NULL,'Synapse IT','Reims',8,585.00,'Support technique de niveau 1 et gestion du parc.','2026-02-13 08:00:00'),
(39,'Stage Développeur Python #36',NULL,'DataPulse','Luxembourg',12,760.00,'Scripting Python, data et automatisation de tâches.','2026-02-14 08:00:00'),
(40,'Stage Base de Données SQL #37',3,'DataCorp','Lyon',10,690.00,'Mise en qualité de données et requêtage SQL.','2026-02-15 08:00:00'),
(41,'Stage Développeur Full Stack #38',NULL,'Asteria Digital','Metz',16,755.00,'Développement full stack sur environnement web.','2026-02-16 08:00:00'),
(42,'Stage Cybersécurité Junior #39',5,'CyberLink','Lille',12,800.00,'Support sécurité, audits et sensibilisation technique.','2026-02-17 08:00:00'),
(43,'Stage Admin Linux #40',4,'LogiWave','Strasbourg',10,705.00,'Scripts shell, Linux et support exploitation.','2026-02-18 08:00:00'),
(44,'Stage Développeur Web PHP #41',NULL,'TechNova','Paris',12,670.00,'Développement back-office et maintenance corrective.','2026-02-19 08:00:00'),
(45,'Stage Développeur Front-End #42',NULL,'BluePixel','Orléans',10,620.00,'Création de pages web interactives et optimisation UX.','2026-02-20 08:00:00'),
(46,'Stage Développeur Back-End #43',NULL,'HexaSoft','Nancy',16,790.00,'Conception technique, SQL et logique métier.','2026-02-21 08:00:00'),
(47,'Stage Réseaux et Systèmes #44',NULL,'NetOrion','Luxembourg',12,740.00,'Configuration réseau, sécurité et supervision.','2026-02-22 08:00:00'),
(48,'Stage Technicien Support IT #45',NULL,'Synapse IT','Metz',8,600.00,'Prise en charge des incidents utilisateurs.','2026-02-23 08:00:00'),
(49,'Stage Développeur Python #46',NULL,'DataPulse','Reims',12,720.00,'Développement d’outils Python orientés productivité.','2026-02-24 08:00:00'),
(50,'Stage Base de Données SQL #47',3,'DataCorp','Toulouse',10,700.00,'SQL, reporting et maintenance de base de données.','2026-02-25 08:00:00'),
(51,'Stage Développeur Full Stack #48',NULL,'Asteria Digital','Paris',16,780.00,'Participation complète au développement d’une plateforme web.','2026-02-26 08:00:00'),
(52,'Stage Cybersécurité Junior #49',5,'CyberLink','Nancy',12,795.00,'Surveillance sécurité et contrôles de conformité technique.','2026-02-27 08:00:00'),
(53,'Stage Admin Linux #50',4,'LogiWave','Lyon',10,710.00,'Administration Linux, scripts et support exploitation.','2026-02-28 08:00:00');
/*!40000 ALTER TABLE `offres` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `promotions`
--

DROP TABLE IF EXISTS `promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_promotions_label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotions`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `promotions` WRITE;
/*!40000 ALTER TABLE `promotions` DISABLE KEYS */;
INSERT INTO `promotions` VALUES
(1,'CPI A1',1,'2026-03-17 16:42:12'),
(2,'CPI A2',1,'2026-03-17 16:42:12'),
(3,'Master 1',1,'2026-03-17 16:42:12'),
(4,'Master 2',1,'2026-03-17 16:42:12'),
(5,'Bachelor 3',1,'2026-03-17 16:42:12'),
(6,'Licence 3',1,'2026-03-17 16:42:12');
/*!40000 ALTER TABLE `promotions` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `student_competence`
--

DROP TABLE IF EXISTS `student_competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_competence` (
  `user_id` int(11) NOT NULL,
  `competence_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`competence_id`),
  KEY `competence_id` (`competence_id`),
  CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`competence_id`) REFERENCES `competences` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_competence`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `student_competence` WRITE;
/*!40000 ALTER TABLE `student_competence` DISABLE KEYS */;
INSERT INTO `student_competence` VALUES
(13,1),
(13,2),
(13,7);
/*!40000 ALTER TABLE `student_competence` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `student_profiles`
--

DROP TABLE IF EXISTS `student_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `formation` varchar(150) NOT NULL,
  `promotion_id` int(11) DEFAULT NULL,
  `status` enum('sans_stage','en_recherche','stage_trouve','stage_valide') NOT NULL DEFAULT 'en_recherche',
  `last_activity` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `fk_student_profiles_promotion` (`promotion_id`),
  CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_student_profiles_promotion` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_profiles`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `student_profiles` WRITE;
/*!40000 ALTER TABLE `student_profiles` DISABLE KEYS */;
INSERT INTO `student_profiles` VALUES
(6,15,'Master Informatique',NULL,'sans_stage','2026-03-23'),
(7,16,'Licence Marketing',NULL,'stage_valide','2026-03-23'),
(8,17,'Master Data Science',NULL,'stage_trouve','2026-03-23'),
(14,19,'CPI A2',2,'en_recherche','2026-03-23'),
(15,20,'CPI A2',2,'sans_stage','2026-03-23'),
(16,21,'CPI A2',2,'stage_trouve','2026-03-23'),
(17,22,'CPI A2',2,'en_recherche','2026-03-23'),
(18,23,'CPI A2',2,'en_recherche','2026-03-23'),
(19,24,'CPI A2',2,'stage_valide','2026-03-23'),
(20,25,'CPI A2',2,'sans_stage','2026-03-23'),
(21,26,'CPI A2',2,'en_recherche','2026-03-23'),
(22,27,'CPI A2',2,'en_recherche','2026-03-23'),
(23,28,'CPI A2',2,'stage_valide','2026-03-23'),
(24,29,'CPI A2',2,'stage_trouve','2026-03-23'),
(25,30,'CPI A2',2,'sans_stage','2026-03-23'),
(26,31,'CPI A2',2,'en_recherche','2026-03-23'),
(27,32,'CPI A2',2,'stage_valide','2026-03-23'),
(28,33,'CPI A2',2,'stage_trouve','2026-03-23'),
(29,34,'CPI A2',2,'en_recherche','2026-03-23'),
(30,35,'CPI A2',2,'sans_stage','2026-03-23'),
(31,36,'CPI A2',2,'sans_stage','2026-03-23'),
(32,37,'CPI A2',2,'stage_trouve','2026-03-23'),
(33,38,'CPI A2',2,'en_recherche','2026-03-23'),
(34,39,'CPI A2',2,'en_recherche','2026-03-23'),
(35,40,'CPI A2',2,'sans_stage','2026-03-23'),
(36,41,'CPI A2',2,'stage_trouve','2026-03-24'),
(37,42,'CPI A2',2,'en_recherche','2026-03-23'),
(38,43,'CPI A2',2,'en_recherche','2026-03-23'),
(46,51,'CPI A1',1,'en_recherche','2026-03-23'),
(47,52,'CPI A1',1,'sans_stage','2026-03-24'),
(48,53,'CPI A1',1,'stage_trouve','2026-03-23'),
(49,54,'CPI A1',1,'en_recherche','2026-03-23'),
(50,55,'CPI A1',1,'sans_stage','2026-03-23'),
(51,56,'CPI A1',1,'stage_valide','2026-03-23'),
(52,57,'CPI A1',1,'stage_trouve','2026-03-23'),
(53,58,'CPI A1',1,'en_recherche','2026-03-23'),
(54,59,'CPI A1',1,'en_recherche','2026-03-23'),
(55,60,'CPI A1',1,'sans_stage','2026-03-23'),
(56,61,'CPI A1',1,'stage_trouve','2026-03-23'),
(57,62,'CPI A1',1,'en_recherche','2026-03-23'),
(58,63,'CPI A1',1,'en_recherche','2026-03-23'),
(59,64,'CPI A1',1,'stage_valide','2026-03-23'),
(60,65,'CPI A1',1,'sans_stage','2026-03-23'),
(61,66,'CPI A1',1,'en_recherche','2026-03-23'),
(62,67,'CPI A1',1,'en_recherche','2026-03-23'),
(63,68,'CPI A1',1,'stage_valide','2026-03-23'),
(64,69,'CPI A1',1,'stage_trouve','2026-03-23'),
(65,70,'CPI A1',1,'sans_stage','2026-03-23');
/*!40000 ALTER TABLE `student_profiles` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `student_wishlist`
--

DROP TABLE IF EXISTS `student_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_wishlist` (
  `user_id` int(11) NOT NULL,
  `offre_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`,`offre_id`),
  KEY `offre_id` (`offre_id`),
  CONSTRAINT `1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `2` FOREIGN KEY (`offre_id`) REFERENCES `offres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_wishlist`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `student_wishlist` WRITE;
/*!40000 ALTER TABLE `student_wishlist` DISABLE KEYS */;
INSERT INTO `student_wishlist` VALUES
(13,1,'2026-03-17 15:22:14'),
(13,2,'2026-03-23 08:42:48'),
(13,4,'2026-03-17 10:29:40'),
(13,38,'2026-03-23 08:57:49'),
(13,51,'2026-03-24 07:39:29');
/*!40000 ALTER TABLE `student_wishlist` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('etudiant','pilote','administrateur') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

SET @OLD_AUTOCOMMIT=@@AUTOCOMMIT, @@AUTOCOMMIT=0;
LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(13,'Dupont','Alice','etudiant@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-12 08:29:34'),
(14,'Martin','Paul','pilote@helpmestage.fr','$2y$12$8wrjS1XbfLM2TJabGA6gI.cTeeuAk1SBKbsv7c4xgQ2EhgSGZBQSK','pilote','2026-03-12 08:29:34'),
(15,'Dupont','Marie','marie.dupont@email.com','$2y$12$3RQCkCeHnBhVPEGjmYhlQp0u9vRXjCHayVsvT8bTA7gzSzc0lcqfpi','etudiant','2026-03-12 08:38:10'),
(16,'Martin','Jean','jean.martin@email.com','$2y$12$3RQCkCeHnBhVPEGjmYhlQp0u9vRXjCHayVsvT8bTA7gzSzc0lcqfpi','etudiant','2026-03-12 08:38:10'),
(17,'Bernard','Sophie','sophie.bernard@email.com','$2y$12$3RQCkCeHnBhVPEGjmYhlQp0u9vRXjCHayVsvT8bTA7gzSzc0lcqfpi','etudiant','2026-03-12 08:38:10'),
(19,'Bernard','Lucas','cpia2.01@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(20,'Dubois','Hugo','cpia2.02@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(21,'Moreau','Nathan','cpia2.03@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(22,'Petit','Enzo','cpia2.04@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(23,'Roux','Ethan','cpia2.05@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(24,'Fournier','Louis','cpia2.06@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(25,'Girard','Mathis','cpia2.07@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(26,'Andree','Noah','cpia2.08@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(27,'Mercier','Tom','cpia2.09@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(28,'Blanc','Adam','cpia2.10@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(29,'Guerin','Léo','cpia2.11@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(30,'Muller','Jules','cpia2.12@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(31,'Henry','Sacha','cpia2.13@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(32,'Rousseau','Yanis','cpia2.14@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(33,'Nicolas','Clément','cpia2.15@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(34,'Robin','Baptiste','cpia2.16@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(35,'Chevalier','Alexis','cpia2.17@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(36,'Lambert','Paul','cpia2.18@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(37,'Bonnet','Rayan','cpia2.19@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(38,'Francois','Maxime','cpia2.20@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(39,'Martinez','Théo','cpia2.21@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(40,'Legrand','Antoine','cpia2.22@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(41,'Garnier','Arthur','cpia2.23@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(42,'Faure','Nolan','cpia2.24@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(43,'Perrin','Gabriel','cpia2.25@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-17 10:27:36'),
(51,'Martin','Lina','cpia1.01@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(52,'Bernard','Hugo','cpia1.02@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(53,'Dubois','Emma','cpia1.03@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(54,'Petit','Lucas','cpia1.04@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(55,'Robert','Chloé','cpia1.05@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(56,'Richard','Nathan','cpia1.06@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(57,'Durand','Jade','cpia1.07@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(58,'Moreau','Noah','cpia1.08@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(59,'Simon','Inès','cpia1.09@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(60,'Laurent','Tom','cpia1.10@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(61,'Lefebvre','Léa','cpia1.11@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(62,'Michel','Ethan','cpia1.12@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(63,'Garcia','Sarah','cpia1.13@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(64,'David','Louis','cpia1.14@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(65,'Bertrand','Camille','cpia1.15@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(66,'Roux','Adam','cpia1.16@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(67,'Vincent','Lou','cpia1.17@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(68,'Fournier','Enzo','cpia1.18@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(69,'Morel','Manon','cpia1.19@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(70,'Girard','Théo','cpia1.20@helpmestage.fr','$2y$12$uobv6TlPfldLhAyzltcOWOd03VfdOAs4tIDeRT8PG9vlK4aT4NWJm','etudiant','2026-03-18 12:45:58'),
(82,'Admin','Principal','admin@helpmestage.fr','$2y$12$eEMi87BBb4vgly/i2CLh6e7U3MiiPcF/3oRSNDm4ue.zThA/2sUHS','administrateur','2026-03-18 14:50:27');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
COMMIT;
SET AUTOCOMMIT=@OLD_AUTOCOMMIT;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-03-24 10:27:01