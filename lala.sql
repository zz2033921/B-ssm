# Host: 127.0.0.1  (Version: 5.5.53)
# Date: 2020-06-21 15:03:25
# Generator: MySQL-Front 5.3  (Build 4.269)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "dept"
#

DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `loc` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

#
# Data for table "dept"
#

INSERT INTO `dept` VALUES (1,'开发部',NULL),(2,'市场部',NULL),(3,'财务部',NULL),(10,'教研部','北京'),(20,'学工部','上海'),(30,'销售部','广州'),(40,'财务部','深圳');

#
# Structure for table "job"
#

DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `jname` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "job"
#

INSERT INTO `job` VALUES (1,'董事长','管理整个公司，接单'),(2,'经理','管理部门员工'),(3,'销售员','向客人推销产品'),(4,'文员','使用办公软件');

#
# Structure for table "emp"
#

DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` int(11) NOT NULL,
  `ename` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `mgr` int(11) DEFAULT NULL,
  `joindate` date DEFAULT NULL,
  `salary` decimal(7,2) DEFAULT NULL,
  `bonus` decimal(7,2) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emp_jobid_ref_job_id_fk` (`job_id`),
  KEY `emp_deptid_ref_dept_id_fk` (`dept_id`),
  CONSTRAINT `emp_deptid_ref_dept_id_fk` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`),
  CONSTRAINT `emp_jobid_ref_job_id_fk` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "emp"
#

INSERT INTO `emp` VALUES (1001,'孙悟空',4,1004,'2000-12-17',8000.00,NULL,20),(1002,'卢俊义',3,1006,'2001-02-20',16000.00,3000.00,30),(1003,'林冲',3,1006,'2001-02-22',12500.00,5000.00,30),(1004,'唐僧',2,1009,'2001-04-02',29750.00,NULL,20),(1005,'李逵',4,1006,'2001-09-28',12500.00,14000.00,30),(1006,'宋江',2,1009,'2001-05-01',28500.00,NULL,30),(1007,'刘备',2,1009,'2001-09-01',24500.00,NULL,10),(1008,'猪八戒',4,1004,'2007-04-19',30000.00,NULL,20),(1009,'罗贯中',1,NULL,'2001-11-17',50000.00,NULL,10),(1010,'吴用',3,1006,'2001-09-08',15000.00,0.00,30),(1011,'沙僧',4,1004,'2007-05-23',11000.00,NULL,20),(1012,'李逵',4,1006,'2001-12-03',9500.00,NULL,30),(1013,'小白龙',4,1004,'2001-12-03',30000.00,NULL,20),(1014,'关羽',4,1007,'2002-01-23',13000.00,NULL,10);

#
# Structure for table "member"
#

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phoneNum` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Data for table "member"
#

INSERT INTO `member` VALUES (1,'张三','小三','18888888888','zs@163.com');

#
# Structure for table "permission"
#

DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "permission"
#

INSERT INTO `permission` VALUES (1,'user findAll','/user/findAll.do'),(3,'user findById','/user/findById.do'),(4,'userTest','/test/test');

#
# Structure for table "product"
#

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `productName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `cityName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `DepartureTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `productPrice` int(11) DEFAULT NULL,
  `productDesc` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `productStatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product` (`id`,`productNum`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "product"
#

INSERT INTO `product` VALUES (1,'itcast-002','北京三日游','北京','2020-04-26 22:47:36',1200,'不错的旅行',1),(2,'itcast-003','上海五日游','上海','2020-04-26 22:49:14',1800,'魔都我来了',0),(3,'itcast-001','北京三日游','北京','2020-04-26 22:50:38',1200,'不错的旅行',1);

#
# Structure for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `orderTime` timestamp NULL DEFAULT NULL,
  `peopleCount` int(11) DEFAULT NULL,
  `orderDesc` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `payType` int(11) DEFAULT NULL,
  `orderStatus` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `memberId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_order_fk_1` (`productId`),
  KEY `member_oreders_fk_1` (`memberId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (1,'12345','2020-04-27 23:58:14',2,'没什么',0,1,1,1),(2,'12345','2020-04-27 23:59:53',2,'没什么',0,1,2,1),(3,'53512','2020-04-27 23:59:53',2,'没什么',0,1,1,1),(4,'558452','2020-04-27 23:59:53',2,'没什么',0,1,3,1),(5,'326569','2020-04-27 23:59:53',2,'没什么',0,1,3,1);

#
# Structure for table "role"
#

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `roleDesc` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "role"
#

INSERT INTO `role` VALUES (1,'ADMIN','vip'),(2,'USER','vip'),(4,'奥利','奥利给');

#
# Structure for table "role_permission"
#

DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissionId` (`permissionId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`id`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "role_permission"
#

INSERT INTO `role_permission` VALUES (1,1,1),(2,3,2),(3,1,2),(4,1,4),(5,3,4),(6,4,4);

#
# Structure for table "salarygrade"
#

DROP TABLE IF EXISTS `salarygrade`;
CREATE TABLE `salarygrade` (
  `grade` int(11) NOT NULL,
  `losalary` int(11) DEFAULT NULL,
  `hisalary` int(11) DEFAULT NULL,
  PRIMARY KEY (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "salarygrade"
#

INSERT INTO `salarygrade` VALUES (1,7000,12000),(2,12010,14000),(3,14010,20000),(4,20010,30000),(5,30010,99990);

#
# Structure for table "syslog"
#

DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `executionTime` int(11) DEFAULT NULL,
  `method` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

#
# Data for table "syslog"
#

INSERT INTO `syslog` VALUES (1,'2020-05-05 12:27:16','tom','0:0:0:0:0:0:0:1','/findAll.do/product',9,'[类名]com.itheima.ssm.controller.ProductController[方法名] findAll'),(2,'2020-05-05 12:33:41','tom','0:0:0:0:0:0:0:1','/findAll.do/user',17,'[类名]com.itheima.ssm.controller.UserController[方法名] findAll'),(3,'2020-05-05 12:33:51','tom','0:0:0:0:0:0:0:1','/findAll.do/permission',14,'[类名]com.itheima.ssm.controller.PermissionController[方法名] findAll'),(4,'2020-05-05 12:45:08','tom','0:0:0:0:0:0:0:1','/findAll.do/sysLog',31,'[类名]com.itheima.ssm.controller.LogController[方法名] findAll'),(5,'2020-05-05 12:48:29','tom','0:0:0:0:0:0:0:1','/findAll.do/sysLog',30,'[类名]com.itheima.ssm.controller.LogController[方法名] findAll'),(6,'2020-05-05 12:50:04','tom','0:0:0:0:0:0:0:1','/findAll.do/sysLog',28,'[类名]com.itheima.ssm.controller.LogController[方法名] findAll'),(7,'2020-05-05 12:50:19','tom','0:0:0:0:0:0:0:1','/findAll.do/role',16,'[类名]com.itheima.ssm.controller.RoleController[方法名] findAll'),(8,'2020-05-05 12:50:22','tom','0:0:0:0:0:0:0:1','/findById.do/role',5,'[类名]com.itheima.ssm.controller.RoleController[方法名] findById'),(9,'2020-05-05 12:50:26','tom','0:0:0:0:0:0:0:1','/findAll.do/sysLog',7,'[类名]com.itheima.ssm.controller.LogController[方法名] findAll'),(10,'2020-05-16 22:42:25','tom','0:0:0:0:0:0:0:1','/findAll.do/product',29,'[类名]com.itheima.ssm.controller.ProductController[方法名] findAll'),(11,'2020-05-16 22:43:42','tom','0:0:0:0:0:0:0:1','/findAll.do/product',28,'[类名]com.itheima.ssm.controller.ProductController[方法名] findAll'),(12,'2020-05-16 22:46:53','tom','0:0:0:0:0:0:0:1','/findAll.do/product',412,'[类名]com.itheima.ssm.controller.ProductController[方法名] findAll'),(13,'2020-05-16 22:47:06','tom','0:0:0:0:0:0:0:1','/findAll.do/product',5,'[类名]com.itheima.ssm.controller.ProductController[方法名] findAll'),(14,'2020-05-16 22:47:10','tom','0:0:0:0:0:0:0:1','/findAll.do/orders',0,'[类名]com.itheima.ssm.controller.OrdersController[方法名] findAll'),(15,'2020-05-16 22:47:21','tom','0:0:0:0:0:0:0:1','/findAll.do/product',6,'[类名]com.itheima.ssm.controller.ProductController[方法名] findAll'),(16,'2020-05-16 22:47:24','tom','0:0:0:0:0:0:0:1','/findAll.do/user',14,'[类名]com.itheima.ssm.controller.UserController[方法名] findAll'),(17,'2020-05-16 22:47:27','tom','0:0:0:0:0:0:0:1','/findAll.do/role',24,'[类名]com.itheima.ssm.controller.RoleController[方法名] findAll'),(18,'2020-05-16 22:47:30','tom','0:0:0:0:0:0:0:1','/findAll.do/permission',16,'[类名]com.itheima.ssm.controller.PermissionController[方法名] findAll'),(19,'2020-05-16 22:47:32','tom','0:0:0:0:0:0:0:1','/findAll.do/sysLog',17,'[类名]com.itheima.ssm.controller.LogController[方法名] findAll'),(20,'2020-05-16 22:47:34','tom','0:0:0:0:0:0:0:1','/findAll.do/permission',4,'[类名]com.itheima.ssm.controller.PermissionController[方法名] findAll'),(21,'2020-05-16 22:47:36','tom','0:0:0:0:0:0:0:1','/findAll.do/product',6,'[类名]com.itheima.ssm.controller.ProductController[方法名] findAll'),(22,'2020-05-16 22:47:38','tom','0:0:0:0:0:0:0:1','/findAll.do/orders',0,'[类名]com.itheima.ssm.controller.OrdersController[方法名] findAll');

#
# Structure for table "traveller"
#

DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` int(11) NOT NULL DEFAULT '0',
  `NAME` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `credentialsType` int(11) DEFAULT NULL,
  `credentialsNum` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `travellerType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "traveller"
#

INSERT INTO `traveller` VALUES (1,'张龙','男','13333333333',0,'123456789009876543',0),(2,'张小龙','男','15555555555',0,'987654321123456789',1);

#
# Structure for table "order_traveller"
#

DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `travellerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderId` (`orderId`),
  KEY `travellerId` (`travellerId`),
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "order_traveller"
#

INSERT INTO `order_traveller` VALUES (1,1,1),(2,3,2),(3,4,1),(4,5,2),(5,2,1),(6,4,1);

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `username` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'tom@itcast.cn','tom','$2a$10$/TboHp.wf8M/QpyVW7UTwem8OxEthzmBcxcHtmT1S7laYxgqQZQHy','13333333333',1),(2,'www@itcast.cn','www','$2a$10$v.cIOOcMs0GttXB2sKPHYehcObdyuDJaUOItYuwnlfsqZUH0FlYAO','563214',1),(4,'www@aaa.cn','aaa','$2a$10$257Va5rnC1CFoFewXlyAR.rwQ0./AUQsclMoPMl3ldUDypGfaCIsK','123456',1),(5,'www@iqqq','qwe','$2a$10$EM1zqIRo/FTRBFO2LaBCFuvY/2.mXlz5g/nc7uIw4dS7alhQSlYH.','4569722',0),(6,'www@aasdf','rty','$2a$10$llJnL4CgNyjBi7/wI/7GROuGHfJGcKBRHqTsSyPWHPbWk2XvG3GVa','7894561',1);

#
# Structure for table "users_role"
#

DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Data for table "users_role"
#

INSERT INTO `users_role` VALUES (1,1,1),(2,1,2),(3,1,2),(4,4,1),(5,2,1),(6,2,2),(7,2,4),(8,5,4);
