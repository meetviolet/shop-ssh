SET FOREIGN_KEY_CHECKS=0;


-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '男装区');
INSERT INTO `category` VALUES ('2', '女装区');
INSERT INTO `category` VALUES ('3', '母婴区');
INSERT INTO `category` VALUES ('4', '百货区');
INSERT INTO `category` VALUES ('5', '食品区');


-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF21DB1FD15` (`cid`),
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES ('1', '衬衫', '1');
INSERT INTO `categorysecond` VALUES ('2', '羽绒服', '1');
INSERT INTO `categorysecond` VALUES ('3', '西装', '1');
INSERT INTO `categorysecond` VALUES ('4', '中长裙', '2');
INSERT INTO `categorysecond` VALUES ('5', '短裙', '2');
INSERT INTO `categorysecond` VALUES ('6', '长裙', '2');
INSERT INTO `categorysecond` VALUES ('7', '玩具', '3');
INSERT INTO `categorysecond` VALUES ('8', '奶粉', '3');
INSERT INTO `categorysecond` VALUES ('9', '童装', '3');
INSERT INTO `categorysecond` VALUES ('10', '图书', '4');
INSERT INTO `categorysecond` VALUES ('11', '厨房', '4');
INSERT INTO `categorysecond` VALUES ('12', '收纳', '4');
INSERT INTO `categorysecond` VALUES ('13', '零食', '5');
INSERT INTO `categorysecond` VALUES ('14', '乳品', '5');
INSERT INTO `categorysecond` VALUES ('15', '糕点', '5');


-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEFB9B74E02` (`csid`),
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '夏季男士莱赛尔格子短袖衬衫', '299', '279', 'products/1/cs1.jpg', '根据中国男士标准体型参数,结合人体工程学设计,版型合体，穿着舒适打造时尚,优良的男装品质。', '1', '2021-05-10 20:18:00', '1');