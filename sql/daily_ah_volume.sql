
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for daily_ah_volume
-- ----------------------------
DROP TABLE IF EXISTS `daily_ah_volume`;
CREATE TABLE `daily_ah_volume` (
  `lineID` int(10) NOT NULL AUTO_INCREMENT,
  `call_date` int(10) unsigned NOT NULL,
  `gil_value` int(11) NOT NULL,
  PRIMARY KEY (`lineID`,`call_date`)
) ENGINE=MyISAM AUTO_INCREMENT=2270 DEFAULT CHARSET=utf8;
