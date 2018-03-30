/*
SQLyog Ultimate v11.11 (32 bit)
MySQL - 5.1.40-community : Database - shop
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shop`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `addressid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `addressname` VARCHAR(100) NOT NULL COMMENT '地址',
  `addresssignname` VARCHAR(20) NOT NULL COMMENT '收货人名',
  `addresssignphone` VARCHAR(22) NOT NULL COMMENT '收货电话',
  `addressdefault` CHAR(2) NULL COMMENT '是否默认',
  `customerid` INT(10) NOT NULL COMMENT '客户ID',
  `addressdate` DATETIME NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`addressid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='收货地址表';

/*Data for the table `address` */

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `adminid` INT(2) NOT NULL AUTO_INCREMENT COMMENT '创建者',
  `adminname` VARCHAR(20) NOT NULL COMMENT '姓名',
  `adminpassword` VARCHAR(20) NOT NULL COMMENT '密码',
  `admindate` DATE NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`adminid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

/*Table structure for table `business` */

DROP TABLE IF EXISTS `business`;

CREATE TABLE `business` (
  `businessid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '商家ID',
  `businessname` VARCHAR(20) NOT NULL COMMENT '商家名',
  `businessrealname` VARCHAR(20) NOT NULL COMMENT '商家真实姓名',
  `businesspassword` VARCHAR(20) NOT NULL COMMENT '商家密码',
  `businessphone` VARCHAR(22) NOT NULL COMMENT '联系电话',
  `businessemail` VARCHAR(20) NOT NULL COMMENT '商家邮箱',
  `ID` VARCHAR(30) NOT NULL COMMENT '身份证号',
  `businessregtime` DATETIME NOT NULL COMMENT '注册时间',
  `businessscore` INT(10) DEFAULT NULL COMMENT '积分',
  `address` VARCHAR(150) NOT NULL COMMENT '地址',
  `businessbankid` VARCHAR(30) NOT NULL COMMENT '银行卡号',
  PRIMARY KEY (`businessid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='商家 商家表';

/*Data for the table `business` */

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `cartid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `customerid` INT(10) NOT NULL COMMENT '客户ID',
  `productid` INT(10) NOT NULL COMMENT '商品ID',
  `carttime` DATETIME NOT NULL COMMENT '加购时间',
  `cartcount` INT(10) NOT NULL COMMENT '订购数量',
  `productprice` DOUBLE NOT NULL COMMENT '单价',
  `orderprice` DOUBLE NOT NULL COMMENT '商品总额',
  PRIMARY KEY (`cartid`),
  KEY `FK_cart_customer_id` (`customerid`),
  KEY `FK_cart_product_id` (`productid`),
  CONSTRAINT `FK_cart_product_id` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`),
  CONSTRAINT `FK_cart_customer_id` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='购物车 购物车';

/*Data for the table `cart` */

/*Table structure for table `commentary` */

DROP TABLE IF EXISTS `commentary`;

CREATE TABLE `commentary` (
  `commentaryid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `commentarytitle` VARCHAR(10) NOT NULL COMMENT '标题',
  `commentarycontent` VARCHAR(200) NOT NULL COMMENT '内容',
  `commentarypicture` VARCHAR(100) DEFAULT NULL COMMENT '图片',
  `customerid` INT(10) NOT NULL COMMENT '客户ID',
  `productid` INT(10) NOT NULL COMMENT '商品ID',
  `commentarytime` DATETIME NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`commentaryid`),
  KEY `FK_comment_customer_id` (`customerid`),
  KEY `FK_comment_product_id` (`productid`),
  CONSTRAINT `FK_comment_product_id` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`),
  CONSTRAINT `FK_comment_customer_id` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='评论表';

/*Data for the table `commentary` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customerid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `nickname` VARCHAR(20) NOT NULL COMMENT '用户名',
  `password` VARCHAR(100) NOT NULL COMMENT '用户密码',
  `phone` VARCHAR(22) NOT NULL COMMENT '联系电话',
  `registertime` DATETIME NOT NULL COMMENT '注册时间',
  `score` INT(10) DEFAULT NULL COMMENT '积分',
  `name` VARCHAR(20) DEFAULT NULL COMMENT '姓名',
  `ID` VARCHAR(20) DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`customerid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='消费者 消费者表';

/*Data for the table `customer` */

/*Table structure for table `dictionarytype` */

DROP TABLE IF EXISTS `dictionarytype`;

CREATE TABLE `dictionarytype` (
  `id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
   /*typeid INT(10)  NULL COMMENT '类型id',*/
  `typecode` VARCHAR(50) NOT NULL COMMENT '类型编号',
  `typename` VARCHAR(50) NOT NULL COMMENT '类别名称',
  `typecodeid` INT(10) NOT NULL COMMENT '编码ID',
  `adminid` INT(10) NOT NULL COMMENT '创建者',
  `typedate` DATETIME NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `FK_A_AdminID` (`adminid`),
  CONSTRAINT `FK_A_adminID` FOREIGN KEY (`adminid`) REFERENCES `admin` (`adminid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='分类字典表 分类字典表 类型';

/*Data for the table `dictionarytype` */

/*Table structure for table `gradetype` */

DROP TABLE IF EXISTS `gradetype`;

CREATE TABLE `gradetype` (
  `gradeid` INT(3) NOT NULL AUTO_INCREMENT COMMENT '等级ID',
  `score` INT(10) NOT NULL COMMENT '积分',
  `gradetype` VARCHAR(20) NOT NULL COMMENT '等级分类',
  PRIMARY KEY (`gradeid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='积分等级';

/*Data for the table `gradetype` */

/*Table structure for table `orderlist` */

DROP TABLE IF EXISTS `orderlist`;

CREATE TABLE `orderlist` (
  `orderid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `customerid` INT(10) NOT NULL COMMENT '客户号',
  `productid` INT(10) NOT NULL COMMENT '商品号',
  `ordercode` VARCHAR(19) NOT NULL COMMENT '订单编码',
  `addressid` INT(10) NOT NULL COMMENT '送货地址',
  `orderdate` DATETIME NOT NULL COMMENT '订购日期',
  `ordercount` INT(10) NOT NULL COMMENT '订购数量',
  `orderreceiptid` INT(10) DEFAULT NULL COMMENT '发票号',
  `orderprice` DOUBLE NOT NULL COMMENT '订单金额',
  `ordersenddate` DATETIME DEFAULT NULL COMMENT '发货时间',
  `orderpayment` VARCHAR(20) NOT NULL COMMENT '付款方式',
  `ordersendtype` INT(2) NOT NULL COMMENT '运送方式',
  `ordersendprice` DOUBLE DEFAULT NULL COMMENT '邮费',
  `orderstate` INT(2) NOT NULL COMMENT '订单状态',
  `orderblook` CHAR(2) NOT NULL COMMENT '商家可见状态',
  `orderclook` CHAR(2) NOT NULL COMMENT '客户可见状态',
  /*   orderstateid INT(4) NOT NULL COMMENT '订单状态id',*/
  PRIMARY KEY (`orderid`),
  KEY `FK_order_customer_id` (`customerid`),
  KEY `FK_order_product_id` (`productid`),
  KEY `FK_order_sendtype` (`ordersendtype`),
  CONSTRAINT `FK_order_sendtype` FOREIGN KEY (`ordersendtype`) REFERENCES `sendtype` (`sendtypeid`),
  CONSTRAINT `FK_order_product_id` FOREIGN KEY (`productid`) REFERENCES `product` (`productid`),
  CONSTRAINT `FK_order_customer_id` FOREIGN KEY (`customerid`) REFERENCES `customer` (`customerid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='订单表 订单';

/*Data for the table `orderlist` */

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `productid` INT(10) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `productname` VARCHAR(30) NOT NULL COMMENT '商品名称',
  `productprice` DOUBLE NOT NULL COMMENT '商品价格',
  `producttitle` VARCHAR(50) NOT NULL COMMENT '商品标题',
  `productintroduction` VARCHAR(200) DEFAULT NULL COMMENT '商品描述',
  `productimage` VARCHAR(100) NOT NULL COMMENT '商品图片路径',
  `productcount` INT(10) NOT NULL COMMENT '商品库存',
  `productsail` INT(10) DEFAULT NULL COMMENT '商品销量',
  `productweight` INT(10) NOT NULL COMMENT '商品重量',
  `productsize` VARCHAR(50) NULL COMMENT '商品规格',
  `productoneid` VARCHAR(20) NOT NULL COMMENT '一级类别',
  `producttwoid` VARCHAR(20) NOT NULL COMMENT '二级类别',
  `productthreeid` VARCHAR(100) DEFAULT NULL COMMENT '三级类别',
  
  /*`productstatusid` INT(4) NOT NULL COMMENT '商品状态id',*/
  `productstatus` INT(4) NOT NULL COMMENT '商品状态',
  
  `productstartdatetime` DATETIME NOT NULL COMMENT '上架日期',
  `productenddatetime` DATETIME DEFAULT NULL COMMENT '下架日期',
  `businessid` INT(10) NOT NULL COMMENT '商家ID',
  `productaddress` VARCHAR(50) NOT NULL COMMENT '商品发货地',
  `sendtypeid` INT(3)  NULL COMMENT '配送方式',
  `productpageview` INT(10) DEFAULT NULL COMMENT '访问量',
  PRIMARY KEY (`productid`),
  KEY `FK_Product_sendtype_id` (`sendtypeid`),
  KEY `FK_Product_business_id` (`businessid`),
  CONSTRAINT `FK_Product_business_id` FOREIGN KEY (`businessid`) REFERENCES `business` (`businessid`),
  CONSTRAINT `FK_Product_sendtype_id` FOREIGN KEY (`sendtypeid`) REFERENCES `sendtype` (`sendtypeid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='产品表 所有产品';

/*Data for the table `product` */

/*Table structure for table `sendtype` */

DROP TABLE IF EXISTS `sendtype`;

CREATE TABLE `sendtype` (
  `sendtypeid` INT(3) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `sendtypename` VARCHAR(20) NOT NULL COMMENT '类型名称',
  `adminid` INT(2) NOT NULL COMMENT '创建者',
  `sendtypeDate` DATETIME NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`sendtypeid`)
) ENGINE=INNODB DEFAULT CHARSET=utf8;

/*Data for the table `sendtype` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
