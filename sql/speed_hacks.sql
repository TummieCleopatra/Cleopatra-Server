SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for speed_hacks
-- ----------------------------
DROP TABLE IF EXISTS `speed_hacks`;
CREATE TABLE `speed_hacks` (
  `charid` int(10) unsigned NOT NULL,
  `charname` varchar(30) NOT NULL,
  `zone` int(10) unsigned NOT NULL,
  `speed` float(7,3) NOT NULL,
  `pos` varchar(300) NOT NULL,
  `time` DATETIME
) ENGINE=MyISAM DEFAULT CHARSET=utf8;