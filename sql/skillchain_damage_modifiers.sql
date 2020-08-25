
-- ----------------------------
-- Table structure for `skillchain_damage_modifiers`
-- ----------------------------
DROP TABLE IF EXISTS `skillchain_damage_modifiers`;
CREATE TABLE `skillchain_damage_modifiers` (
  `chain_level` enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  `chain_count` enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  `initial_modifier` int(3) NOT NULL DEFAULT '1',
  `magic_burst_modifier` int(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`chain_level`,`chain_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skillchain_damage_modifiers
-- ----------------------------
INSERT INTO `skillchain_damage_modifiers` VALUES ('1', '1', '500', '1300');
INSERT INTO `skillchain_damage_modifiers` VALUES ('1', '2', '600', '1350');
INSERT INTO `skillchain_damage_modifiers` VALUES ('1', '3', '700', '1400');
INSERT INTO `skillchain_damage_modifiers` VALUES ('1', '4', '800', '1450');
INSERT INTO `skillchain_damage_modifiers` VALUES ('1', '5', '900', '1500');
INSERT INTO `skillchain_damage_modifiers` VALUES ('2', '1', '600', '1350');
INSERT INTO `skillchain_damage_modifiers` VALUES ('2', '2', '750', '1400');
INSERT INTO `skillchain_damage_modifiers` VALUES ('2', '3', '1000', '1450');
INSERT INTO `skillchain_damage_modifiers` VALUES ('2', '4', '1250', '1500');
INSERT INTO `skillchain_damage_modifiers` VALUES ('2', '5', '1500', '1500');
INSERT INTO `skillchain_damage_modifiers` VALUES ('3', '1', '1000', '1400');
INSERT INTO `skillchain_damage_modifiers` VALUES ('3', '2', '1500', '1450');
INSERT INTO `skillchain_damage_modifiers` VALUES ('3', '3', '1750', '1500');
INSERT INTO `skillchain_damage_modifiers` VALUES ('3', '4', '2000', '1500');
INSERT INTO `skillchain_damage_modifiers` VALUES ('3', '5', '2250', '1500');
INSERT INTO `skillchain_damage_modifiers` VALUES ('4', '1', '1125', '1450');
INSERT INTO `skillchain_damage_modifiers` VALUES ('4', '2', '1625', '1500');
INSERT INTO `skillchain_damage_modifiers` VALUES ('4', '3', '1875', '1500');
INSERT INTO `skillchain_damage_modifiers` VALUES ('4', '4', '2125', '1500');
INSERT INTO `skillchain_damage_modifiers` VALUES ('4', '5', '2375', '1500');
INSERT INTO `skillchain_damage_modifiers` VALUES ('5', '1', '1250', '1600');
INSERT INTO `skillchain_damage_modifiers` VALUES ('5', '2', '1725', '1700');
INSERT INTO `skillchain_damage_modifiers` VALUES ('5', '3', '2000', '1700');
INSERT INTO `skillchain_damage_modifiers` VALUES ('5', '4', '2250', '1700');
INSERT INTO `skillchain_damage_modifiers` VALUES ('5', '5', '2500', '1700');