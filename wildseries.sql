-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: wild-series
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'Andrew Lincoln'),(2,'Norman Reedus'),(3,'Lauren Cohan'),(4,'Danai Gurira'),(5,'Danai Gurira');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_program`
--

DROP TABLE IF EXISTS `actor_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_program` (
  `actor_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  PRIMARY KEY (`actor_id`,`program_id`),
  KEY `IDX_B01827EE10DAF24A` (`actor_id`),
  KEY `IDX_B01827EE3EB8070A` (`program_id`),
  CONSTRAINT `FK_B01827EE10DAF24A` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B01827EE3EB8070A` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_program`
--

LOCK TABLES `actor_program` WRITE;
/*!40000 ALTER TABLE `actor_program` DISABLE KEYS */;
INSERT INTO `actor_program` VALUES (1,1),(1,2),(2,3),(3,3),(4,3);
/*!40000 ALTER TABLE `actor_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Fantastique'),(2,'Horror'),(5,'azertyu'),(6,'xcvg'),(7,'Animation'),(8,'Drame');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `season_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` int(11) NOT NULL,
  `synopsis` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DDAA1CDA4EC001D1` (`season_id`),
  CONSTRAINT `FK_DDAA1CDA4EC001D1` FOREIGN KEY (`season_id`) REFERENCES `season` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,1,'Winter Is Coming',1,'Eddard Stark is torn between his family and an old friend when asked to serve at the side of King Robert Baratheon; Viserys plans to wed his sister to a nomadic warlord in exchange for an army. '),(2,1,'The Kingsroad',2,'While Bran recovers from his fall, Ned takes only his daughters to King\'s Landing. Jon Snow goes with his uncle Benjen to the Wall. Tyrion joins them. '),(3,1,'Lord Snow',3,'Jon begins his training with the Night\'s Watch; Ned confronts his past and future at King\'s Landing; Daenerys finds herself at odds with Viserys. '),(4,2,'The North Remembers',1,'Tyrion arrives at King\'s Landing to take his father\'s place as Hand of the King. Stannis Baratheon plans to take the Iron Throne for his own. Robb tries to decide his next move in the war. The Night\'s Watch arrive at the house of Craster. '),(5,2,'The Night Lands',2,'Arya makes friends with Gendry. Tyrion tries to take control of the Small Council. Theon arrives at his home, Pyke, in order to persuade his father into helping Robb with the war. Jon tries to investigate Craster\'s secret. '),(6,2,'What Is Dead May Never Die',3,'Tyrion tries to see who he can trust in the Small Council. Catelyn visits Renly to try and persuade him to join Robb in the war. Theon must decide if his loyalties lie with his own family or with Robb. '),(7,3,'Days Gone Bye',1,'Deputy Sheriff Rick Grimes awakens from a coma, and searches for his family in a world ravaged by the undead. '),(8,3,'Guts',2,'In Atlanta, Rick is rescued by a group of survivors, but they soon find themselves trapped inside a department store surrounded by walkers. '),(9,3,'Tell It to the Frogs',3,'Rick is reunited with Lori and Carl but soon decides - along with some of the other survivors - to return to the rooftop and rescue Merle. Meanwhile, tensions run high between the other survivors at the camp.'),(10,4,'What Lies Ahead',1,'The group\'s plan to head for Fort Benning is put on hold when Sophia goes missing.'),(11,4,'Bloodletting',2,'After Carl is accidentally shot, the group are brought to a family living on a nearby farm. Shane makes a dangerous trip in search of medical supplies. '),(12,4,'Save the Last One',3,'As Carl\'s condition continues to deteriorate, Shane and Otis try to dodge the walkers as they head back to the farm. '),(13,6,'L\'alchimiste Fullmetal',1,'Le colonel Roy Mustang est chargé de retrouver Isaac, un ancien alchimiste d\'état qui a déserté et qui veut s\'emparer de Central'),(14,6,'Le premier jour',2,'Alors que le train qu\'ils ont pris les emmène à Liore, les frères Elric se remémorent les évènements qui les ont amenés à rejoindre l\'armée'),(15,8,'Le départ',1,'Sacha obtient Pikachu, le dernier Pokémon restant au labo. C\'est le début de l\'aventure ! Ils rencontrent Ondine à la fin de l\'épisode.'),(16,8,'Pokémon aux urgences',2,'Sacha arrive à Jadielle.\r\n\r\nOn rencontre pour la première fois l\'agent Jenny, l\'infirmière Joëlle et la Team Rocket.'),(17,9,'Y a-t-il un pilote dans le dirigeable ?',82,'Nos trois héros, Sacha, Ondine et Pierre sont en route pour l\'Île de Valencia. Ils font une halte pour faire le plein de provisions et décider de la route à emprunter.'),(18,9,'Le danger Poké Ball',83,'Après maintes péripéties, nos trois héros, Sacha, Ondine et Pierre, arrivent sur l\'Île de Valencia dans l\'archipel Orange.'),(19,9,'Pokémon en détresse',84,'Nous retrouvons, Ondine et Sacha emprisonnés et endormis dans le zeppelin de la Team Rocket.'),(20,10,'Le crime ne paie pas',117,'Alors qu\'ils étaient perdus dans une forêt de Johto, Sacha et ses amis découvrent un Pokémon sur un lac qui s\'enfuit. Sans le savoir, ils viennent de rencontrer un Suicune le fauve légendaire aqueux.'),(21,10,'Leçon de base-ball',118,'Sur la route de Mauville, Sacha, Pierre et Ondine rencontrent une toute nouvelle dresseuse, Cathy. Cette dernière était en train de combattre puis capturer un Rattata à l\'aide de son Germignon.'),(22,11,'Peccato originale',1,'La mort du patriarche est un coup terrible pour le clan Médicis. Lorsque son héritier et successeur, Cosimo, découvre que son père a été empoisonné, il décide de garder l’information pour lui et charge son fidèle ami Marco Bello de remonter la piste de l’assassin.'),(23,11,'La cupola e la dimora',1,'La guerre contre Milan plonge Florence dans le chaos. Piero, fils unique de Cosimo, rêve de partir au combat malgré les protestations de son épouse Lucrezia, qui tente de le retenir.');
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES ('20191129143924','2019-11-29 14:40:47'),('20191129150633','2019-11-29 15:07:21'),('20191203092200','2019-12-03 09:23:57'),('20191203092443','2019-12-03 09:24:49'),('20191203092857','2019-12-03 09:29:04'),('20191203094044','2019-12-03 09:41:09'),('20191203094200','2019-12-03 09:42:16'),('20191203094439','2019-12-03 09:45:00'),('20191203135408','2019-12-03 13:54:22'),('20191212143750','2019-12-12 14:42:45');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `synopsis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_92ED778412469DE2` (`category_id`),
  CONSTRAINT `FK_92ED778412469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program`
--

LOCK TABLES `program` WRITE;
/*!40000 ALTER TABLE `program` DISABLE KEYS */;
INSERT INTO `program` VALUES (1,1,'Game Of Thrones','https://m.media-amazon.com/images/M/MV5BMjA5NzA5NjMwNl5BMl5BanBnXkFtZTgwNjg2OTk2NzM@._V1_SY1000_CR0,0,674,1000_AL_.jpg','United States',2011,'Nine noble families fight for control over the mythical lands of Westeros, while an ancient enemy returns after being dormant for thousands of years. '),(2,1,'Lucifer','https://media.senscritique.com/media/000016256107/source_big/Lucifer.jpg','United States',2016,'Lassé et fatigué d\'être le Seigneur des Enfers, Lucifer Morningstar abandonne son royaume et s\'en va à Los Angeles où il est propriétaire d\'une boîte de nuit appelée Lux. Lucifer a reçu le don de contraindre les gens à révéler leurs désirs les plus profon'),(3,2,'The Walking Dead','https://m.media-amazon.com/images/M/MV5BYWY4ODJiZjMtNWMxYi00ZmM5LWIwZmQtZWY0MjJmZGU5MjcxXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SY1000_CR0,0,675,1000_AL_.jpg','United States',2010,'Sheriff Deputy Rick Grimes wakes up from a coma to learn the world is in ruins, and must lead a group of survivors to stay alive. '),(4,2,'The Haunting Of Hill House','https://m.media-amazon.com/images/M/MV5BMTU4NzA4MDEwNF5BMl5BanBnXkFtZTgwMTQxODYzNjM@._V1_SY1000_CR0,0,674,1000_AL_.jpg','United States',2018,'Plusieurs frères et sœurs qui, enfants, ont grandi dans la demeure qui allait devenir la maison hantée la plus célèbre des États-Unis, sont contraints de se réunir pour finalement affronter les fantômes de leur passé.'),(5,2,'American Horror Story','https://m.media-amazon.com/images/M/MV5BODZlYzc2ODYtYmQyZS00ZTM4LTk4ZDQtMTMyZDdhMDgzZTU0XkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_SY1000_CR0,0,666,1000_AL_.jpg','United States',2011,'A chaque saison, son histoire. American Horror Story nous embarque dans des récits à la fois poignants et cauchemardesques, mêlant la peur, le gore et le politiquement correct.'),(6,2,'Love Death And Robots','https://m.media-amazon.com/images/M/MV5BMTc1MjIyNDI3Nl5BMl5BanBnXkFtZTgwMjQ1OTI0NzM@._V1_SY1000_CR0,0,674,1000_AL_.jpg','United States',2019,'Un yaourt susceptible, des soldats lycanthropes, des robots déchaînés, des monstres-poubelles, des chasseurs de primes cyborgs, des araignées extraterrestres et des démons assoiffés de sang : tout ce beau monde est réuni dans 18 courts métrages animés déc'),(7,2,'Penny Dreadful','https://m.media-amazon.com/images/M/MV5BNmE5MDE0ZmMtY2I5Mi00Y2RjLWJlYjMtODkxODQ5OWY1ODdkXkEyXkFqcGdeQXVyNjU2NjA5NjM@._V1_SY1000_CR0,0,695,1000_AL_.jpg','United States',2014,'Dans le Londres ancien, Vanessa Ives, une jeune femme puissante aux pouvoirs hypnotiques, allie ses forces à celles de Ethan, un garçon rebelle et violent aux allures de cowboy, et de Sir Malcolm, un vieil homme riche aux ressources inépuisables. Ensemble'),(8,2,'Fear The Walking Dead','https://m.media-amazon.com/images/M/MV5BYWNmY2Y1NTgtYTExMS00NGUxLWIxYWQtMjU4MjNkZjZlZjQ3XkEyXkFqcGdeQXVyMzQ2MDI5NjU@._V1_SY1000_CR0,0,666,1000_AL_.jpg','United States',2014,'La série se déroule au tout début de l épidémie relatée dans la série mère The Walking Dead et se passe dans la ville de Los Angeles, et non à Atlanta. Madison est conseillère dans un lycée de Los Angeles. Depuis la mort de son mari, elle élève seule ses '),(9,1,'Fullmetal Alchemist: Brotherhood','https://www.imdb.com/title/tt1355642/mediaviewer/rm4007074048','japon',2012,'Pour toute chose reçue, il faut en abandonner une autre de même valeur en retour. Les deux frères Elric partent à la recherche de la « pierre philosophale » car celle-ci ignore ce principe et cela leur permettra de récupérer leur corps d\'origine.'),(10,7,'Pokemon','https://en.wikipedia.org/wiki/List_of_Pok%C3%A9mon:_Indigo_League_episodes#/media/File:Pokemonseason1DVDBoxSet.jpg','Japon',1997,'La série d\'animation Pokémon suit les aventures d\'un jeune garçon nommé Sacha (Satoshi au Japon et Ash dans les pays anglophones) et de son fidèle Pokémon Pikachu.'),(11,8,'I Medici','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUSEhMWFRUXFxgVGBcVEhUXFxUVFxgXFhUXGBgYHSggGBolHRcXITEhJSkrLi4uGB8zODMsNygtLisBCgoKDg0OGhAQGi0lHx0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLTUrLS0tLS0tK//AABEIARQAtwMBIgACEQEDEQH/','Italie',2016,'L’ascension de la famille Médicis, de simples commerçants aux banquiers et hommes politiques puissants qui ont déclenché une révolution économique et culturelle dans la Renaissance italienneaux XIVe et XVe siècles.');
/*!40000 ALTER TABLE `program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F0E45BA93EB8070A` (`program_id`),
  CONSTRAINT `FK_F0E45BA93EB8070A` FOREIGN KEY (`program_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,1,1,2011,'The first season of the fantasy drama television series Game of Thrones premiered on HBO on April 17, 2011 in the U.S. and concluded on June 19, 2011. It consists of ten episodes, each of approximately 55 minutes. The series is based on A Game of Thrones, the first novel in the A Song of Ice and Fire series by George R. R. Martin, adapted for television by David Benioff and D. B. Weiss. HBO had ordered a television pilot in November 2008; filming began the following year. However, it was deemed unsatisfactory and later reshot with some roles recast. In March 2010, HBO ordered the first season, which began filming in July 2010, primarily in Belfast, Northern Ireland, with additional filming in Malta. '),(2,1,2,2012,'The second season of the fantasy drama television series Game of Thrones premiered in the United States on HBO on April 1, 2012, and concluded on June 3, 2012. It was broadcast on Sunday at 9:00 pm in the United States, consisting of 10 episodes, each running approximately 50–60 minutes. The season mostly covers the events of A Clash of Kings, the second novel of the A Song of Ice and Fire series by George R. R. Martin, adapted for television by David Benioff and D. B. Weiss. HBO ordered the second season on April 19, 2011, which began filming in July 2011, primarily in Ireland, Northern Ireland, Croatia and Iceland. '),(3,2,1,2010,'Sheriff\'s deputy Rick Grimes wakes from a coma discovering a world overrun by zombies. After befriending Morgan Jones, Rick travels alone to Atlanta to find his wife Lori, his son, Carl, and his police partner and best friend, Shane Walsh, encountering other survivors. The group travels to the Centers for Disease Control (CDC), but find from the sole remaining CDC member that no cure exists for the epidemic.'),(4,2,2,2011,'Traveling from Atlanta, Rick\'s group takes shelter at Hershel Greene\'s farm while they search for Carol\'s missing daughter, Sophia. Tension between the survivors worsen after it is discovered that Hershel has kept friends and family turned into zombies, including Sophia, in his barn. Rick learns that Shane and Lori were romantically involved at the outset of the apocalypse, and Shane and Rick\'s friendship becomes increasingly unhinged when Lori reveals that she is pregnant. Rick is eventually forced to kill Shane in self-defense. The noise draws zombies, forcing Rick\'s group and Hershel\'s surviving family to evacuate the farm.'),(5,2,2,2014,'Lucifer, qui a décidé de prendre congés de son royaume des enfers, arrive sur Terre. Il est devenu propriétaire d\'une boîte de nuit nommé le Lux et se fait appeler Lucifer Morningstar. C\'est un séducteur. L\'une de ses conquêtes, Delilah, arrive au Lux pour le retrouver, mais se fait tuer. Lucifer décide d\'enquêter. C\'est ainsi qu\'il fait la connaissance de Chloe Decker, lieutenant enquêtant sur la mort de Delilah. Il va vite s\'apercevoir qu\'avec elle, son charme n\'est pas si opérant. De ce fait, il va tout faire pour comprendre pourquoi il ne peut la séduire aussi facilement qu\'une autre femme, allant jusqu\'à devenir son coéquipier au sein de la police, lors de ses enquêtes.'),(6,9,1,2012,'Les deux frères Elric partent à la recherche de la « pierre philosophale » car celle-ci ignore ce principe et cela leur permettra de récupérer leur corps d\'origine.'),(8,10,1,1997,'La série d\'animation Pokémon suit les aventures d\'un jeune garçon nommé Sacha (Satoshi au Japon et Ash dans les pays anglophones) et de son fidèle Pokémon Pikachu.'),(9,10,2,1999,'De retour au Bourg Palette après sa participation à la Ligue Indigo, Sacha se voit demander par le Professeur Chen d\'amener la GS Ball au Professeur Flora. Il se rend donc dans l\'Archipel Orange, où se trouve le Professeur en question.'),(10,10,3,1999,'Après avoir gagné le combat contre Sacha, Régis part pour la région de Johto, à l\'ouest. Le perdant, Sacha, apprenant la décision de son rival de toujours, part lui aussi pour la région de Johto pour y gagner la ligue Pokémon.'),(11,11,1,2016,'L’ascension de la famille Médicis, de simples commerçants aux banquiers et hommes politiques puissants qui ont déclenché une révolution économique et culturelle dans la Renaissance italienne');
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-13 16:13:32
