-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: local
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bookings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `bookdate` datetime NOT NULL,
  `totaltime` int(10) unsigned NOT NULL,
  `status` int(10) unsigned NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` bigint(20) unsigned DEFAULT NULL,
  `service_id` bigint(20) unsigned DEFAULT NULL,
  `promo_id` bigint(20) unsigned DEFAULT NULL,
  `customer_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_room_id_foreign` (`room_id`),
  KEY `bookings_service_id_foreign` (`service_id`),
  KEY `bookings_promo_id_foreign` (`promo_id`),
  KEY `bookings_customer_id_foreign` (`customer_id`),
  CONSTRAINT `bookings_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_promo_id_foreign` FOREIGN KEY (`promo_id`) REFERENCES `promos` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2023-08-14 10:00:00',2,1,'Hola',2,2,NULL,20,'2023-08-12 11:03:50','2023-08-12 15:31:31');
INSERT INTO `bookings` VALUES (2,'2023-08-15 10:00:00',3,1,'hola',2,1,NULL,28,'2023-08-13 01:00:02','2023-08-13 01:00:02');
INSERT INTO `bookings` VALUES (3,'2023-08-18 12:00:00',2,1,'Viene con bateria, trerle un micro adicional',1,3,NULL,70,'2023-08-17 23:24:38','2023-08-17 23:25:05');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'vrestepo@laravel.com','Victor Restepo Colchado','977891359','27989352','Jesus Maria','Pasaje Las Fresas 4692','2003-15-04',NULL,NULL);
INSERT INTO `customers` VALUES (2,'lcolchado@rapid.com','Luis Colchado Santos','997904805','64293007','La Perla','Prolongacion Mirasol 4210','1990-16-08',NULL,NULL);
INSERT INTO `customers` VALUES (3,'festupinan@dev.com','Franco Estupinan Colchado','987267760','35319279','Lima','Calle Fresnos 6149','1990-25-07',NULL,NULL);
INSERT INTO `customers` VALUES (4,'abenitez@gob.com','Alessandro Benitez Colchado','978374848','99585710','San Miguel','Jiron 28 de Julio 6854','1990-17-04',NULL,NULL);
INSERT INTO `customers` VALUES (5,'fmessi@nasa.com','Franco Messi Garcia','999540062','91514902','Pueblo Libre','Jiron Galaxia 2091','1984-27-07',NULL,NULL);
INSERT INTO `customers` VALUES (6,'dmessi@estudio.com','Diana Messi Tragliafico','997362901','15722833','Magdalena','Independencia 28 de Julio 6088','1999-21-06',NULL,NULL);
INSERT INTO `customers` VALUES (7,'sgarcia@dev.com','Silvia Garcia Garcia','979810807','55654826','Jesus Maria','Independencia Huascar 6328','1999-21-06',NULL,NULL);
INSERT INTO `customers` VALUES (8,'jrestepo@gmail.com','Jose Restepo Colchado','997743325','44307462','Lima','Mercado 28 de Julio 9784','2002-13-08',NULL,NULL);
INSERT INTO `customers` VALUES (9,'jrestepo@hotmail.com','Jorge Restepo Estupinan','988195823','43098556','San Miguel','Parque Los Olvidados de Dios 7851','1981-17-02',NULL,NULL);
INSERT INTO `customers` VALUES (10,'atragliafico@amazon.com','Alessandro Tragliafico Lopez','979406712','43496491','Magdalena','Circuito Revolucion 9096','1980-23-09',NULL,NULL);
INSERT INTO `customers` VALUES (11,'lquispe@gmail.com','Lucia Quispe Garcia','988578756','33168475','Jesus Maria','Independencia Los Olvidados de Dios 3966','1989-23-06',NULL,NULL);
INSERT INTO `customers` VALUES (12,'lcolchado@microsoft.com','Lucia Colchado Garcia','989902076','87485851','Lima','Jiron Los Jasmines 4757','1994-28-08',NULL,NULL);
INSERT INTO `customers` VALUES (13,'ltragliafico@dev.com','Lionel Tragliafico Perez','988750218','70438717','San Miguel','Independencia Huascar 1592','1987-14-09',NULL,NULL);
INSERT INTO `customers` VALUES (14,'yrestepo@nasa.com','Yahira Restepo Santos','977452795','92052564','Pueblo Libre','Pasaje Las Fresas 9777','1995-14-05',NULL,NULL);
INSERT INTO `customers` VALUES (15,'yestupinan@eloquent.com','Yahira Estupinan Santos','989732038','50729534','Magdalena','Plaza Independencia 1636','1996-15-04',NULL,NULL);
INSERT INTO `customers` VALUES (16,'vcolchado@gob.com','Victor Colchado Quispe','977763090','54124036','Callao','Independencia Huascar 7983','2001-12-09',NULL,NULL);
INSERT INTO `customers` VALUES (17,'amessi@estudio.com','Alessandro Messi Restepo','987903011','46224760','Surco','Prolongacion Mirasol 9437','1988-12-07',NULL,NULL);
INSERT INTO `customers` VALUES (18,'lestupinan@estudio.com','Lucia Estupinan Quispe','978259055','03715468','Pueblo Libre','Prolongacion Galaxia 2589','1986-13-03',NULL,NULL);
INSERT INTO `customers` VALUES (19,'smessi@dev.com','Silvia Messi Estupinan','979609908','94550247','Jesus Maria','Urbanización Las Fresas 7445','1984-17-01',NULL,NULL);
INSERT INTO `customers` VALUES (20,'agarcia@eloquent.com','Alessandro Garcia Messi','997302240','92008353','Miraflores','Avenida Mirasol 3299','1991-22-06',NULL,NULL);
INSERT INTO `customers` VALUES (21,'mgarcia@amazon.com','Maria Garcia Garcia','978691716','96365255','Lima','Circuito Arica 4096','1994-25-07',NULL,NULL);
INSERT INTO `customers` VALUES (22,'lbenitez@eloquent.com','Lucia Benitez Quispe','979326194','40984558','Jesus Maria','Independencia Los Olvidados de Dios 1677','1989-14-09',NULL,NULL);
INSERT INTO `customers` VALUES (23,'mbenitez@dev.com','Maria Benitez Benitez','977367476','12295856','Pueblo Libre','Urbanización Galaxia 3361','1977-19-04',NULL,NULL);
INSERT INTO `customers` VALUES (24,'mcolchado@dev.com','Maria Colchado Messi','989061684','96560997','Pueblo Libre','Plaza Huascar 3240','1985-10-02',NULL,NULL);
INSERT INTO `customers` VALUES (25,'sperez@eloquent.com','Silvia Perez Tragliafico','988027122','76118582','Surco','Prolongacion Revolucion 5636','1991-10-05',NULL,NULL);
INSERT INTO `customers` VALUES (26,'ltragliafico@amazon.com','Luis Tragliafico Quispe','979386439','76332005','Callao','Mercado Los Jasmines 3389','1999-11-01',NULL,NULL);
INSERT INTO `customers` VALUES (27,'lmessi@gmail.com','Luis Messi Colchado','979237052','65502564','La Perla','Prolongacion Galaxia 4468','1986-13-08',NULL,NULL);
INSERT INTO `customers` VALUES (28,'aestupinan@outlook.com','Alessandro Estupinan Messi','999648109','00708827','Miraflores','Parque Galaxia 4801','2000-26-08',NULL,NULL);
INSERT INTO `customers` VALUES (29,'aquispe@gmail.com','Alessandro Quispe Garcia','979887646','49128233','Magdalena','Pasaje Revolucion 3815','1996-13-08',NULL,NULL);
INSERT INTO `customers` VALUES (30,'lcolchado@estudio.com','Lucia Colchado Lopez','999030047','69434443','Surco','Circuito Los Jasmines 3031','1994-15-01',NULL,NULL);
INSERT INTO `customers` VALUES (31,'vmessi@dev.com','Victor Messi Lopez','979986370','15029909','Jesus Maria','Pasaje Los Jasmines 4090','1982-17-08',NULL,NULL);
INSERT INTO `customers` VALUES (32,'jquispe@gmail.com','Jose Quispe Estupinan','987131274','36778825','Jesus Maria','Independencia Arica 6776','1986-14-08',NULL,NULL);
INSERT INTO `customers` VALUES (33,'jperez@microsoft.com','Jorge Perez Tragliafico','989490530','31950564','Lima','Independencia Galaxia 2313','1981-11-01',NULL,NULL);
INSERT INTO `customers` VALUES (34,'squinones@laravel.com','Silvia Quinones Restepo','989771673','60634267','Pueblo Libre','Pasaje Arica 6014','2003-26-04',NULL,NULL);
INSERT INTO `customers` VALUES (35,'jsantos@nasa.com','Jorge Santos Benitez','999706398','51212112','La Perla','Calle Revolucion 4894','1995-13-09',NULL,NULL);
INSERT INTO `customers` VALUES (36,'ymessi@microsoft.com','Yahira Messi Messi','978707930','77352974','San Miguel','Urbanización Los Jasmines 7821','1976-25-02',NULL,NULL);
INSERT INTO `customers` VALUES (37,'jquispe@gmail.com','Jose Quispe Colchado','989783174','94756253','Jesus Maria','Avenida Huascar 7397','1979-17-02',NULL,NULL);
INSERT INTO `customers` VALUES (38,'lestupinan@dev.com','Lionel Estupinan Tragliafico','978581894','21487476','Jesus Maria','Plaza Batalla 1543','2003-17-09',NULL,NULL);
INSERT INTO `customers` VALUES (39,'fsantos@estudio.com','Franco Santos Benitez','997225208','60533281','Lima','Parque Huascar 4722','2002-28-02',NULL,NULL);
INSERT INTO `customers` VALUES (40,'jquinones@outlook.com','Jose Quinones Messi','989375151','54150157','La Perla','Calle Arica 7982','1979-28-01',NULL,NULL);
INSERT INTO `customers` VALUES (41,'sbenitez@laravel.com','Silvia Benitez Quispe','988592418','78161494','La Perla','Calle Independencia 3812','1983-11-04',NULL,NULL);
INSERT INTO `customers` VALUES (42,'mcolchado@outlook.com','Maria Colchado Estupinan','989714092','91189942','Surco','Prolongacion Los Jasmines 8243','1996-26-06',NULL,NULL);
INSERT INTO `customers` VALUES (43,'frestepo@amazon.com','Franco Restepo Quinones','998459988','15531602','Miraflores','Prolongacion 28 de Julio 3992','1996-20-03',NULL,NULL);
INSERT INTO `customers` VALUES (44,'jmessi@hotmail.com','Jorge Messi Lopez','979209479','56073683','Jesus Maria','Independencia Los Olvidados de Dios 2156','1995-18-03',NULL,NULL);
INSERT INTO `customers` VALUES (45,'ltragliafico@eloquent.com','Lionel Tragliafico Santos','987121812','20218355','Surco','Pasaje Los Olvidados de Dios 5920','1988-23-09',NULL,NULL);
INSERT INTO `customers` VALUES (46,'lcolchado@amazon.com','Luis Colchado Garcia','979315948','32485232','Miraflores','Jiron Los Olvidados de Dios 9789','1994-22-02',NULL,NULL);
INSERT INTO `customers` VALUES (47,'festupinan@hotmail.com','Franco Estupinan Perez','977047627','68473771','Pueblo Libre','Plaza Los Jasmines 7419','1990-18-07',NULL,NULL);
INSERT INTO `customers` VALUES (48,'srestepo@estudio.com','Silvia Restepo Tragliafico','998413670','75985215','San Miguel','Mercado Mirasol 5818','1997-10-01',NULL,NULL);
INSERT INTO `customers` VALUES (49,'vgarcia@laravel.com','Victor Garcia Benitez','987964839','41061852','Miraflores','Asentamiento Humano Los Jasmines 1008','1993-28-01',NULL,NULL);
INSERT INTO `customers` VALUES (50,'vquispe@outlook.com','Victor Quispe Perez','988918824','36211943','Jesus Maria','Asentamiento Humano Los Jasmines 3303','1983-25-03',NULL,NULL);
INSERT INTO `customers` VALUES (51,'yestupinan@nasa.com','Yahira Estupinan Lopez','979618021','82737936','Magdalena','Pasaje Galaxia 5805','1999-15-03',NULL,NULL);
INSERT INTO `customers` VALUES (52,'jcolchado@gmail.com','Jorge Colchado Tragliafico','989591289','95080563','Surco','Parque Independencia 6774','1996-18-04',NULL,NULL);
INSERT INTO `customers` VALUES (53,'lrestepo@dev.com','Lucia Restepo Lopez','978954068','65234107','La Perla','Independencia Mirasol 5839','1980-23-09',NULL,NULL);
INSERT INTO `customers` VALUES (54,'lgarcia@gmail.com','Lucia Garcia Quispe','998670241','57963697','San Miguel','Mercado 28 de Julio 3052','2001-14-04',NULL,NULL);
INSERT INTO `customers` VALUES (55,'lestupinan@laravel.com','Lionel Estupinan Perez','977223263','65178156','Magdalena','Parque 28 de Julio 1135','2003-19-03',NULL,NULL);
INSERT INTO `customers` VALUES (56,'asantos@gmail.com','Alessandro Santos Lopez','977881709','46045302','San Miguel','Parque Galaxia 8334','1994-25-08',NULL,NULL);
INSERT INTO `customers` VALUES (57,'festupinan@eloquent.com','Franco Estupinan Perez','989472715','96410627','Pueblo Libre','Plaza Revolucion 3732','2002-24-08',NULL,NULL);
INSERT INTO `customers` VALUES (58,'jlopez@hotmail.com','Jorge Lopez Quinones','997904144','01983756','Pueblo Libre','Urbanización Batalla 2130','1979-25-02',NULL,NULL);
INSERT INTO `customers` VALUES (59,'lbenitez@amazon.com','Lucia Benitez Santos','989297552','98674499','La Perla','Pasaje Revolucion 2332','1979-12-04',NULL,NULL);
INSERT INTO `customers` VALUES (60,'fperez@gob.com','Franco Perez Restepo','987419290','42521911','Surco','Prolongacion Arica 3791','1982-25-04',NULL,NULL);
INSERT INTO `customers` VALUES (61,'jestupinan@laravel.com','Jorge Estupinan Messi','998879641','08184209','San Miguel','Mercado Mirasol 1731','1986-17-03',NULL,NULL);
INSERT INTO `customers` VALUES (62,'frestepo@hotmail.com','Franco Restepo Garcia','998549460','52063282','Lima','Plaza Revolucion 5582','1984-20-09',NULL,NULL);
INSERT INTO `customers` VALUES (63,'vlopez@estudio.com','Victor Lopez Restepo','997450153','25673707','Lima','Circuito Batalla 6792','1989-10-06',NULL,NULL);
INSERT INTO `customers` VALUES (64,'lquispe@gob.com','Lionel Quispe Santos','999036729','71578938','Magdalena','Avenida Las Fresas 1240','2003-12-09',NULL,NULL);
INSERT INTO `customers` VALUES (65,'fgarcia@amazon.com','Franco Garcia Restepo','998392531','14412942','San Miguel','Circuito Batalla 4070','2000-14-07',NULL,NULL);
INSERT INTO `customers` VALUES (66,'mrestepo@eloquent.com','Maria Restepo Messi','989468527','54251592','La Perla','Plaza Batalla 8456','1986-24-03',NULL,NULL);
INSERT INTO `customers` VALUES (67,'lrestepo@gob.com','Lionel Restepo Lopez','988417004','29201563','Surco','Independencia Revolucion 1951','1990-19-09',NULL,NULL);
INSERT INTO `customers` VALUES (68,'aestupinan@rapid.com','Alessandro Estupinan Lopez','997887257','39977093','San Miguel','Plaza Huascar 9229','1995-16-09',NULL,NULL);
INSERT INTO `customers` VALUES (69,'dtragliafico@nasa.com','Diana Tragliafico Benitez','998823942','37533259','Jesus Maria','Calle Huascar 1462','1988-16-08',NULL,NULL);
INSERT INTO `customers` VALUES (70,'fbenitez@dev.com','Franco Benitez Perez','987269339','78986422','Magdalena','Mercado Huascar 8894','1978-23-04',NULL,NULL);
INSERT INTO `customers` VALUES (71,'smessi@gob.com','Silvia Messi Perez','978432069','68192566','La Perla','Avenida Los Olvidados de Dios 6841','1984-17-04',NULL,NULL);
INSERT INTO `customers` VALUES (72,'dquispe@rapid.com','Diana Quispe Tragliafico','977730227','79484478','Pueblo Libre','Urbanización Huascar 5826','1979-15-01',NULL,NULL);
INSERT INTO `customers` VALUES (73,'lbenitez@dev.com','Lionel Benitez Lopez','997574651','14650130','Lima','Asentamiento Humano Fresnos 4337','2002-20-07',NULL,NULL);
INSERT INTO `customers` VALUES (74,'lbenitez@gmail.com','Lionel Benitez Messi','979922513','42211628','Callao','Avenida Los Olvidados de Dios 6778','1989-22-05',NULL,NULL);
INSERT INTO `customers` VALUES (75,'jperez@microsoft.com','Jorge Perez Perez','989787972','23559903','San Miguel','Independencia Fresnos 5680','1980-13-05',NULL,NULL);
INSERT INTO `customers` VALUES (76,'dperez@microsoft.com','Diana Perez Garcia','999766001','37487121','Miraflores','Circuito Independencia 6121','1984-14-05',NULL,NULL);
INSERT INTO `customers` VALUES (77,'drestepo@estudio.com','Diana Restepo Garcia','977243679','59039420','Callao','Pasaje Los Jasmines 7526','1991-17-03',NULL,NULL);
INSERT INTO `customers` VALUES (78,'dquispe@hotmail.com','Diana Quispe Lopez','997173603','24329808','Callao','Prolongacion Los Olvidados de Dios 6892','1987-26-09',NULL,NULL);
INSERT INTO `customers` VALUES (79,'llopez@amazon.com','Lucia Lopez Quispe','989344895','92853270','Lima','Urbanización Revolucion 1900','1988-17-04',NULL,NULL);
INSERT INTO `customers` VALUES (80,'yquispe@gmail.com','Yahira Quispe Garcia','979198088','35741251','Jesus Maria','Mercado Arica 9773','1990-18-03',NULL,NULL);
INSERT INTO `customers` VALUES (81,'dcolchado@nasa.com','Diana Colchado Estupinan','999848216','80419291','San Miguel','Plaza Arica 3063','1983-24-08',NULL,NULL);
INSERT INTO `customers` VALUES (82,'ltragliafico@rapid.com','Lionel Tragliafico Benitez','989622595','27223178','La Perla','Asentamiento Humano Fresnos 4926','2001-19-05',NULL,NULL);
INSERT INTO `customers` VALUES (83,'jgarcia@hotmail.com','Jose Garcia Restepo','988558666','16861448','Miraflores','Jiron Los Olvidados de Dios 1277','1996-20-09',NULL,NULL);
INSERT INTO `customers` VALUES (84,'dlopez@estudio.com','Diana Lopez Messi','999279588','19358248','La Perla','Independencia Las Fresas 1259','1979-10-01',NULL,NULL);
INSERT INTO `customers` VALUES (85,'lestupinan@rapid.com','Luis Estupinan Quinones','987023941','24875818','Miraflores','Prolongacion Los Jasmines 1759','1989-14-03',NULL,NULL);
INSERT INTO `customers` VALUES (86,'lgarcia@laravel.com','Lucia Garcia Messi','989126313','77307374','Jesus Maria','Parque Galaxia 8223','1994-21-08',NULL,NULL);
INSERT INTO `customers` VALUES (87,'squispe@outlook.com','Silvia Quispe Colchado','979185376','11235702','Callao','Independencia Los Olvidados de Dios 9918','1993-11-09',NULL,NULL);
INSERT INTO `customers` VALUES (88,'lrestepo@laravel.com','Lionel Restepo Benitez','997652009','72306322','Surco','Avenida Los Olvidados de Dios 3881','1983-16-09',NULL,NULL);
INSERT INTO `customers` VALUES (89,'jperez@gmail.com','Jose Perez Lopez','998582016','31979714','Magdalena','Jiron Galaxia 5499','1982-14-03',NULL,NULL);
INSERT INTO `customers` VALUES (90,'smessi@outlook.com','Silvia Messi Santos','977349468','30611557','Magdalena','Prolongacion Fresnos 7996','1978-26-02',NULL,NULL);
INSERT INTO `customers` VALUES (91,'festupinan@gmail.com','Franco Estupinan Estupinan','998344528','60469588','Magdalena','Asentamiento Humano Los Jasmines 9690','1990-24-03',NULL,NULL);
INSERT INTO `customers` VALUES (92,'mtragliafico@rapid.com','Maria Tragliafico Restepo','987538795','84060712','La Perla','Prolongacion Huascar 3066','1978-11-04',NULL,NULL);
INSERT INTO `customers` VALUES (93,'llopez@outlook.com','Lionel Lopez Restepo','988775473','99545383','La Perla','Jiron Los Jasmines 9756','1994-28-05',NULL,NULL);
INSERT INTO `customers` VALUES (94,'jbenitez@outlook.com','Jose Benitez Colchado','978332268','25040319','Surco','Pasaje Arica 2849','2002-15-06',NULL,NULL);
INSERT INTO `customers` VALUES (95,'fcolchado@rapid.com','Franco Colchado Colchado','978563720','50392440','Miraflores','Plaza Batalla 5730','1994-20-08',NULL,NULL);
INSERT INTO `customers` VALUES (96,'vperez@hotmail.com','Victor Perez Santos','999568633','58605705','San Miguel','Avenida Las Fresas 9089','2001-12-02',NULL,NULL);
INSERT INTO `customers` VALUES (97,'fquispe@laravel.com','Franco Quispe Quispe','979506664','70800639','La Perla','Prolongacion Mirasol 1706','1979-16-05',NULL,NULL);
INSERT INTO `customers` VALUES (98,'msantos@hotmail.com','Maria Santos Benitez','998721444','50287415','Magdalena','Pasaje Mirasol 8361','1996-22-01',NULL,NULL);
INSERT INTO `customers` VALUES (99,'lcolchado@outlook.com','Lucia Colchado Benitez','977494908','25670964','San Miguel','Asentamiento Humano Galaxia 9618','1984-24-01',NULL,NULL);
INSERT INTO `customers` VALUES (100,'agarcia@estudio.com','Alessandro Garcia Colchado','979804335','24000061','Pueblo Libre','Plaza Huascar 7394','1998-21-01',NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1);
INSERT INTO `migrations` VALUES (2,'2014_10_12_100000_create_password_reset_tokens_table',1);
INSERT INTO `migrations` VALUES (3,'2019_08_19_000000_create_failed_jobs_table',1);
INSERT INTO `migrations` VALUES (4,'2019_12_14_000001_create_personal_access_tokens_table',1);
INSERT INTO `migrations` VALUES (5,'2023_08_11_015613_create_customers_table',1);
INSERT INTO `migrations` VALUES (6,'2023_08_11_015701_create_rooms_table',1);
INSERT INTO `migrations` VALUES (7,'2023_08_11_015710_create_promos_table',1);
INSERT INTO `migrations` VALUES (8,'2023_08_11_015715_create_services_table',1);
INSERT INTO `migrations` VALUES (9,'2023_08_11_016000_create_bookings_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promos`
--

DROP TABLE IF EXISTS `promos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `promos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `promocode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `datebegin` datetime NOT NULL,
  `dateend` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `available` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promos`
--

LOCK TABLES `promos` WRITE;
/*!40000 ALTER TABLE `promos` DISABLE KEYS */;
/*!40000 ALTER TABLE `promos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `available` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Sala A',1,NULL,NULL);
INSERT INTO `rooms` VALUES (2,'Sala B',1,NULL,NULL);
INSERT INTO `rooms` VALUES (3,'Sala C',1,NULL,NULL);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `services` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `available` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Estudio de Grabacion',25,1,NULL,NULL);
INSERT INTO `services` VALUES (2,'Sala de Ensayo',25,1,NULL,NULL);
INSERT INTO `services` VALUES (3,'Prueba de sonido',10,1,'2023-08-17 23:18:30','2023-08-17 23:18:30');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin@estudio.com',NULL,'$2y$10$.y5NJqu1mUMUAwcjZraZS.uZgmQtRN.QrEX1kShVMOyAmunmRWFmK','60WLM5086MbVTLCziQDX99KtYl0m7Q6kSlkKGwNw8zzklj5LoYx4pTDEKk5n','2023-08-12 11:02:41','2023-08-12 11:02:41');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-17 13:32:34
