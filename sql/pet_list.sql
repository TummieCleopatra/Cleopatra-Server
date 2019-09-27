-- phpMyAdmin SQL Dump
-- version 3.3.8
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- G�n�r� le : Sam 25 Juin 2011 � 10:09
-- Version du serveur: 6.0.0
-- Version de PHP: 5.2.9-2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de donn�es: `dspdb`
--

-- --------------------------------------------------------

--
-- Structure de la table `pet_list`
--

DROP TABLE IF EXISTS `pet_list`;
CREATE TABLE IF NOT EXISTS `pet_list` (
  `petid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `poolid` int(10) unsigned NOT NULL DEFAULT '0',
  `minLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `maxLevel` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `element` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`petid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `pet_list`
--

INSERT INTO `pet_list` VALUES (0, 'FireSpirit', 5830, 1, 99, 0, 1);
INSERT INTO `pet_list` VALUES (1, 'IceSpirit', 5831, 1, 99, 0, 5);
INSERT INTO `pet_list` VALUES (2, 'AirSpirit', 5832, 1, 99, 0, 4);
INSERT INTO `pet_list` VALUES (3, 'EarthSpirit', 5833, 1, 99, 0, 2);
INSERT INTO `pet_list` VALUES (4, 'ThunderSpirit', 5834, 1, 99, 0, 6);
INSERT INTO `pet_list` VALUES (5, 'WaterSpirit', 5835, 1, 99, 0, 3);
INSERT INTO `pet_list` VALUES (6, 'LightSpirit', 5836, 1, 99, 0, 7);
INSERT INTO `pet_list` VALUES (7, 'DarkSpirit', 5837, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (8, 'Carbuncle', 4588, 1, 99, 0, 7);
INSERT INTO `pet_list` VALUES (9, 'Fenrir', 4581, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (10, 'Ifrit', 4582, 1, 99, 0, 1);
INSERT INTO `pet_list` VALUES (11, 'Titan', 4583, 1, 99, 0, 2);
INSERT INTO `pet_list` VALUES (12, 'Leviathan', 4584, 1, 99, 0, 3);
INSERT INTO `pet_list` VALUES (13, 'Garuda', 4585, 1, 99, 0, 4);
INSERT INTO `pet_list` VALUES (14, 'Shiva', 4586, 1, 99, 0, 5);
INSERT INTO `pet_list` VALUES (15, 'Ramuh', 4587, 1, 99, 0, 6);
INSERT INTO `pet_list` VALUES (16, 'Diabolos', 4590, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (17, 'Alexander', 4589, 1, 99, 0, 7);
INSERT INTO `pet_list` VALUES (18, 'Odin', 4591, 1, 99, 0, 8);
INSERT INTO `pet_list` VALUES (19, 'Atomos', 1, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (20, 'CaitSith', 1, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (21, 'SheepFamiliar', 4598, 23, 35, 3600, 0);
INSERT INTO `pet_list` VALUES (22, 'HareFamiliar', 4641, 23, 35, 5400, 0);
INSERT INTO `pet_list` VALUES (23, 'CrabFamiliar', 4610, 23, 55, 1800, 0);
INSERT INTO `pet_list` VALUES (24, 'CourierCarrie', 4611, 23, 75, 1800, 0);
INSERT INTO `pet_list` VALUES (25, 'Homunculus', 4616, 23, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (26, 'FlytrapFamiliar', 4619, 28, 40, 3600, 0);
INSERT INTO `pet_list` VALUES (27, 'TigerFamiliar', 4604, 28, 40, 3600, 0);
INSERT INTO `pet_list` VALUES (28, 'FlowerpotBill', 4602, 28, 40, 3600, 0);
INSERT INTO `pet_list` VALUES (29, 'EftFamiliar', 4621, 33, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (30, 'LizardFamiliar', 4600, 33, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (31, 'MayflyFamiliar', 4596, 33, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (32, 'FunguarFamiliar', 4614, 33, 65, 3600, 0);
INSERT INTO `pet_list` VALUES (33, 'BeetleFamiliar', 4606, 38, 45, 3600, 0);
INSERT INTO `pet_list` VALUES (34, 'AntlionFamiliar', 4625, 38, 50, 3600, 0);
INSERT INTO `pet_list` VALUES (35, 'MiteFamiliar', 4623, 43, 55, 3600, 0);
INSERT INTO `pet_list` VALUES (36, 'LullabyMelodia', 4599, 43, 55, 3600, 0);
INSERT INTO `pet_list` VALUES (37, 'KeenearedSteffi', 4595, 43, 55, 5400, 0);
INSERT INTO `pet_list` VALUES (38, 'FlowerpotBen', 4603, 51, 63, 3600, 0);
INSERT INTO `pet_list` VALUES (39, 'SaberSiravarde', 4605, 51, 63, 3600, 0);
INSERT INTO `pet_list` VALUES (40, 'ColdbloodComo', 4601, 53, 65, 3600, 0);
INSERT INTO `pet_list` VALUES (41, 'ShellbusterOrob', 4597, 53, 65, 3600, 0);
INSERT INTO `pet_list` VALUES (42, 'VoraciousAudrey', 4620, 53, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (43, 'AmbusherAllie', 4622, 58, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (44, 'LifedrinkerLars', 4624, 63, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (45, 'PanzerGalahad', 4607, 63, 75, 3600, 0);
INSERT INTO `pet_list` VALUES (46, 'ChopsueyChucky', 4626, 63, 85, 1800, 0);
INSERT INTO `pet_list` VALUES (47, 'AmigoSabotender', 4618, 75, 85, 1200, 0);
INSERT INTO `pet_list` VALUES (48, 'Wyvern', 5551, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (49, 'Crafty Clyvonne', 4608, 76, 90, 7200, 0);
INSERT INTO `pet_list` VALUES (50, 'Bloodclaw Shasr', 4609, 90, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (51, 'Lucky Lulush', 4612, 76, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (52, 'Fatso Fargann', 4613, 81, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (53, 'Discreet Louise', 4615, 79, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (54, 'Swift Sieghard', 4617, 86, 94, 7200, 0);
INSERT INTO `pet_list` VALUES (55, 'Dipper Yuly', 4627, 76, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (56, 'Flowerpot Merle', 4628, 76, 99, 10800, 0);
INSERT INTO `pet_list` VALUES (57, 'Nursery Nazuna', 4629, 76, 86, 7200, 0);
INSERT INTO `pet_list` VALUES (58, 'Mailbuster Ceta', 4630, 85, 95, 7200, 0);
INSERT INTO `pet_list` VALUES (59, 'Audacious Anna', 4631, 85, 95, 7200, 0);
INSERT INTO `pet_list` VALUES (60, 'Presto Julio', 4632, 83, 93, 7200, 0);
INSERT INTO `pet_list` VALUES (61, 'Bugeyed Broncha', 4633, 90, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (62, 'Gooey Gerard', 4634, 95, 99, 5400, 0);
INSERT INTO `pet_list` VALUES (63, 'Gorefang Hobs', 4635, 93, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (64, 'Faithful Falcor', 4636, 86, 99, 5400, 0);
INSERT INTO `pet_list` VALUES (65, 'Crude Raphie', 4637, 96, 99, 5400, 0);
INSERT INTO `pet_list` VALUES (66, 'Dapper Mac', 4638, 76, 99, 7200, 0);
INSERT INTO `pet_list` VALUES (67, 'Slippery Silas', 4639, 23, 99, 1800, 0);
INSERT INTO `pet_list` VALUES (68, 'Turbid Toloi', 4640, 23, 99, 3600, 0);
INSERT INTO `pet_list` VALUES (69, 'HarlequinFrame', 5124, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (70, 'ValoredgeFrame', 5125, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (71, 'SharpshotFrame', 5126, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (72, 'StormwakerFrame', 5127, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (73, 'AdventuringFellow', 5127, 1, 99, 0, 0);
-- 74 is Chocobo in the enum..

INSERT INTO `pet_list` VALUES (74, 'AdventuringFellow', 5127, 1, 99, 0, 0);
-- trusts.. TODO: Make trusts not use petlist at all.
INSERT INTO `pet_list` VALUES (75, 'Luopan', 6020, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (76, 'Auroral Alicorn', 7000, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (77, 'Dark Ixion', 7001, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (78, 'Bismark', 7002, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (79, 'Siren', 7003, 1, 99, 0, 0);  -- 2451
INSERT INTO `pet_list` VALUES (80, 'Pheonix', 7004, 1, 99, 0, 0);  -- 2467
INSERT INTO `pet_list` VALUES (81, 'Bahamut', 7005, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (82, 'Kupipi', 7006, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (83, 'Kupipi-W', 7007, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (84, 'Kupipi-R', 7008, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (85, 'Ayame', 7009, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (86, 'Ayame-W', 7010, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (87, 'Curilla', 7011, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (88, 'Nanaa Mihgo', 7012, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (89, 'Nanaa Mihgo-W', 7013, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (90, 'Nanaa Mihgo-N', 7014, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (91, 'Naji', 7015, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (92, 'Naji-N', 7016, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (93, 'Excenmille', 7017, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (94, 'Excenmille-W', 7018, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (95, 'Excenmille-S', 7019, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (96, 'Adelheid', 7020, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (97, 'Adelheid-R', 7021, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (98, 'Darrcuiln', 7022, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (99, 'Darrcuiln-W', 7023, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (100, 'Darrcuiln-N', 7024, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (101, 'Lion', 7025, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (102, 'Prishe', 7026, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (103, 'Ulmia', 7027, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (104, 'Shantoto', 7028, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (105, 'Gessho', 7029, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (106, 'Zeid', 7030, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (107, 'Zeid-W', 7031, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (108, 'Zeid-S', 7032, 1, 99, 0, 0);

INSERT INTO `pet_list` VALUES (109, 'Mihli Alipoh', 7033, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (110, 'Mihli Alipoh-W', 7034, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (111, 'Milhi Alipoh-N', 7035, 1, 99, 0, 0);

INSERT INTO `pet_list` VALUES (112, 'Gadalar', 7036, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (113, 'Gadalar-W', 7037, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (114, 'Gadalar-S', 7038, 1, 99, 0, 0);

INSERT INTO `pet_list` VALUES (115, 'Najelith', 7039, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (116, 'Najelith-W', 7040, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (117, 'Najelith-N', 7041, 1, 99, 0, 0);

INSERT INTO `pet_list` VALUES (118, 'Rughadjeen', 7042, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (119, 'Rughadjeen-W', 7043, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (120, 'Rughadjeen-S', 7044, 1, 99, 0, 0);

INSERT INTO `pet_list` VALUES (121, 'Zazarg', 7045, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (122, 'Zazarg-W', 7047, 1, 99, 0, 0);
INSERT INTO `pet_list` VALUES (123, 'Zazarg-N', 7047, 1, 99, 0, 0);

INSERT INTO `pet_list` VALUES (124, 'Luzaf', 7048, 1, 99, 0, 0);



-- INSERT INTO `pet_list` VALUES (75, 'Shantotto', 5896, 1, 99, 0, 0);
