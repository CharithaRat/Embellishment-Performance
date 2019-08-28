/*
SQLyog Ultimate v8.55 
MySQL - 5.5.61-log : Database - asset_register_somro
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`asset_register_somro` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `asset_register_somro`;

/*Table structure for table `a_job_define` */

DROP TABLE IF EXISTS `a_job_define`;

CREATE TABLE `a_job_define` (
  `Job_Id` int(100) NOT NULL AUTO_INCREMENT,
  `Ref_User_Type` int(5) DEFAULT NULL,
  `Sub_Tab_Sub_Id` int(5) DEFAULT NULL,
  `Sub_Tab_Id` int(5) DEFAULT NULL,
  `Main_Tab_Id` int(5) DEFAULT NULL,
  PRIMARY KEY (`Job_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=386 DEFAULT CHARSET=latin1;

/*Data for the table `a_job_define` */

insert  into `a_job_define`(`Job_Id`,`Ref_User_Type`,`Sub_Tab_Sub_Id`,`Sub_Tab_Id`,`Main_Tab_Id`) values (319,2,1,1,1),(320,2,2,1,1),(321,2,3,1,1),(322,2,4,2,1),(323,2,5,2,1),(324,2,6,2,1),(325,2,7,2,1),(326,2,8,3,1),(327,2,9,3,1),(328,2,10,3,1),(329,2,11,3,1),(330,2,0,4,1),(331,2,0,5,1),(332,2,46,34,1),(333,2,47,34,1),(334,2,0,21,2),(335,2,0,31,2),(336,2,0,22,2),(337,2,0,23,2),(338,2,0,24,2),(339,2,0,25,2),(340,2,0,26,2),(341,2,0,33,2),(342,2,0,6,3),(343,2,0,7,4),(344,2,19,8,4),(345,2,20,8,4),(346,2,21,9,4),(347,2,22,9,4),(348,2,23,9,4),(349,2,24,9,4),(350,2,0,10,4),(351,2,0,11,4),(352,2,0,12,4),(353,2,0,36,4),(354,2,0,13,4),(355,2,0,14,4),(356,2,0,32,4),(357,2,0,35,4),(358,2,0,15,5),(359,2,0,16,5),(360,2,0,17,5),(361,2,0,18,5),(362,2,0,19,5),(363,2,0,29,5),(364,2,0,30,5),(365,2,0,20,6),(366,2,25,27,7),(367,2,26,27,7),(368,2,27,27,7),(369,2,28,27,7),(370,2,29,27,7),(371,2,32,27,7),(372,2,33,27,7),(373,2,34,27,7),(374,2,35,27,7),(375,2,36,27,7),(376,2,37,27,7),(377,2,38,27,7),(378,2,39,27,7),(379,2,45,28,7),(380,2,30,28,7),(381,2,31,28,7),(382,2,40,28,7),(383,2,41,28,7),(384,2,42,28,7),(385,2,43,28,7);

/*Table structure for table `a_maintab` */

DROP TABLE IF EXISTS `a_maintab`;

CREATE TABLE `a_maintab` (
  `Main_Tab_ID` int(10) NOT NULL AUTO_INCREMENT,
  `Main_Tab_Code` varchar(50) NOT NULL,
  `Main_Tab_Name` varchar(255) NOT NULL,
  `Ref_Page` varchar(255) DEFAULT NULL,
  `order_ID` int(10) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Main_Tab_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `a_maintab` */

insert  into `a_maintab`(`Main_Tab_ID`,`Main_Tab_Code`,`Main_Tab_Name`,`Ref_Page`,`order_ID`,`isActive`) values (1,'fa fa-file fa-indent','File',NULL,1,1),(2,'fa fa-database fa-indent','Data',NULL,2,1),(3,'fa fa-fw fa-book','Library',NULL,3,1),(4,'fa fa-fw fa-bar-chart-o','Reports',NULL,4,1),(5,'fa fa-fw fa-desktop','Option',NULL,5,1),(6,'fa fa-upload','Upload',NULL,6,1),(7,'fa fa-database fa-indent','Maintenance',NULL,7,1);

/*Table structure for table `a_subtab` */

DROP TABLE IF EXISTS `a_subtab`;

CREATE TABLE `a_subtab` (
  `Main_Tab_ID` int(10) NOT NULL,
  `Sub_Tab_No` int(10) NOT NULL AUTO_INCREMENT,
  `Sub_Tab_Name` varchar(100) NOT NULL,
  `Sub_Tab_Code` varchar(50) DEFAULT NULL,
  `RefPage` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `Ordertab` int(10) DEFAULT NULL,
  PRIMARY KEY (`Sub_Tab_No`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

/*Data for the table `a_subtab` */

insert  into `a_subtab`(`Main_Tab_ID`,`Sub_Tab_No`,`Sub_Tab_Name`,`Sub_Tab_Code`,`RefPage`,`isActive`,`Ordertab`) values (1,1,'Asset Category','',NULL,1,1),(1,2,'Asset Location','',NULL,1,2),(1,3,'Asset Alocation','',NULL,1,3),(1,4,'Disposal Catergory','','category/disposalCategory',1,4),(1,5,'Analysis Master','','category/analysisData',1,5),(2,21,'Asset Registration','','data/asset',1,1),(3,6,'Book Registration','','library/bookRegistration',1,1),(4,7,'Master Listing','','report/masterListing',1,1),(4,8,'Assets','',NULL,1,2),(4,9,'Class of Assets','',NULL,1,3),(4,10,'Transfers','','report/transferListing',1,4),(4,11,'Disposals','','report/disposalListing',1,5),(4,12,'Damaged','','report/damagedListing',1,6),(4,13,'Label Print ','','report/labelPrint',1,7),(4,14,'Detail Of Individual Asset ','','report/individualAsset',1,8),(5,15,'Report Preparation','','preparation/reportPreparation',1,1),(5,16,'Add User Type','','user/userType',1,2),(5,17,'Add New User','','user/newUser',1,3),(5,18,'User Job Define','','user/userJobs',1,4),(5,19,'Data Backup','','option/dataBackup',1,5),(6,20,'Upload Excel Data','','upload/uploadFile',1,1),(2,26,'Asset Physical Verification',NULL,'data/physicalVerification',1,7),(2,25,'Improvements',NULL,'data/improvements',1,6),(2,24,'Damaged',NULL,'data/damage',1,5),(2,23,'Transfers',NULL,'data/transfers',1,4),(2,22,'Disposal',NULL,'data/disposal',1,3),(7,27,'Master File',NULL,NULL,1,1),(7,28,'Transaction',NULL,NULL,1,2),(5,29,'Currency',NULL,'option/currency',1,6),(5,30,'CurrencyRate',NULL,'option/currencyRate',1,7),(2,31,'View Assets',NULL,'data/viewAsset',1,2),(4,32,'Maintenance Master Listing',NULL,'report/maintenanceMasterListingReport',1,9),(2,33,'Asset Revaluation',NULL,'data/assetRevaluation',1,8),(1,34,'Accessories',NULL,'',1,6),(4,35,'Maintenance Transaction Listing',NULL,'report/maintenanceTransactionListingReport',1,10),(4,36,'QR Print',NULL,'report/qrPrint',1,6);

/*Table structure for table `a_subtab_sub` */

DROP TABLE IF EXISTS `a_subtab_sub`;

CREATE TABLE `a_subtab_sub` (
  `Main_Tab_ID` int(10) NOT NULL,
  `Sub_Tab_ID` int(10) NOT NULL,
  `Sub_Tab_Sub_ID` int(10) NOT NULL,
  `Sub_Tab_Sub_Name` varchar(100) NOT NULL,
  `Sub_Tab_Sub_Code` varchar(50) DEFAULT NULL,
  `RefPage` varchar(255) DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT '1',
  `Ordertab` int(10) DEFAULT NULL,
  PRIMARY KEY (`Sub_Tab_Sub_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

/*Data for the table `a_subtab_sub` */

insert  into `a_subtab_sub`(`Main_Tab_ID`,`Sub_Tab_ID`,`Sub_Tab_Sub_ID`,`Sub_Tab_Sub_Name`,`Sub_Tab_Sub_Code`,`RefPage`,`isActive`,`Ordertab`) values (1,1,1,'Main Category',NULL,'category/mainCategory',1,1),(1,1,2,'Sub Category',NULL,'category/subCategory',1,2),(1,1,3,'Detail Category',NULL,'category/detailCategory',1,3),(1,2,4,'City',NULL,'location/city',1,1),(1,2,5,'Building',NULL,'location/building',1,2),(1,2,6,'Floor',NULL,'location/floor',1,3),(1,2,7,'room',NULL,'location/room',1,4),(1,3,8,'Company',NULL,'allocation/company',1,1),(1,3,9,'Department / Branch',NULL,'allocation/department',1,2),(1,3,10,'Section',NULL,'allocation/section',1,3),(1,3,11,'Location',NULL,'allocation/location',1,4),(2,6,12,'Asset Registration',NULL,'data/asset',1,1),(2,6,13,'Disposal',NULL,'data/disposal',1,2),(2,6,14,'Transfers',NULL,'data/transfers',1,3),(2,6,15,'Damaged',NULL,'data/damage',1,4),(2,6,16,'Improvements',NULL,'data/improvements',1,5),(2,6,17,'Asset Physical Verification',NULL,'data/physicalVerification',1,6),(3,7,18,'Book Registration',NULL,'library/bookRegistration',1,1),(4,8,19,'Details',NULL,'report/assetListing',1,1),(4,8,20,'With Depreciation',NULL,'report/withDepreciation',1,2),(4,9,21,'Final Summary',NULL,'report/finalSummary',1,3),(4,9,22,'Location',NULL,'report/locationSummary',1,4),(4,9,23,'Branch',NULL,'report/departmentSummary',1,5),(4,9,24,'Section',NULL,'report/sectionSummary',1,6),(7,27,25,'Land',NULL,'maintenance/land',1,1),(7,27,26,'Land & Building',NULL,'maintenance/landBuilding',1,2),(7,27,27,'Vehicle',NULL,'maintenance/vehicle',1,3),(7,27,28,'Computer',NULL,'maintenance/computer',1,4),(7,27,29,'Plant & Machinery',NULL,'maintenance/plantMachinery',1,5),(7,28,30,'Insurance',NULL,'maintenance/insurance',1,2),(7,28,31,'Warranty',NULL,'maintenance/warranty',1,3),(7,27,32,'Furniture',NULL,'maintenance/furniture',1,6),(7,27,33,'Office Equipment',NULL,'maintenance/officeEquipment',1,7),(7,27,34,'Lab Equipment',NULL,'maintenance/labEquipment',1,8),(7,27,35,'Teaching Equipment',NULL,'maintenance/teachingEquipment',1,9),(7,27,36,'Fixtures and Fitting',NULL,'maintenance/fixturesAndFitting',1,10),(7,27,37,'Library Books',NULL,'maintenance/libraryBooks',1,11),(7,27,38,'Sport Equipment',NULL,'maintenance/sportEquipment',1,12),(7,27,39,'Software',NULL,'maintenance/software',1,13),(7,28,40,'Service Agreement',NULL,'maintenance/serviceAgreement',1,4),(7,28,41,'Modification',NULL,'maintenance/modification',1,5),(7,28,42,'Maintenance Data',NULL,'maintenance/maintenanceData',1,6),(7,28,43,'Running Data',NULL,'maintenance/runningData',1,7),(7,34,44,'Listings',NULL,'reports/listings',1,7),(7,28,45,'Lease Asset',NULL,'maintenance/leaseAsset',1,1),(1,34,46,'Accessory Master',NULL,'category/accessoryMaster',1,1),(1,34,47,'Accessory Assigning',NULL,'category/accessoryAssigning',1,2);

/*Table structure for table `accessory_assigning` */

DROP TABLE IF EXISTS `accessory_assigning`;

CREATE TABLE `accessory_assigning` (
  `ACCESSORY_ASSIGNING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(10) DEFAULT NULL,
  `ACCESSORY_ID` int(10) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ACCESSORY_ASSIGNING_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `accessory_assigning` */

/*Table structure for table `accessory_assigning_history` */

DROP TABLE IF EXISTS `accessory_assigning_history`;

CREATE TABLE `accessory_assigning_history` (
  `ACCESSORY_ASSIGNING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCESSORY_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ACCESSORY_ASSIGNING_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `accessory_assigning_history` */

/*Table structure for table `accessory_master` */

DROP TABLE IF EXISTS `accessory_master`;

CREATE TABLE `accessory_master` (
  `ACCER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCER_CODE` varchar(10) DEFAULT NULL,
  `ACCER_NAME` varchar(200) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ACCER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `accessory_master` */

/*Table structure for table `anlysis_master` */

DROP TABLE IF EXISTS `anlysis_master`;

CREATE TABLE `anlysis_master` (
  `ANA_CODE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ANA_CODE` varchar(6) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ANA_CODE_ID`),
  UNIQUE KEY `Analysis_unique` (`ANA_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `anlysis_master` */

/*Table structure for table `asset` */

DROP TABLE IF EXISTS `asset`;

CREATE TABLE `asset` (
  `AS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AS_CODE` varchar(45) NOT NULL,
  `AS_DES` varchar(250) NOT NULL,
  `REG_DATE` date NOT NULL,
  `AS_ISSUENO` varchar(45) DEFAULT NULL,
  `CONFIRM` tinyint(1) DEFAULT '0',
  `CONFIRMEDBY` int(11) DEFAULT NULL,
  `CANCEL` tinyint(1) DEFAULT '0',
  `CANCELEDBY` int(11) DEFAULT NULL,
  `AS_DAMAGE` tinyint(1) DEFAULT '0',
  `AS_DISPOSED` tinyint(1) DEFAULT '0',
  `AS_TRANSFER` tinyint(1) DEFAULT '0',
  `AS_CODE_OLD` varchar(45) DEFAULT NULL,
  `AUTH_PERSON` varchar(45) DEFAULT NULL,
  `PUR_DATE` date DEFAULT NULL,
  `NO_OF_UNIT` int(11) DEFAULT '0',
  `CURRENCY_TYPE` int(10) DEFAULT '0',
  `UNIT_PRICE` double DEFAULT '0',
  `AMOUNT` double DEFAULT '0',
  `LEDGER_CODE` varchar(25) DEFAULT NULL,
  `MAN_REG_NO` varchar(35) DEFAULT NULL,
  `LIFE_TIME` varchar(11) DEFAULT '0',
  `MANUFACTURER` varchar(50) DEFAULT NULL,
  `ORIGINAL_COST` varchar(100) DEFAULT NULL,
  `FUNDING_SOURCE` varchar(100) DEFAULT NULL,
  `IS_LEASING` int(1) DEFAULT '0',
  `AS_DCAT_ID` int(11) DEFAULT NULL,
  `USER_ID` int(5) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `ANALYSIS_CODE` varchar(11) DEFAULT NULL,
  `PO_NO` varchar(35) DEFAULT NULL,
  `PO_DATE` varchar(11) DEFAULT NULL,
  `GRN_NO` varchar(35) DEFAULT NULL,
  `GRN_DATE` varchar(11) DEFAULT NULL,
  `ISSUE_NOTE_NO` varchar(35) DEFAULT NULL,
  `ISSUE_NOTE_DATE` varchar(11) DEFAULT NULL,
  `SUPPLIERS_INVOICE_NO` varchar(35) DEFAULT NULL,
  `INVOICE_DATE` varchar(11) DEFAULT NULL,
  `SUPPLIER_NAME` varchar(45) DEFAULT NULL,
  `ADDRESS` varchar(45) DEFAULT NULL,
  `TELEPHONE_NO` varchar(15) DEFAULT NULL,
  `TRANSACTION_NO` int(10) DEFAULT '0',
  `QR_PATH` varchar(255) DEFAULT NULL,
  `LOC_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AS_ID`),
  UNIQUE KEY `AS_CODE_UNIQUE` (`AS_CODE`),
  KEY `FK_asset` (`AS_DCAT_ID`),
  KEY `fk_asset_anlysis_master1_idx` (`ANALYSIS_CODE`),
  KEY `FK97cfj35mlqkuyatu8s2bi045t` (`LOC_ID`),
  CONSTRAINT `FK97cfj35mlqkuyatu8s2bi045t` FOREIGN KEY (`LOC_ID`) REFERENCES `location_master` (`LOC_ID`),
  CONSTRAINT `FK_asset` FOREIGN KEY (`AS_DCAT_ID`) REFERENCES `asset_catergory_detail` (`DCAT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;

/*Data for the table `asset` */

insert  into `asset`(`AS_ID`,`AS_CODE`,`AS_DES`,`REG_DATE`,`AS_ISSUENO`,`CONFIRM`,`CONFIRMEDBY`,`CANCEL`,`CANCELEDBY`,`AS_DAMAGE`,`AS_DISPOSED`,`AS_TRANSFER`,`AS_CODE_OLD`,`AUTH_PERSON`,`PUR_DATE`,`NO_OF_UNIT`,`CURRENCY_TYPE`,`UNIT_PRICE`,`AMOUNT`,`LEDGER_CODE`,`MAN_REG_NO`,`LIFE_TIME`,`MANUFACTURER`,`ORIGINAL_COST`,`FUNDING_SOURCE`,`IS_LEASING`,`AS_DCAT_ID`,`USER_ID`,`ACTION_TIME`,`ANALYSIS_CODE`,`PO_NO`,`PO_DATE`,`GRN_NO`,`GRN_DATE`,`ISSUE_NOTE_NO`,`ISSUE_NOTE_DATE`,`SUPPLIERS_INVOICE_NO`,`INVOICE_DATE`,`SUPPLIER_NAME`,`ADDRESS`,`TELEPHONE_NO`,`TRANSACTION_NO`,`QR_PATH`,`LOC_ID`) values (1,'ICEDSKDSK00001',' PANAUDIO CO.,LTD  B/N  C4355','1993-02-15',NULL,0,0,0,0,0,0,0,'','','1993-02-15',1,1,5000,0,'','','48','','','',0,29,0,'2019-02-15 07:59:48','0','','','','','','','','02/15/1993',' PANAUDIO CO.LTD  B/N  C4355','','',1,NULL,NULL),(2,'ICEDSKDSK00002',' VASU CHARTERED ENGINEERS  SINGAPOR','1993-01-19',NULL,0,0,0,0,0,0,0,'','','1993-01-19',1,1,46902.62,0,'','','48','','','',0,29,0,'2019-02-15 08:15:07','0','','','','','','','','01/19/1993','','','',2,NULL,NULL),(3,'ICEPRIPRI00001','01 UNIT FX-1170 PRINTERS $ 750.00 @','1993-01-18',NULL,0,0,0,0,0,0,0,'','','1993-01-18',1,1,21741.75,0,'','','48','','','',0,28,0,'2019-02-20 05:02:55','0','','','','','','','','01/18/1993','','','',3,NULL,NULL),(4,'ICEPRIPRI00002',' PROTON COMPUTERS PTE. LTD. SINGAPO','1993-01-18',NULL,0,0,0,0,0,0,0,'','','1993-01-18',1,1,20286.84,0,'','','48','','','',0,28,0,'2019-02-20 05:31:43','0','','','','','','','','01/18/1993','','','',4,NULL,NULL),(5,'ICEDSKDSK00003','PR (PVT)LTDOFCOMPUTER MANUFACTURING','1994-07-25',NULL,0,0,0,0,0,0,0,'','','1994-07-25',1,1,52750,0,'','','48','','','',0,29,0,'2019-02-20 06:13:51','0','','','','','','','','07/25/1994','','','',5,NULL,NULL),(6,'ICEDSKDSK00004','COMPUTER LAND -P/I DTD 3.2.97LEASE ','1997-10-02',NULL,0,0,0,0,0,0,0,'','','1997-10-02',1,1,175740,0,'','','48','','','',0,29,0,'2019-02-20 06:29:21','0','','','','','','','','10/02/1997','','','',6,NULL,NULL),(7,'ICEDSKDSK00005','CREATIVE LOGIC (PVT) LTDLEASE - FRO','1997-08-11',NULL,0,0,0,0,0,0,0,'','','1997-08-11',1,1,125000,0,'','','48','','','',0,29,0,'2019-02-20 06:41:09','0','','','','','','','','08/11/1997','','','',7,NULL,NULL),(9,'ICEDSKDSK00007','NEAT TECHNOLOGY PTE LTDSINGAPORE - ','2000-03-02',NULL,0,0,0,0,0,0,0,'','','2000-03-02',1,1,91882.57,0,'','','48','','','',0,29,0,'2019-02-20 07:56:37','0','','','','','','','','03/02/2000','','','',9,NULL,NULL),(10,'ICEDSKDSK00008','MLL','2002-11-06',NULL,0,0,0,0,0,0,0,'','','2002-11-06',1,1,207250,0,'','','48','','','',0,29,0,'2019-02-20 08:05:18','0','','','','','','','','11/06/2002','','','',10,NULL,NULL),(11,'ICELAPLAP00001','NEAT TECHNOLOGY PTE LTDSINGAPORE-I/','1997-12-18',NULL,0,0,0,0,0,0,0,'','','1997-12-18',1,1,286980.05,0,'','','48','','','',0,32,0,'2019-02-20 09:11:22','0','','','','','','','','12/18/1997','','','',11,NULL,NULL),(12,'ICELAPLAP00002','FROM SINGAPORE','2004-05-03',NULL,0,0,0,0,0,0,0,'','','2004-05-03',1,1,126300,0,'','','48','','','',0,32,0,'2019-02-20 09:40:40','0','','','','','','','','05/03/2004','','','',12,NULL,NULL),(13,'ICEMONMON00001','','2005-08-15',NULL,0,0,0,0,0,0,0,'','','2005-08-15',1,1,69900,0,'','','48','','','',0,30,0,'2019-02-20 10:00:31','0','','','','','','','','08/15/2005','','','',13,NULL,NULL),(14,'ICEACCPED00001','FROM SINGAPORE','2005-08-15',NULL,0,0,0,0,0,0,0,'','','2005-08-15',1,1,4074,0,'','','48','','','',0,33,0,'2019-02-20 10:42:22','0','','','','','','','','08/15/2005','','','',14,NULL,NULL),(15,'ICEDSKDSK00009','NEAT LANKA (PVT) LTD.I/N IG156891','2005-10-05',NULL,0,0,0,0,0,0,0,'','','2005-10-05',1,1,62250.5,0,'','','48','','','',0,29,0,'2019-02-20 11:45:29','0','','','','','','','','','','','',15,NULL,NULL),(16,'ICEUPSUPS00001','NEAT LANKA (PVT) LTD.I/N IG156892','2005-10-05',NULL,0,0,0,0,0,0,0,'','','2005-10-05',1,1,4000,0,'','','48','','','',0,25,0,'2019-02-20 11:47:21','0','','','','','','','','','','','',16,NULL,NULL),(17,'ICEACCPED00002','TECH SYSTEMS-I/N 8997','2006-01-12',NULL,0,0,0,0,0,0,0,'','','2006-01-12',1,1,2500,0,'','','48','','','',0,33,0,'2019-02-20 11:54:11','0','','','','','','','','01/12/2006','','','',17,NULL,NULL),(18,'ICEMONMON00002','NEAT LANKA (PVT) LTD.I/N IG167100','2006-05-29',NULL,0,0,0,0,0,0,0,'','','2006-05-29',1,1,9000,0,'','','48','','','',0,30,0,'2019-02-21 02:54:44','0','','','','','','','','05/29/2006','','','',18,NULL,NULL),(19,'ICEPRIPRI00003','NEAT LANKA (PVT) LTD.I/N IG164222','2006-05-29',NULL,0,0,0,0,0,0,0,'','','2006-05-29',1,1,19500,0,'','','48','','','',0,28,0,'2019-02-21 03:00:36','0','','','','','','','','05/29/2006','','','',19,NULL,NULL),(20,'ICELAPLAP00003','METROPOLITAN COMPUTERS','2009-11-24',NULL,0,0,0,0,0,0,0,'','','2009-11-24',1,1,88020,0,'','','48','','','',0,32,0,'2019-02-21 03:15:15','0','','','','','','','','11/24/2009','','','',20,NULL,NULL),(21,'ICEMONMON00003','','2011-09-08',NULL,0,0,0,0,0,0,0,'','','2011-09-08',2,1,14000,0,'','','48','','','',0,30,0,'2019-02-21 04:19:51','0','','','','','','','','09/08/2011','','','',21,NULL,NULL),(22,'ICEMONMON00004','','2011-09-08',NULL,0,0,0,0,0,0,0,'','','2011-09-08',2,1,14000,0,'','','48','','','',0,30,0,'2019-02-21 04:19:51','0','','','','','','','','09/08/2011','','','',21,NULL,NULL),(23,'ICELAPLAP00004','','2011-09-08',NULL,0,0,0,0,0,0,0,'','','2011-09-08',2,1,58000,0,'','','48','','','',0,32,0,'2019-02-21 04:25:05','0','','','','','','','','09/08/2011','','','',22,NULL,NULL),(24,'ICELAPLAP00005','','2011-09-08',NULL,0,0,0,0,0,0,0,'','','2011-09-08',2,1,58000,0,'','','48','','','',0,32,0,'2019-02-21 04:25:05','0','','','','','','','','09/08/2011','','','',22,NULL,NULL),(25,'ICEDSKDSK00010','METROPOLITAN OFFICE (PVT) LTD.','2011-09-08',NULL,0,0,0,0,0,0,0,'','','2011-09-08',2,1,57000,0,'','','48','','','',0,29,0,'2019-02-21 04:35:19','0','','','','','','','','09/08/2011','','','',23,NULL,NULL),(26,'ICEDSKDSK00011','METROPOLITAN OFFICE (PVT) LTD.','2011-09-08',NULL,0,0,0,0,0,0,0,'','','2011-09-08',2,1,57000,0,'','','48','','','',0,29,0,'2019-02-21 04:35:19','0','','','','','','','','09/08/2011','','','',23,NULL,NULL),(27,'ICELAPLAP00006','TECH ZONE','2012-09-25',NULL,0,0,0,0,0,0,0,'','','2012-09-25',1,1,78650,0,'','','48','','','',0,32,0,'2019-02-21 04:44:58','0','','','','','','','','09/25/2012','','','',24,NULL,NULL),(28,'ICEPRIPRI00004','OFFICE NETWORKS (PVT) LTD.','2013-12-18',NULL,0,0,0,0,0,0,0,'','','2013-12-18',1,1,10350,0,'','','48','','','',0,28,0,'2019-02-21 06:46:13','0','','','','','','','','12/18/2013','','','',25,NULL,NULL),(29,'ICELAPLAP00007','METROPOLITAN OFFICE (PVT) LTD','2014-09-22',NULL,0,0,0,0,0,0,0,'','','2014-09-22',1,1,86236,0,'','','48','','','',0,32,0,'2019-02-21 06:53:31','0','','','','','','','','09/22/2014','','','',26,NULL,NULL),(30,'ICETBCTBC00001','','2015-03-10',NULL,0,0,0,0,0,0,0,'','','2015-03-10',1,1,87372,0,'','','48','','','',0,49,0,'2019-02-21 07:13:31','0','','','','','','','','03/10/2015','','','',27,NULL,NULL),(31,'ICELAPLAP00008','METROPOLITAN - INV. NO. 1I959184   ','2018-09-28',NULL,0,0,0,0,0,0,0,'','','2018-09-28',5,1,78000,0,'','','48','','','',0,32,0,'2019-02-21 07:56:57','0','','','','','','','','09/28/2018','','','',28,NULL,NULL),(32,'ICELAPLAP00009','METROPOLITAN - INV. NO. 1I959184   ','2018-09-28',NULL,0,0,0,0,0,0,0,'','','2018-09-28',5,1,78000,0,'','','48','','','',0,32,0,'2019-02-21 07:56:57','0','','','','','','','','09/28/2018','','','',28,NULL,NULL),(33,'ICELAPLAP00010','METROPOLITAN - INV. NO. 1I959184   ','2018-09-28',NULL,0,0,0,0,0,0,0,'','','2018-09-28',5,1,78000,0,'','','48','','','',0,32,0,'2019-02-21 07:56:57','0','','','','','','','','09/28/2018','','','',28,NULL,NULL),(34,'ICELAPLAP00011','METROPOLITAN - INV. NO. 1I959184   ','2018-09-28',NULL,0,0,0,0,0,0,0,'','','2018-09-28',5,1,78000,0,'','','48','','','',0,32,0,'2019-02-21 07:56:57','0','','','','','','','','09/28/2018','','','',28,NULL,NULL),(35,'ICELAPLAP00012','METROPOLITAN - INV. NO. 1I959184   ','2018-09-28',NULL,0,0,0,0,0,0,0,'','','2018-09-28',5,1,78000,0,'','','48','','','',0,32,0,'2019-02-21 07:56:57','0','','','','','','','','09/28/2018','','','',28,NULL,NULL),(36,'ICELAPLAP00013','METROPOLITAN - INV. NO. 1I959186   ','2018-09-28',NULL,0,0,0,0,0,0,0,'','','2018-09-28',1,1,78000,0,'','','48','','','',0,32,0,'2019-02-21 08:23:37','0','','','','','','','','09/28/2018','','','',29,NULL,NULL),(37,'ICELAPLAP00014','METROPOLITAN - INV. NO. 1I959186','2018-09-28',NULL,0,0,0,0,0,0,0,'','','2018-09-28',1,1,78000,0,'','','48','','','',0,32,0,'2019-02-21 09:40:40','0','','','','','','','','09/28/2018','','','',30,NULL,NULL),(38,'ICELAPLAP00015','METROPOLITAN - INV. NO. 1I9591846  ','2018-09-28',NULL,0,0,0,0,0,0,0,'','','2018-09-28',2,1,71000,0,'','','48','','','',0,32,0,'2019-02-21 09:53:03','0','','','','','','','','09/28/2018','','','',31,NULL,NULL),(39,'ICELAPLAP00016','METROPOLITAN - INV. NO. 1I9591846  ','2018-09-28',NULL,0,0,0,0,0,0,0,'','','2018-09-28',2,1,71000,0,'','','48','','','',0,32,0,'2019-02-21 09:53:03','0','','','','','','','','09/28/2018','','','',31,NULL,NULL),(40,'ICELAPLAP00017','METROPOLITAN - INV. NO.1I959257','2018-10-03',NULL,0,0,0,0,0,0,1,'','','2018-10-03',1,1,160000,0,'','','48','','','',0,32,0,'2019-02-27 08:05:12','0','','','','','','','','10/03/2018','','','',32,NULL,NULL),(41,'OFEPROPRO00001','METROPOLITAN - INV. NO.1I959257','2018-10-03',NULL,0,0,0,0,0,0,0,'','','2018-10-03',1,1,58000,0,'','','48','','','',0,41,0,'2019-02-27 08:43:10','0','','','','','','','','10/03/2018','','','',33,NULL,NULL),(42,'OFEPCMPCM00001','FINTEK - INV. NO.3147 S/N. 5324','2018-10-11',NULL,0,0,0,0,0,0,0,'','','2018-10-11',1,1,112608,0,'','','48','','','',0,39,0,'2019-02-27 08:47:22','0','','','','','','','','10/11/2018','','','',34,NULL,NULL),(43,'FRFOFCSFC00001',' MODERN ENGINE.WORKS I/N 970','1992-12-01',NULL,0,0,0,0,0,0,0,'','','1992-12-01',1,1,4000,0,'','','36','','','',0,18,0,'2019-02-27 09:39:33','0','','','','','','','','12/01/1992','','','',35,NULL,NULL),(44,'FRFOFCSTC00001','D.K.MODY & CO.LTD.B/N 81818','1994-06-16',NULL,0,0,0,0,0,0,0,'','','1994-06-16',1,1,5415,0,'','','36','','','',0,16,0,'2019-02-27 09:43:27','0','','','','','','','','06/16/1994','','','',36,NULL,NULL),(45,'OFEAIC0100001',' MODSPOT','1995-07-29',NULL,0,0,0,0,0,0,0,'','','1995-07-29',1,1,43000,0,'','','36','','','',0,37,0,'2019-02-27 09:52:49','0','','','','','','','','07/29/1995','','','',37,NULL,NULL),(46,'OFEELIFAN00001',' MODSPOT-17.07.96','1996-07-17',NULL,0,0,0,0,0,1,0,'','','1996-07-17',1,1,3800,0,'','','36','','','',0,43,0,'2019-02-27 10:04:08','0','','','','','','','','07/17/1996','','','',38,NULL,NULL),(47,'ICEUPSUPS00002',' I.E. TECHNICS (PVT) LTD ','1997-03-04',NULL,0,0,0,0,0,0,0,'','','1997-03-04',1,1,12895,0,'','','36','','','',0,25,0,'2019-02-27 10:11:19','0','','','','','','','','03/04/1997','','','',39,NULL,NULL),(48,'FRFOFCFIC00001',' MODERN ENGINE.WORKS I/N 82','1999-07-16',NULL,0,0,0,0,0,1,0,'','','1999-07-16',1,1,13425,0,'','','36','','','',0,19,0,'2019-02-27 10:24:35','0','','','','','','','','07/16/1999','','','',40,NULL,NULL),(49,'OFEAIC0100002','ABANS -31.03.04','2004-03-31',NULL,0,0,0,0,0,0,0,'','','2004-03-31',1,1,23325,0,'','','36','','','',0,37,0,'2019-02-27 10:30:00','0','','','','','','','','03/31/2004','','','',41,NULL,NULL),(50,'ICEACCCAM00001','SIEDLES  (PVT) LTD.','2005-06-24',NULL,0,0,0,0,0,0,0,'','','2005-06-24',1,1,46703.54,0,'','','36','','','',0,50,0,'2019-02-27 10:59:38','0','','','','','','','','06/24/2005','','','',42,NULL,NULL),(51,'OFEAIC0100003','ABANS LTD. I/N 297471','2005-07-20',NULL,0,0,0,0,0,0,0,'','','2005-07-20',1,1,42500,0,'','','36','','','',0,37,0,'2019-02-27 11:42:27','0','','','','','','','','07/20/2005','','','',43,NULL,NULL),(52,'OFEELIFAN00002','PRIYANTHA TRADING I/N 1725/10218','2005-08-22',NULL,0,0,0,0,0,0,0,'','','2005-08-22',1,1,2500,0,'','','36','','','',0,43,0,'2019-02-28 03:09:47','0','','','','','','','','08/22/2005','','','',44,NULL,NULL),(53,'OFEELIELK00001','PRIYANTHA TRADING I/N 1725/10218','2005-08-22',NULL,0,0,0,0,1,0,0,'','','2005-08-22',1,1,1240,0,'','','36','','','',0,44,0,'2019-02-28 03:29:05','0','','','','','','','','08/22/2005','','','',45,NULL,NULL),(54,'OFEELIVAC00001','ABANS (PVT) LTD','2012-01-10',NULL,0,0,0,0,0,0,0,'','','2012-01-10',1,1,8897.32,0,'','','36','','','',0,45,0,'2019-02-28 03:42:40','0','','','','','','','','01/10/2012','','','',46,NULL,NULL),(55,'OFEAIC0100004','ABANS (PVT) LTD\r\n','2015-04-04',NULL,0,0,0,0,0,0,0,'','','2015-04-04',1,1,182665,0,'','','36','','','',0,37,0,'2019-02-28 03:52:58','0','','','','','','','','04/04/2015','','','',47,NULL,NULL),(56,'OFEWAFWAF00001','AMERICAN WATER-FILTER','2015-06-24',NULL,0,0,0,0,0,0,0,'','','2015-06-24',1,1,22500,0,'','','36','','','',0,40,0,'2019-02-28 04:21:03','0','','','','','','','','06/24/2015','','','',48,NULL,NULL),(57,'OFEAIC0100005','DAMRO-AIR CONDITIONER','2015-08-18',NULL,0,0,0,0,0,0,0,'','','2015-08-18',1,1,98100,0,'','','36','','','',0,37,0,'2019-02-28 04:34:02','0','','','','','','','','08/18/2015','','','',49,NULL,NULL),(58,'ICEPHOPHO00001','ABANS (PVT) LTD- I-PHONE','2015-12-10',NULL,0,0,0,0,0,0,0,'','','2015-12-10',1,1,134991,0,'','','36','','','',0,26,0,'2019-02-28 04:41:53','0','','','','','','','','12/10/2015','','','',50,NULL,NULL),(59,'ICEPHOPHO00002','RANGA SHOPPING CENTRE-SAMSUG J3','2016-08-25',NULL,0,0,0,0,0,0,0,'','','2016-08-25',1,1,18900,0,'','','36','','','',0,26,0,'2019-02-28 04:48:31','0','','','','','','','','08/25/2016','','','',51,NULL,NULL),(60,'OFEAIC0100006','ABANCE  PLC - REF. NO. RPND-CS-0924','2018-09-29',NULL,0,0,0,0,0,0,0,'','','2018-09-29',1,1,164990.5,0,'','','36','','','',0,37,0,'2019-02-28 04:59:25','0','','','','','','','','09/29/2018','','','',52,NULL,NULL),(61,'ICEPHOPHO00003','ABANCE  PLC - REF. NO. RPND-CS-0924','2018-09-29',NULL,0,0,0,0,0,0,0,'','','2018-09-29',1,1,79999,0,'','','36','','','',0,26,0,'2019-02-28 05:45:02','0','','','','','','','','09/29/2018','','','',53,NULL,NULL),(62,'OFECTVCTV00001','DEBUG COMPUTER - INV. NO. DE/101/SI','2018-12-03',NULL,0,0,0,0,0,0,0,'','','2018-12-03',1,1,54089.77,0,'','','36','','','',0,38,0,'2019-02-28 05:54:07','0','','','','','','','','12/03/2018','','','',54,NULL,NULL),(63,'OFEELIELA00001','BROWN & COMPANY - INV. NO. SOIN216 ','2018-12-18',NULL,0,0,0,0,0,0,0,'','','2018-12-18',1,1,2990,0,'','','36','','','',0,42,0,'2019-02-28 06:16:16','0','','','','','','','','12/18/2018','','','',55,NULL,NULL),(64,'ICEACCCDP00001','BROWN & COMPANY - INV. NO. SOIN216 ','2018-12-18',NULL,0,0,0,0,0,0,0,'','','2018-12-18',1,1,7990,0,'','','36','','','',0,52,0,'2019-02-28 06:23:54','0','','','','','','','','12/18/2018','','','',56,NULL,NULL),(65,'ICEPHOPOB00001','BROWN & COMPANY - INV. NO. SOIN216 ','2018-12-18',NULL,0,0,0,0,0,0,0,'','','2018-12-18',1,1,3990,0,'','','36','','','',0,27,0,'2019-02-28 06:30:37','0','','','','','','','','12/18/2018','','','',57,NULL,NULL),(66,'FRFTABSYO00001',' MODERN ENGINE.WORKS I/N 534','1992-11-20',NULL,0,0,0,0,0,0,0,'','','1992-11-20',1,1,6000,0,'','','36','','','',0,7,0,'2019-02-28 06:48:35','0','','','','','','','','11/20/1992','','','',58,NULL,NULL),(67,'FRFTABSYO00002',' SEMAGE & CO., B/N 01073','1992-11-19',NULL,0,0,0,0,0,0,0,'','','1992-11-19',1,1,495,0,'','','36','','','',0,7,0,'2019-02-28 06:57:26','0','','','','','','','','11/19/1992','','','',59,NULL,NULL),(68,'FRFCHASYO00001',' RICHARD PIERIS','1995-07-08',NULL,0,0,0,0,0,0,0,'','','1995-07-08',6,1,650,0,'','','36','','','',0,12,0,'2019-02-28 07:02:41','0','','','','','','','','07/08/1995','','','',60,NULL,NULL),(69,'FRFCHASYO00002',' RICHARD PIERIS','1995-07-08',NULL,0,0,0,0,0,0,0,'','','1995-07-08',6,1,650,0,'','','36','','','',0,12,0,'2019-02-28 07:02:41','0','','','','','','','','07/08/1995','','','',60,NULL,NULL),(70,'FRFCHASYO00003',' RICHARD PIERIS','1995-07-08',NULL,0,0,0,0,0,0,0,'','','1995-07-08',6,1,650,0,'','','36','','','',0,12,0,'2019-02-28 07:02:41','0','','','','','','','','07/08/1995','','','',60,NULL,NULL),(71,'FRFCHASYO00004',' RICHARD PIERIS','1995-07-08',NULL,0,0,0,0,0,0,0,'','','1995-07-08',6,1,650,0,'','','36','','','',0,12,0,'2019-02-28 07:02:41','0','','','','','','','','07/08/1995','','','',60,NULL,NULL),(72,'FRFCHASYO00005',' RICHARD PIERIS','1995-07-08',NULL,0,0,0,0,0,0,0,'','','1995-07-08',6,1,650,0,'','','36','','','',0,12,0,'2019-02-28 07:02:41','0','','','','','','','','07/08/1995','','','',60,NULL,NULL),(73,'FRFCHASYO00006',' RICHARD PIERIS','1995-07-08',NULL,0,0,0,0,0,0,0,'','','1995-07-08',6,1,650,0,'','','36','','','',0,12,0,'2019-02-28 07:02:41','0','','','','','','','','07/08/1995','','','',60,NULL,NULL),(74,'FRFTABSYO00003',' NEMICO INDUSTRIES- B/N 01253','1995-07-08',NULL,0,0,0,0,0,0,0,'','','1995-07-08',2,1,3330,0,'','','36','','','',0,7,0,'2019-02-28 07:06:45','0','','','','','','','','07/08/1995','','','',61,NULL,NULL),(75,'FRFTABSYO00004',' NEMICO INDUSTRIES- B/N 01253','1995-07-08',NULL,0,0,0,0,0,0,0,'','','1995-07-08',2,1,3330,0,'','','36','','','',0,7,0,'2019-02-28 07:06:45','0','','','','','','','','07/08/1995','','','',61,NULL,NULL),(76,'FRFOFCSTC00002','NEMICO INDUSTRIES B/N 03303','1996-01-08',NULL,0,0,0,0,0,0,0,'','','1996-01-08',1,1,4950,0,'','','36','','','',0,16,0,'2019-02-28 07:11:56','0','','','','','','','','01/08/1996','','','',62,NULL,NULL),(77,'FRFCHASYO00007',' NEMICO INDUSTRIES B/N 03304-ARM CH','1996-01-08',NULL,0,0,0,0,0,0,0,'','','1996-01-08',3,1,666,0,'','','36','','','',0,12,0,'2019-02-28 07:16:24','0','','','','','','','','01/08/1996','','','',63,NULL,NULL),(78,'FRFCHASYO00008',' NEMICO INDUSTRIES B/N 03304-ARM CH','1996-01-08',NULL,0,0,0,0,0,0,0,'','','1996-01-08',3,1,666,0,'','','36','','','',0,12,0,'2019-02-28 07:16:24','0','','','','','','','','01/08/1996','','','',63,NULL,NULL),(79,'FRFCHASYO00009',' NEMICO INDUSTRIES B/N 03304-ARM CH','1996-01-08',NULL,0,0,0,0,0,0,0,'','','1996-01-08',3,1,666,0,'','','36','','','',0,12,0,'2019-02-28 07:16:24','0','','','','','','','','01/08/1996','','','',63,NULL,NULL),(80,'FRFCSBCSB00001','NEMICO INDUSTRIES B/N 03304','1996-01-08',NULL,0,0,0,0,0,0,0,'','','1996-01-08',1,1,720,0,'','','36','','','',0,53,0,'2019-02-28 07:29:33','0','','','','','','','','01/08/1996','','','',64,NULL,NULL),(81,'FRFOFCSTC00003',' NEMICO INDUSTRIES','1996-04-24',NULL,0,0,0,0,0,0,0,'','','1996-04-24',1,1,5535,0,'','','36','','','',0,16,0,'2019-02-28 07:43:30','0','','','','','','','','04/24/1996','','','',65,NULL,NULL),(82,'FRFOFCSTC00004','GRIP ENGINEERS','1998-07-11',NULL,0,0,0,0,0,0,0,'','','1998-07-11',1,1,5777.02,0,'','','36','','','',0,16,0,'2019-02-28 07:57:47','0','','','','','','','','07/11/1998','','','',66,NULL,NULL),(83,'FRFTABSYO00005','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(84,'FRFTABSYO00006','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(85,'FRFTABSYO00007','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(86,'FRFTABSYO00008','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(87,'FRFTABSYO00009','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(88,'FRFTABSYO00010','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(89,'FRFTABSYO00011','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(90,'FRFTABSYO00012','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(91,'FRFTABSYO00013','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(92,'FRFTABSYO00014','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(93,'FRFTABSYO00015','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(94,'FRFTABSYO00016','MADE BY NCS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',12,1,1965.875,0,'','','36','','','',0,7,0,'2019-02-28 08:07:52','0','','','','','','','','03/31/2001','','','',67,NULL,NULL),(95,'FRFLECLEC00001','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(96,'FRFLECLEC00002','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(97,'FRFLECLEC00003','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(98,'FRFLECLEC00004','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(99,'FRFLECLEC00005','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(100,'FRFLECLEC00006','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(101,'FRFLECLEC00007','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(102,'FRFLECLEC00008','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(103,'FRFLECLEC00009','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(104,'FRFLECLEC00010','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(105,'FRFLECLEC00011','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(106,'FRFLECLEC00012','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(107,'FRFLECLEC00013','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(108,'FRFLECLEC00014','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(109,'FRFLECLEC00015','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(110,'FRFLECLEC00016','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(111,'FRFLECLEC00017','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(112,'FRFLECLEC00018','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(113,'FRFLECLEC00019','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(114,'FRFLECLEC00020','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(115,'FRFLECLEC00021','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(116,'FRFLECLEC00022','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(117,'FRFLECLEC00023','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(118,'FRFLECLEC00024','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(119,'FRFLECLEC00025','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(120,'FRFLECLEC00026','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(121,'FRFLECLEC00027','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(122,'FRFLECLEC00028','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(123,'FRFLECLEC00029','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(124,'FRFLECLEC00030','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(125,'FRFLECLEC00031','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(126,'FRFLECLEC00032','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(127,'FRFLECLEC00033','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(128,'FRFLECLEC00034','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(129,'FRFLECLEC00035','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(130,'FRFLECLEC00036','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(131,'FRFLECLEC00037','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(132,'FRFLECLEC00038','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(133,'FRFLECLEC00039','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(134,'FRFLECLEC00040','MADE BY NCS- LEXTURE CHAIRS','2001-03-31',NULL,0,0,0,0,0,0,0,'','','2001-03-31',40,1,750,0,'','','36','','','',0,54,0,'2019-02-28 08:18:08','0','','','','','','','','03/31/2001','','','',68,NULL,NULL),(135,'FRFCHAVIS00001','DAMRO  -CHAIRS','2004-03-31',NULL,0,0,0,0,0,0,0,'','','2004-03-31',1,1,15179.25,0,'','','36','','','',0,14,0,'2019-02-28 08:28:55','0','','','','','','','','03/31/2004','','','',69,NULL,NULL),(136,'FRFOFCSTC00005','SADANA ENTERPRISES I/N 9/11','2005-09-06',NULL,0,0,0,0,0,0,0,'','','2005-09-06',3,1,7600,0,'','','36','','','',0,16,0,'2019-02-28 08:45:55','0','','','','','','','','09/06/2005','','','',70,NULL,NULL),(137,'FRFOFCSTC00006','SADANA ENTERPRISES I/N 9/11','2005-09-06',NULL,0,0,0,0,0,0,0,'','','2005-09-06',3,1,7600,0,'','','36','','','',0,16,0,'2019-02-28 08:45:55','0','','','','','','','','09/06/2005','','','',70,NULL,NULL),(138,'FRFOFCSTC00007','SADANA ENTERPRISES I/N 9/11','2005-09-06',NULL,0,0,0,0,0,0,0,'','','2005-09-06',3,1,7600,0,'','','36','','','',0,16,0,'2019-02-28 08:45:55','0','','','','','','','','09/06/2005','','','',70,NULL,NULL),(139,'FRFTABMAG00001','SHERMAN SONS LTD. I/N25917','2005-12-10',NULL,0,0,0,0,0,0,0,'','','2005-12-10',1,1,7000,0,'','','36','','','',0,6,0,'2019-02-28 08:48:09','0','','','','','','','','12/10/2005','','','',71,NULL,NULL),(140,'FRFOFCSTC00008','UNISONIC -CUPBOARD','2007-07-02',NULL,0,0,0,0,0,0,0,'','','2007-07-02',1,1,7517.39,0,'','','36','','','',0,16,0,'2019-02-28 08:52:25','0','','','','','','','','07/02/2007','','','',72,NULL,NULL),(141,'FRFOFC4DC00001','ALFA -Cupboard','2010-12-01',NULL,0,0,0,0,0,0,0,'','','2010-12-01',1,1,29545,0,'','','36','','','',0,17,0,'2019-02-28 08:58:00','0','','','','','','','','12/01/2010','','','',73,NULL,NULL),(142,'FRFRACFIL00001','DAMRO FILLING RACKS','2012-02-03',NULL,0,0,0,0,0,0,0,'','','2012-02-03',1,1,40089.28,0,'','','36','','','',0,21,0,'2019-02-28 09:45:53','0','','','','','','','','02/03/2012','','','',74,NULL,NULL),(143,'FRFRACBOK00001','FILLING RACKS','2012-07-16',NULL,0,0,0,0,0,0,0,'','','2012-07-16',2,1,12200,0,'','','36','','','',0,22,0,'2019-02-28 09:53:27','0','','','','','','','','07/16/2012','','','',75,NULL,NULL),(144,'FRFRACBOK00002','FILLING RACKS','2012-07-16',NULL,0,0,0,0,0,0,0,'','','2012-07-16',2,1,12200,0,'','','36','','','',0,22,0,'2019-02-28 09:53:27','0','','','','','','','','07/16/2012','','','',75,NULL,NULL),(145,'FRFRACFIL00002','DAMRO FILLING RACKS','2012-12-28',NULL,0,0,0,0,0,0,0,'','','2012-12-28',1,1,6160.71,0,'','','36','','','',0,21,0,'2019-02-28 09:58:39','0','','','','','','','','12/28/2012','','','',76,NULL,NULL),(146,'FRFCHAMAG00001','DAMRO-LOW BACK CHAIR','2015-08-15',NULL,0,0,0,0,0,0,0,'','','2015-08-15',2,1,11677.5,0,'','','36','','','',0,11,0,'2019-02-28 10:03:06','0','','','','','','','','08/15/2015','','','',77,NULL,NULL),(147,'FRFCHAMAG00002','DAMRO-LOW BACK CHAIR','2015-08-15',NULL,0,0,0,0,0,0,0,'','','2015-08-15',2,1,11677.5,0,'','','36','','','',0,11,0,'2019-02-28 10:03:06','0','','','','','','','','08/15/2015','','','',77,NULL,NULL),(148,'FRFCHASYO00010','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',10,1,7987.5,0,'','','36','','','',0,12,0,'2019-02-28 10:20:54','0','','','','','','','','10/02/2018','','','',78,NULL,NULL),(149,'FRFCHASYO00011','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',10,1,7987.5,0,'','','36','','','',0,12,0,'2019-02-28 10:20:54','0','','','','','','','','10/02/2018','','','',78,NULL,NULL),(150,'FRFCHASYO00012','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',10,1,7987.5,0,'','','36','','','',0,12,0,'2019-02-28 10:20:54','0','','','','','','','','10/02/2018','','','',78,NULL,NULL),(151,'FRFCHASYO00013','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',10,1,7987.5,0,'','','36','','','',0,12,0,'2019-02-28 10:20:54','0','','','','','','','','10/02/2018','','','',78,NULL,NULL),(152,'FRFCHASYO00014','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',10,1,7987.5,0,'','','36','','','',0,12,0,'2019-02-28 10:20:54','0','','','','','','','','10/02/2018','','','',78,NULL,NULL),(153,'FRFCHASYO00015','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',10,1,7987.5,0,'','','36','','','',0,12,0,'2019-02-28 10:20:54','0','','','','','','','','10/02/2018','','','',78,NULL,NULL),(154,'FRFCHASYO00016','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',10,1,7987.5,0,'','','36','','','',0,12,0,'2019-02-28 10:20:54','0','','','','','','','','10/02/2018','','','',78,NULL,NULL),(155,'FRFCHASYO00017','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',10,1,7987.5,0,'','','36','','','',0,12,0,'2019-02-28 10:20:54','0','','','','','','','','10/02/2018','','','',78,NULL,NULL),(156,'FRFCHASYO00018','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',10,1,7987.5,0,'','','36','','','',0,12,0,'2019-02-28 10:20:54','0','','','','','','','','10/02/2018','','','',78,NULL,NULL),(157,'FRFCHASYO00019','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',10,1,7987.5,0,'','','36','','','',0,12,0,'2019-02-28 10:20:54','0','','','','','','','','10/02/2018','','','',78,NULL,NULL),(158,'FRFCHADIR00001','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',1,1,14917.5,0,'','','36','','','',0,10,0,'2019-02-28 10:28:56','0','','','','','','','','10/02/2018','','','',79,NULL,NULL),(159,'FRFCHAMAG00003','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',2,1,16177.5,0,'','','36','','','',0,11,0,'2019-02-28 10:44:09','0','','','','','','','','10/02/2018','','','',80,NULL,NULL),(160,'FRFCHAMAG00004','DAMRO - INV. NO. SI-1390-039828','2018-10-02',NULL,0,0,0,0,0,0,0,'','','2018-10-02',2,1,16177.5,0,'','','36','','','',0,11,0,'2019-02-28 10:44:09','0','','','','','','','','10/02/2018','','','',80,NULL,NULL),(161,'OFPOFPOFP00001','PANADURA OFFICE-PARTITION','2005-07-12',NULL,0,0,0,0,0,0,0,'','','2005-07-12',1,1,126270.22,0,'','','36','','','',0,46,0,'2019-02-28 10:47:18','0','','','','','','','','07/12/2005','','','',81,NULL,NULL),(162,'OFPOFPOFP00002','PANADURA OFFICE-PARTITION-02','2008-02-28',NULL,0,0,0,0,0,0,0,'','','2008-02-28',1,1,185000,0,'','','36','','','',0,46,0,'2019-02-28 10:49:11','0','','','','','','','','02/28/2008','','','',82,NULL,NULL),(163,'VEHCARCAR00001','PEOPLES LEASING CO.-KG 1619','2009-10-28',NULL,0,0,0,0,0,0,0,'','','2009-10-28',1,1,1300000,0,'','','36','','','',0,47,0,'2019-02-28 10:54:24','0','','','','','','','','10/28/2009','','','',83,NULL,NULL),(164,'ICEACCVGA00001','SUPER  VGA CARD -SINGAPORE ','1999-02-12',NULL,0,0,0,0,0,0,0,'','','1999-02-12',1,1,903.2,0,'','','48','','','',0,55,0,'2019-02-28 11:15:25','0','','','','','','','','02/12/1999','','','',84,NULL,NULL),(165,'ICEACCHAD00001','SEAGATE 4.3GB HARD DISK','1999-02-12',NULL,0,0,0,0,0,0,0,'','','1999-02-12',1,1,10458.14,0,'','','48','','','',0,48,0,'2019-02-28 11:21:27','0','','','','','','','','02/12/1999','','','',85,NULL,NULL),(166,'ICEACCZID00001','LOMEGA ZIP DISK','1999-02-12',NULL,0,0,0,0,0,0,0,'','','1999-02-12',1,1,7130.55,0,'','','48','','','',0,56,0,'2019-02-28 11:31:20','0','','','','','','','','02/12/1999','','','',86,NULL,NULL),(167,'ICEACCHED00001','SINGAPORE - IN No.35448','1999-02-12',NULL,0,0,0,0,0,0,0,'','','1999-02-12',1,1,1140.89,0,'','','48','','','',0,57,0,'2019-02-28 11:52:42','0','','','','','','','','02/12/1999','','','',87,NULL,NULL),(168,'ICEACCSUD00001','SINGAPORE - IN No.35448-SUPER DISK','1999-02-12',NULL,0,0,0,0,0,0,0,'','','1999-02-12',1,1,4278.33,0,'','','48','','','',0,58,0,'2019-03-01 03:17:21','0','','','','','','','','02/12/1999','','','',88,NULL,NULL),(169,'ICEACCCAB00001','CO-AXIAL CABLE 50MTR','1999-02-12',NULL,0,0,0,0,0,0,0,'','','1999-02-12',1,1,1188.43,0,'','','48','','','',0,59,0,'2019-03-01 03:44:35','0','','','','','','','','02/12/1999','','','',89,NULL,NULL),(170,'ICEACCNEC00001','NETWORKING CARD PCI W/BNC','1999-02-12',NULL,0,0,0,0,0,0,0,'','','1999-02-12',1,1,6274.88,0,'','','48','','','',0,60,0,'2019-03-01 04:25:19','0','','','','','','','','02/12/1999','','','',90,NULL,NULL),(171,'ICEMONMON00005','14\" PHILIP DIGITAL MONITOR','1999-02-12',NULL,0,0,0,0,0,0,0,'','','1999-02-12',1,1,8794.35,0,'','','48','','','',0,30,0,'2019-03-01 04:27:50','0','','','','','','','','02/12/1999','','','',91,NULL,NULL),(172,'ICEACCSUD00002','SUPER DISK DRIVE','1999-02-12',NULL,0,0,0,0,0,0,0,'','','1999-02-12',1,1,6655.18,0,'','','48','','','',0,58,0,'2019-03-01 04:30:29','0','','','','','','','','02/12/1999','','','',92,NULL,NULL),(173,'ICEDSKDSK00012','NEAT TECHNOLOGY PTE LTD','1999-02-12',NULL,0,0,0,0,0,0,0,'','','1999-02-12',1,1,71305.5,0,'','','48','','','',0,29,0,'2019-03-01 04:38:32','0','','','','','','','','02/12/1999','','','',93,NULL,NULL);

/*Table structure for table `asset_catergory_detail` */

DROP TABLE IF EXISTS `asset_catergory_detail`;

CREATE TABLE `asset_catergory_detail` (
  `DCAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCAT_CODE` varchar(10) DEFAULT NULL,
  `DCAT_DES` varchar(250) DEFAULT NULL,
  `SCAT_ID` int(11) NOT NULL,
  `DEP_RATE_ACCOUNT` double DEFAULT NULL,
  `DEP_RATE_INCOME_TAX` double DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`DCAT_ID`),
  KEY `fk_asset_catergory_detail_asset_catergory_sub1_idx` (`SCAT_ID`),
  CONSTRAINT `fk_asset_catergory_detail_asset_catergory_sub1` FOREIGN KEY (`SCAT_ID`) REFERENCES `asset_catergory_sub` (`SCAT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `asset_catergory_detail` */

insert  into `asset_catergory_detail`(`DCAT_ID`,`DCAT_CODE`,`DCAT_DES`,`SCAT_ID`,`DEP_RATE_ACCOUNT`,`DEP_RATE_INCOME_TAX`,`USER_ID`,`ACTION_TIME`) values (5,'DIR','Director',1,15,15,2,'2019-02-14 11:01:17'),(6,'MAG','Manager',1,15,15,2,'2019-02-14 11:02:18'),(7,'SYO','System Operator',1,15,15,2,'2019-02-14 11:03:17'),(8,'MTG','Meeting',1,15,15,2,'2019-02-14 11:04:27'),(9,'WRT','Writing',1,15,15,2,'2019-02-14 11:05:34'),(10,'DIR','Director',2,15,15,2,'2019-02-14 11:15:21'),(11,'MAG','Manager',2,15,15,2,'2019-02-14 11:16:29'),(12,'SYO','System Operator',2,15,15,2,'2019-02-14 11:17:34'),(13,'MTG','Meeting',2,15,15,2,'2019-02-14 11:18:42'),(14,'VIS','Visitors',2,15,15,2,'2019-02-14 11:19:45'),(15,'2DC','2 drawers Cupboard -Steel',7,15,15,2,'2019-02-14 11:34:10'),(16,'STC','Steel Cupboard',7,15,15,2,'2019-02-14 11:34:38'),(17,'4DC','4 drawers Cupboard-Steel',7,15,15,2,'2019-02-14 11:35:23'),(18,'SFC','Steel Filing Cabinet  ',7,15,15,2,'2019-02-14 11:38:02'),(19,'FIC','Filing Cupboards',7,15,15,2,'2019-02-14 11:41:39'),(20,'TEC','Tea Cupboard',7,15,15,2,'2019-02-14 11:42:42'),(21,'FIL','Filling',5,15,15,2,'2019-02-14 11:47:04'),(22,'BOK','Book',5,15,15,2,'2019-02-14 11:47:45'),(23,'OTH','Other',5,15,15,2,'2019-02-14 11:48:17'),(24,'SCA','Scanners',8,15,15,2,'2019-02-15 02:50:23'),(25,'UPS','UPS',9,15,15,2,'2019-02-15 02:51:19'),(26,'PHO','Phones',10,15,15,2,'2019-02-15 02:52:51'),(27,'POB','Power Bank',10,15,15,2,'2019-02-15 03:30:52'),(28,'PRI','Printers',11,25,25,2,'2019-02-15 03:33:37'),(29,'DSK','Desktop',13,25,25,2,'2019-02-15 03:58:13'),(30,'MON','Monitors',25,25,25,2,'2019-02-15 04:02:46'),(31,'CPU','CPU',14,25,25,2,'2019-02-15 04:12:42'),(32,'LAP','Laptops',15,25,25,2,'2019-02-15 04:13:40'),(33,'PED','Pen drives',16,25,25,2,'2019-02-15 04:14:41'),(34,'KEB','Key board',16,25,25,2,'2019-02-15 04:18:01'),(35,'DOG','Dongles',16,25,25,2,'2019-02-15 04:19:44'),(36,'MOU','Mouse',16,25,25,2,'2019-02-15 04:21:03'),(37,'01','Air-Conditioners',17,15,15,2,'2019-02-15 04:25:29'),(38,'CTV','CCTV Camera & Equipment\'s',18,15,15,2,'2019-02-15 04:27:04'),(39,'PCM','Photo copy Machine',19,25,25,2,'2019-02-15 04:28:46'),(40,'WAF','Water Filter',20,15,15,2,'2019-02-15 04:31:01'),(41,'PRO','Projector',21,15,15,2,'2019-02-15 04:32:03'),(42,'ELA','Emergency Lantern',22,15,15,2,'2019-02-15 04:33:12'),(43,'FAN','Fan',22,15,15,2,'2019-02-15 04:34:18'),(44,'ELK','Electrical Kettle',22,15,15,2,'2019-02-15 04:35:37'),(45,'VAC','Vaccume Cleaner',22,15,15,2,'2019-02-15 04:38:34'),(46,'OFP','Office Partition',23,15,15,2,'2019-02-15 04:39:50'),(47,'CAR','Car (KG1619)',24,15,15,2,'2019-02-15 04:40:46'),(48,'HAD','Hard Disk',16,25,25,2,'2019-02-20 06:00:47'),(49,'TBC','TAB',26,25,25,2,'2019-02-21 07:07:26'),(50,'CAM','Camera',16,15,15,2,'2019-02-27 10:34:40'),(52,'CDP','CD Player',16,15,15,2,'2019-02-28 06:20:38'),(53,'CSB','Cash box',27,15,15,2,'2019-02-28 07:25:26'),(54,'LEC','Lexture Chairs',28,15,15,2,'2019-02-28 08:14:09'),(55,'VGA','VGA Card',16,25,25,2,'2019-02-28 11:10:41'),(56,'ZID','ZIP Disk',16,25,25,2,'2019-02-28 11:23:49'),(57,'HED','Headphone/Microphone',16,25,25,2,'2019-02-28 11:47:31'),(58,'SUD','Super Disk',16,25,25,2,'2019-03-01 03:10:05'),(59,'CAB','Cabels',16,25,25,2,'2019-03-01 03:30:45'),(60,'NEC','Networking Card',16,25,25,2,'2019-03-01 04:22:29'),(61,'LAN','Land-1',29,1,1,2,'2019-03-01 11:44:19'),(62,'LAB','Buil-Janapriya Mawatha',30,25,25,2,'2019-03-27 11:25:50');

/*Table structure for table `asset_catergory_detail_history` */

DROP TABLE IF EXISTS `asset_catergory_detail_history`;

CREATE TABLE `asset_catergory_detail_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DCAT_ID` int(11) NOT NULL,
  `DCAT_CODE` varchar(10) DEFAULT NULL,
  `DCAT_DES` varchar(100) DEFAULT NULL,
  `SCAT_ID` int(11) NOT NULL,
  `DEP_RATE_ACCOUNT` double DEFAULT NULL,
  `DEP_RATE_INCOME_TAX` double DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `STATUS` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `asset_catergory_detail_history` */

insert  into `asset_catergory_detail_history`(`ID`,`DCAT_ID`,`DCAT_CODE`,`DCAT_DES`,`SCAT_ID`,`DEP_RATE_ACCOUNT`,`DEP_RATE_INCOME_TAX`,`USER_ID`,`ACTION_TIME`,`UPDATE_TIME`,`UPDATE_USER`,`STATUS`) values (1,1,'DIR','Director',1,15,15,2,'2019-02-14 09:24:46','2019-02-14 10:32:00',2,0),(2,1,'DIR','DirectorP',1,15,15,2,'2019-02-14 10:32:00','2019-02-14 10:32:51',2,0),(3,3,'SYO','System Operator',1,15,15,2,'2019-02-14 10:48:01','2019-02-14 10:49:06',2,0),(4,3,'SYO','System Operator',1,15,16,2,'2019-02-14 10:49:06','2019-02-14 10:49:31',2,0),(5,4,'MTG','Meeting',1,15,15,2,'2019-02-14 10:48:50','2019-02-14 10:54:08',2,0),(6,1,'DIR','Director',1,15,15,2,'2019-02-14 10:32:51','2019-02-14 10:57:24',2,0),(7,1,'DIR','Director',1,15,15,2,'2019-02-14 10:57:24','2019-02-14 10:58:52',2,1),(8,2,'MAG','Manager',1,15,15,2,'2019-02-14 10:24:43','2019-02-14 10:58:56',2,1),(9,3,'SYO','System Operator',1,15,15,2,'2019-02-14 10:49:31','2019-02-14 10:58:59',2,1),(10,4,'MTG','Meeting',1,15,15,2,'2019-02-14 10:54:08','2019-02-14 10:59:02',2,1),(11,16,'STC','Steel Cupboards',7,15,15,2,'2019-02-14 11:24:37','2019-02-14 11:24:58',2,0),(12,15,'2DC','Steel 2 drawers Cupboard',7,15,15,2,'2019-02-14 11:23:42','2019-02-14 11:34:10',2,0),(13,16,'STC','Steel Cupboard',7,15,15,2,'2019-02-14 11:24:58','2019-02-14 11:34:38',2,0),(14,17,'4DC','Steel 4 drawers Cupboard',7,15,15,2,'2019-02-14 11:25:34','2019-02-14 11:35:23',2,0),(15,18,'SFC','Filing Cabinet -Steel',7,15,15,2,'2019-02-14 11:31:55','2019-02-14 11:36:11',2,0),(16,18,'SFC','Filing Cabinet -Steel',7,15,15,2,'2019-02-14 11:36:11','2019-02-14 11:38:02',2,0),(17,27,'POB','Power Bank',10,15,15,2,'2019-02-15 03:03:40','2019-02-15 03:22:07',2,0),(18,27,'POB','Power Bank',10,15,15,2,'2019-02-15 03:22:07','2019-02-15 03:30:52',2,0),(19,51,'AIC','Air-Conditioners',17,15,15,2,'2019-02-28 05:19:27','2019-02-28 05:59:46',2,1);

/*Table structure for table `asset_catergory_main` */

DROP TABLE IF EXISTS `asset_catergory_main`;

CREATE TABLE `asset_catergory_main` (
  `MCAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MCAT_CODE` varchar(10) NOT NULL,
  `MCAT_DES` varchar(250) DEFAULT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime NOT NULL,
  PRIMARY KEY (`MCAT_ID`),
  UNIQUE KEY `MainCat_unique` (`MCAT_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `asset_catergory_main` */

insert  into `asset_catergory_main`(`MCAT_ID`,`MCAT_CODE`,`MCAT_DES`,`USER_ID`,`ACTION_TIME`) values (1,'FRF','Furniture & Fittings',2,'2019-02-14 09:20:06'),(2,'ICE','ICT Equipments',2,'2019-02-14 10:00:00'),(3,'OFE','Office Equipments',2,'2019-02-14 09:32:35'),(4,'OFP','Office Partition',2,'2019-02-14 09:30:58'),(5,'VEH','Vehicle',2,'2019-02-14 09:31:33'),(6,'LAN','Land',2,'2019-03-01 11:32:23'),(7,'LAB','Land & building',2,'2019-03-27 11:18:47');

/*Table structure for table `asset_catergory_main_history` */

DROP TABLE IF EXISTS `asset_catergory_main_history`;

CREATE TABLE `asset_catergory_main_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MCAT_ID` int(11) NOT NULL,
  `MCAT_CODE` varchar(10) DEFAULT NULL,
  `MCAT_DES` varchar(100) DEFAULT NULL,
  `USER_ID` int(5) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `STATUS` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `asset_catergory_main_history` */

insert  into `asset_catergory_main_history`(`ID`,`MCAT_ID`,`MCAT_CODE`,`MCAT_DES`,`USER_ID`,`ACTION_TIME`,`UPDATE_TIME`,`UPDATE_USER`,`STATUS`) values (1,2,'ICE','ICT Equipment\'s',2,'2019-02-14 09:29:23','2019-02-14 09:29:48',2,0),(2,3,'OFE','Office Equipment',2,'2019-02-14 09:30:28','2019-02-14 09:32:25',2,0),(3,3,'OFE','Office Equipments',2,'2019-02-14 09:32:24','2019-02-14 09:32:35',2,0),(4,2,'ICE','ICT Equipments',2,'2019-02-14 09:29:48','2019-02-14 09:59:52',2,0),(5,2,'ICE','ICT Equipmentsp',2,'2019-02-14 09:59:52','2019-02-14 10:00:00',2,0);

/*Table structure for table `asset_catergory_sub` */

DROP TABLE IF EXISTS `asset_catergory_sub`;

CREATE TABLE `asset_catergory_sub` (
  `SCAT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SCAT_CODE` varchar(10) DEFAULT NULL,
  `MCAT_ID` int(11) NOT NULL,
  `SCAT_DES` varchar(250) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`SCAT_ID`),
  UNIQUE KEY `sub_unique` (`SCAT_CODE`,`MCAT_ID`),
  KEY `fk_asset_catergory_sub_asset_catergory_main1_idx` (`MCAT_ID`),
  CONSTRAINT `fk_asset_catergory_sub_asset_catergory_main1` FOREIGN KEY (`MCAT_ID`) REFERENCES `asset_catergory_main` (`MCAT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `asset_catergory_sub` */

insert  into `asset_catergory_sub`(`SCAT_ID`,`SCAT_CODE`,`MCAT_ID`,`SCAT_DES`,`USER_ID`,`ACTION_TIME`) values (1,'TAB',1,'Tables',2,'2019-02-14 09:20:47'),(2,'CHA',1,'Chairs',2,'2019-02-14 09:44:25'),(5,'RAC',1,'Racks',2,'2019-02-14 09:56:32'),(7,'OFC',1,'Office Cupboards',2,'2019-02-14 10:04:00'),(8,'SCA',2,'Scanners',2,'2019-02-14 10:06:33'),(9,'UPS',2,'UPS',2,'2019-02-14 10:07:01'),(10,'PHO',2,'Phones & Other',2,'2019-02-14 10:08:07'),(11,'PRI',2,'Printers',2,'2019-02-14 10:09:06'),(13,'DSK',2,'Desktops',2,'2019-02-14 10:11:48'),(14,'CPU',2,'CPU',2,'2019-02-14 10:12:23'),(15,'LAP',2,'Laptops',2,'2019-02-14 10:13:15'),(16,'ACC',2,'Accessories',2,'2019-02-14 10:14:15'),(17,'AIC',3,'Air-Conditioners',2,'2019-02-14 10:15:07'),(18,'CTV',3,'CCTV Camera & Equipment\'s',2,'2019-02-14 10:16:13'),(19,'PCM',3,'Photo Copy Machine',2,'2019-02-14 10:16:50'),(20,'WAF',3,'Water Filter',2,'2019-02-14 10:17:26'),(21,'PRO',3,'Projector',2,'2019-02-14 10:17:55'),(22,'ELI',3,'Electrical Items',2,'2019-02-14 10:18:41'),(23,'OFP',4,'Office Partition',2,'2019-02-14 10:19:50'),(24,'CAR',5,'Car (KG1619)',2,'2019-02-14 10:20:22'),(25,'MON',2,'Monitors',2,'2019-02-15 04:00:40'),(26,'TBC',2,'TAB',2,'2019-02-21 07:04:29'),(27,'CSB',1,'Cash box',2,'2019-02-28 07:23:26'),(28,'LEC',1,'Lexture Chairs',2,'2019-02-28 08:13:34'),(29,'LAN',6,'Land-Janapriya Mawatha',2,'2019-03-01 11:33:19'),(30,'LAB',7,'Bul -Janapriya Mawatha',2,'2019-03-27 11:20:27');

/*Table structure for table `asset_catergory_sub_history` */

DROP TABLE IF EXISTS `asset_catergory_sub_history`;

CREATE TABLE `asset_catergory_sub_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SCAT_ID` int(11) NOT NULL,
  `SCAT_CODE` varchar(10) DEFAULT NULL,
  `MCAT_ID` int(11) NOT NULL,
  `SCAT_DES` varchar(100) DEFAULT NULL,
  `USER_ID` int(5) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `STATUS` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `asset_catergory_sub_history` */

insert  into `asset_catergory_sub_history`(`ID`,`SCAT_ID`,`SCAT_CODE`,`MCAT_ID`,`SCAT_DES`,`USER_ID`,`ACTION_TIME`,`UPDATE_TIME`,`UPDATE_USER`,`STATUS`) values (1,0,'OFC',1,'Office Cupboard',2,'2019-02-14 09:49:47','2019-02-14 09:56:46',2,0),(2,0,'OFC',1,'Office Cupboard',2,'2019-02-14 09:49:47','2019-02-14 09:56:59',2,0),(3,0,'OFC',1,'Office Cupboard',2,'2019-02-14 09:49:47','2019-02-14 09:57:30',2,0),(4,0,'OFC',1,'Office Cupboard',2,'2019-02-14 09:49:47','2019-02-14 09:58:19',2,0),(5,0,'RAC',1,'Racks',2,'2019-02-14 09:56:32','2019-02-14 09:58:32',2,0),(6,0,'TAB',1,'Tables',2,'2019-02-14 09:20:47','2019-02-14 09:58:57',2,0),(7,0,'OFC',1,'Office Cupboard',2,'2019-02-14 09:49:47','2019-02-14 10:00:48',2,0),(8,0,'OFC',1,'Office Cupboard',2,'2019-02-14 09:49:47','2019-02-14 10:02:11',2,1),(9,0,'RAC',1,'Racks',2,'2019-02-14 09:56:32','2019-02-14 10:03:04',2,0),(10,0,'OFC',1,'Office Cupboard',2,'2019-02-14 10:02:45','2019-02-14 10:03:25',2,0),(11,0,'OFC',1,'Office Cupboard',2,'2019-02-14 10:02:45','2019-02-14 10:03:34',2,1),(12,0,'DSK',2,'Desktop',2,'2019-02-14 10:10:33','2019-02-14 10:10:54',2,0),(13,0,'DSK',2,'Desktop',2,'2019-02-14 10:10:33','2019-02-14 10:11:09',2,1),(14,0,'OFC',1,'Office Cupboards',2,'2019-02-14 10:04:00','2019-02-14 10:25:41',2,0),(15,0,'OFC',1,'Office Cupboards',2,'2019-02-14 10:04:00','2019-02-14 10:26:35',2,0),(16,0,'OFC',1,'Office Cupboards',2,'2019-02-14 10:04:00','2019-02-14 10:30:30',2,0);

/*Table structure for table `asset_detail` */

DROP TABLE IF EXISTS `asset_detail`;

CREATE TABLE `asset_detail` (
  `AS_ID` int(11) NOT NULL,
  `AUTH_PERSON` varchar(45) DEFAULT NULL,
  `PUR_DATE` date NOT NULL,
  `NO_OF_UNIT` int(16) DEFAULT NULL,
  `UNIT_PRICE` decimal(16,0) DEFAULT NULL,
  `AMOUNT` decimal(16,0) DEFAULT NULL,
  `LEDGER_CODE` varchar(10) DEFAULT NULL,
  `MAN_REG_NO` varchar(10) DEFAULT NULL,
  `LIFE_TIME` varchar(5) DEFAULT NULL,
  `DEP_RATE` double DEFAULT NULL,
  `AS_DCAT_ID` int(11) NOT NULL,
  `AS_SEC_ID` int(11) NOT NULL,
  `AS_LOC_ID` int(11) NOT NULL,
  `REG_DATE` date DEFAULT NULL,
  PRIMARY KEY (`AS_ID`),
  UNIQUE KEY `AUTH_PERSON_UNIQUE` (`AUTH_PERSON`),
  KEY `fk_asset_detail_asset_catergory_detail1_idx` (`AS_DCAT_ID`),
  KEY `fk_asset_detail_section_master1_idx` (`AS_SEC_ID`),
  KEY `fk_asset_detail_location_master1_idx` (`AS_LOC_ID`),
  CONSTRAINT `fk_asset_detail_asset_catergory_detail1` FOREIGN KEY (`AS_DCAT_ID`) REFERENCES `asset_catergory_detail` (`DCAT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asset_detail_location_master1` FOREIGN KEY (`AS_LOC_ID`) REFERENCES `location_master` (`LOC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asset_detail_section_master1` FOREIGN KEY (`AS_SEC_ID`) REFERENCES `section_master` (`SEC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `asset_detail` */

/*Table structure for table `asset_disposal_reason` */

DROP TABLE IF EXISTS `asset_disposal_reason`;

CREATE TABLE `asset_disposal_reason` (
  `REASON_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REASON` varchar(45) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`REASON_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `asset_disposal_reason` */

insert  into `asset_disposal_reason`(`REASON_ID`,`REASON`,`ACTION_TIME`,`USER_ID`) values (1,'Selling','2019-03-28 11:44:41',2),(2,'Damage','2019-03-28 11:45:26',2);

/*Table structure for table `asset_improvement` */

DROP TABLE IF EXISTS `asset_improvement`;

CREATE TABLE `asset_improvement` (
  `ASSET_IMP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(10) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `VALUE` double(16,0) DEFAULT NULL,
  `CURRENCY_TYPE` int(5) DEFAULT NULL,
  `CURRENCY_VALUE` double(16,0) DEFAULT NULL,
  `IMP_DATE` date DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ASSET_IMP_ID`),
  KEY `FK_asset_improvement` (`ASSET_ID`),
  CONSTRAINT `FK_asset_improvement` FOREIGN KEY (`ASSET_ID`) REFERENCES `asset` (`AS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `asset_improvement` */

/*Table structure for table `asset_location_details` */

DROP TABLE IF EXISTS `asset_location_details`;

CREATE TABLE `asset_location_details` (
  `AS_DETAIL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AS_ID` int(11) NOT NULL,
  `LOC_ID` int(11) NOT NULL,
  `IS_ACTIVE` tinyint(4) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`AS_DETAIL_ID`),
  KEY `fk_asset_location_details_asset1_idx` (`AS_ID`),
  KEY `fk_asset_location_details_location_master1_idx` (`LOC_ID`),
  CONSTRAINT `fk_asset_location_details_asset1` FOREIGN KEY (`AS_ID`) REFERENCES `asset` (`AS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_asset_location_details_location_master1` FOREIGN KEY (`LOC_ID`) REFERENCES `location_master` (`LOC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

/*Data for the table `asset_location_details` */

insert  into `asset_location_details`(`AS_DETAIL_ID`,`AS_ID`,`LOC_ID`,`IS_ACTIVE`,`USER_ID`,`ACTION_TIME`) values (1,1,3,1,0,'2019-02-15 07:59:48'),(2,2,3,1,0,'2019-02-15 08:15:07'),(3,3,3,1,0,'2019-02-20 05:02:55'),(4,4,3,1,0,'2019-02-20 05:31:43'),(5,5,3,1,0,'2019-02-20 06:13:51'),(6,6,3,1,0,'2019-02-20 06:29:21'),(7,7,3,1,0,'2019-02-20 06:41:09'),(9,9,3,1,0,'2019-02-20 07:56:37'),(10,10,3,1,0,'2019-02-20 08:05:18'),(11,11,3,1,0,'2019-02-20 09:11:22'),(12,12,3,1,0,'2019-02-20 09:40:40'),(13,13,3,1,0,'2019-02-20 10:00:31'),(14,14,3,1,0,'2019-02-20 10:42:22'),(15,15,3,1,0,'2019-02-20 11:45:29'),(16,16,3,1,0,'2019-02-20 11:47:21'),(17,17,3,1,0,'2019-02-20 11:54:11'),(18,18,3,1,0,'2019-02-21 02:54:44'),(19,19,3,1,0,'2019-02-21 03:00:36'),(20,20,3,1,0,'2019-02-21 03:15:15'),(21,21,3,1,0,'2019-02-21 04:19:51'),(22,22,3,1,0,'2019-02-21 04:19:51'),(23,23,3,1,0,'2019-02-21 04:25:05'),(24,24,3,1,0,'2019-02-21 04:25:05'),(25,25,3,1,0,'2019-02-21 04:35:19'),(26,26,3,1,0,'2019-02-21 04:35:19'),(27,27,3,1,0,'2019-02-21 04:44:58'),(28,28,2,1,0,'2019-02-21 06:46:13'),(29,29,2,1,0,'2019-02-21 06:53:31'),(30,30,5,1,0,'2019-02-21 07:13:31'),(31,31,3,1,0,'2019-02-21 07:56:57'),(32,32,3,1,0,'2019-02-21 07:56:57'),(33,33,3,1,0,'2019-02-21 07:56:57'),(34,34,3,1,0,'2019-02-21 07:56:57'),(35,35,3,1,0,'2019-02-21 07:56:57'),(36,36,2,1,0,'2019-02-21 08:23:37'),(37,37,4,1,0,'2019-02-21 09:40:40'),(38,38,2,1,0,'2019-02-21 09:53:03'),(39,39,2,1,0,'2019-02-21 09:53:03'),(40,40,4,0,0,'2019-02-27 08:05:12'),(41,41,2,1,0,'2019-02-27 08:43:10'),(42,42,2,1,0,'2019-02-27 08:47:22'),(43,43,2,1,0,'2019-02-27 09:39:33'),(44,44,2,1,0,'2019-02-27 09:43:27'),(45,45,2,1,0,'2019-02-27 09:52:49'),(46,46,5,1,0,'2019-02-27 10:04:08'),(47,47,3,1,0,'2019-02-27 10:11:19'),(48,48,2,1,0,'2019-02-27 10:24:35'),(49,49,4,1,0,'2019-02-27 10:30:00'),(50,50,2,1,0,'2019-02-27 10:59:38'),(51,51,3,1,0,'2019-02-27 11:42:27'),(52,52,2,1,0,'2019-02-28 03:09:47'),(53,53,2,1,0,'2019-02-28 03:29:05'),(54,54,5,1,0,'2019-02-28 03:42:40'),(55,55,2,1,0,'2019-02-28 03:52:58'),(56,56,3,1,0,'2019-02-28 04:21:03'),(57,57,3,1,0,'2019-02-28 04:34:02'),(58,58,4,1,0,'2019-02-28 04:41:53'),(59,59,4,1,0,'2019-02-28 04:48:31'),(60,60,4,1,0,'2019-02-28 04:59:25'),(61,61,4,1,0,'2019-02-28 05:45:02'),(62,62,4,1,0,'2019-02-28 05:54:07'),(63,63,2,1,0,'2019-02-28 06:16:16'),(64,64,4,1,0,'2019-02-28 06:23:54'),(65,65,4,1,0,'2019-02-28 06:30:37'),(66,66,2,1,0,'2019-02-28 06:48:35'),(67,67,2,1,0,'2019-02-28 06:57:26'),(68,68,2,1,0,'2019-02-28 07:02:41'),(69,69,2,1,0,'2019-02-28 07:02:41'),(70,70,2,1,0,'2019-02-28 07:02:41'),(71,71,2,1,0,'2019-02-28 07:02:41'),(72,72,2,1,0,'2019-02-28 07:02:41'),(73,73,2,1,0,'2019-02-28 07:02:41'),(74,74,2,1,0,'2019-02-28 07:06:45'),(75,75,2,1,0,'2019-02-28 07:06:45'),(76,76,2,1,0,'2019-02-28 07:11:56'),(77,77,2,1,0,'2019-02-28 07:16:24'),(78,78,2,1,0,'2019-02-28 07:16:24'),(79,79,2,1,0,'2019-02-28 07:16:24'),(80,80,2,1,0,'2019-02-28 07:29:33'),(81,81,3,1,0,'2019-02-28 07:43:30'),(82,82,2,1,0,'2019-02-28 07:57:47'),(83,83,3,1,0,'2019-02-28 08:07:52'),(84,84,3,1,0,'2019-02-28 08:07:52'),(85,85,3,1,0,'2019-02-28 08:07:52'),(86,86,3,1,0,'2019-02-28 08:07:52'),(87,87,3,1,0,'2019-02-28 08:07:52'),(88,88,3,1,0,'2019-02-28 08:07:52'),(89,89,3,1,0,'2019-02-28 08:07:52'),(90,90,3,1,0,'2019-02-28 08:07:52'),(91,91,3,1,0,'2019-02-28 08:07:52'),(92,92,3,1,0,'2019-02-28 08:07:52'),(93,93,3,1,0,'2019-02-28 08:07:52'),(94,94,3,1,0,'2019-02-28 08:07:52'),(95,95,2,1,0,'2019-02-28 08:18:08'),(96,96,2,1,0,'2019-02-28 08:18:08'),(97,97,2,1,0,'2019-02-28 08:18:08'),(98,98,2,1,0,'2019-02-28 08:18:08'),(99,99,2,1,0,'2019-02-28 08:18:08'),(100,100,2,1,0,'2019-02-28 08:18:08'),(101,101,2,1,0,'2019-02-28 08:18:08'),(102,102,2,1,0,'2019-02-28 08:18:08'),(103,103,2,1,0,'2019-02-28 08:18:08'),(104,104,2,1,0,'2019-02-28 08:18:08'),(105,105,2,1,0,'2019-02-28 08:18:08'),(106,106,2,1,0,'2019-02-28 08:18:08'),(107,107,2,1,0,'2019-02-28 08:18:08'),(108,108,2,1,0,'2019-02-28 08:18:08'),(109,109,2,1,0,'2019-02-28 08:18:08'),(110,110,2,1,0,'2019-02-28 08:18:08'),(111,111,2,1,0,'2019-02-28 08:18:08'),(112,112,2,1,0,'2019-02-28 08:18:08'),(113,113,2,1,0,'2019-02-28 08:18:08'),(114,114,2,1,0,'2019-02-28 08:18:08'),(115,115,2,1,0,'2019-02-28 08:18:08'),(116,116,2,1,0,'2019-02-28 08:18:08'),(117,117,2,1,0,'2019-02-28 08:18:08'),(118,118,2,1,0,'2019-02-28 08:18:08'),(119,119,2,1,0,'2019-02-28 08:18:08'),(120,120,2,1,0,'2019-02-28 08:18:08'),(121,121,2,1,0,'2019-02-28 08:18:08'),(122,122,2,1,0,'2019-02-28 08:18:08'),(123,123,2,1,0,'2019-02-28 08:18:08'),(124,124,2,1,0,'2019-02-28 08:18:08'),(125,125,2,1,0,'2019-02-28 08:18:08'),(126,126,2,1,0,'2019-02-28 08:18:08'),(127,127,2,1,0,'2019-02-28 08:18:08'),(128,128,2,1,0,'2019-02-28 08:18:08'),(129,129,2,1,0,'2019-02-28 08:18:08'),(130,130,2,1,0,'2019-02-28 08:18:08'),(131,131,2,1,0,'2019-02-28 08:18:08'),(132,132,2,1,0,'2019-02-28 08:18:08'),(133,133,2,1,0,'2019-02-28 08:18:08'),(134,134,2,1,0,'2019-02-28 08:18:08'),(135,135,2,1,0,'2019-02-28 08:28:55'),(136,136,2,1,0,'2019-02-28 08:45:55'),(137,137,2,1,0,'2019-02-28 08:45:55'),(138,138,2,1,0,'2019-02-28 08:45:55'),(139,139,2,1,0,'2019-02-28 08:48:09'),(140,140,3,1,0,'2019-02-28 08:52:25'),(141,141,2,1,0,'2019-02-28 08:58:00'),(142,142,2,1,0,'2019-02-28 09:45:53'),(143,143,3,1,0,'2019-02-28 09:53:27'),(144,144,3,1,0,'2019-02-28 09:53:27'),(145,145,3,1,0,'2019-02-28 09:58:39'),(146,146,4,1,0,'2019-02-28 10:03:06'),(147,147,4,1,0,'2019-02-28 10:03:06'),(148,148,2,1,0,'2019-02-28 10:20:54'),(149,149,2,1,0,'2019-02-28 10:20:54'),(150,150,2,1,0,'2019-02-28 10:20:54'),(151,151,2,1,0,'2019-02-28 10:20:54'),(152,152,2,1,0,'2019-02-28 10:20:54'),(153,153,2,1,0,'2019-02-28 10:20:54'),(154,154,2,1,0,'2019-02-28 10:20:54'),(155,155,2,1,0,'2019-02-28 10:20:54'),(156,156,2,1,0,'2019-02-28 10:20:54'),(157,157,2,1,0,'2019-02-28 10:20:54'),(158,158,4,1,0,'2019-02-28 10:28:56'),(159,159,2,1,0,'2019-02-28 10:44:09'),(160,160,2,1,0,'2019-02-28 10:44:09'),(161,161,2,1,0,'2019-02-28 10:47:18'),(162,162,3,1,0,'2019-02-28 10:49:11'),(163,163,4,1,0,'2019-02-28 10:54:24'),(164,164,2,1,0,'2019-02-28 11:15:25'),(165,165,2,1,0,'2019-02-28 11:21:27'),(166,166,3,1,0,'2019-02-28 11:31:20'),(167,167,3,1,0,'2019-02-28 11:52:42'),(168,168,3,1,0,'2019-03-01 03:17:21'),(169,169,3,1,0,'2019-03-01 03:44:35'),(170,170,3,1,0,'2019-03-01 04:25:19'),(171,171,3,1,0,'2019-03-01 04:27:50'),(172,172,2,1,0,'2019-03-01 04:30:29'),(173,173,3,1,0,'2019-03-01 04:38:32'),(174,40,2,1,2,'2019-03-01 09:53:47');

/*Table structure for table `asset_prior_reg` */

DROP TABLE IF EXISTS `asset_prior_reg`;

CREATE TABLE `asset_prior_reg` (
  `AS_PRIOR_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AS_PRIOR_CODE` varchar(45) NOT NULL,
  `AS_DES` varchar(35) NOT NULL,
  `REG_DATE` datetime NOT NULL,
  `NO_OF_UNITS` decimal(4,2) NOT NULL,
  `AMOUNT` decimal(10,2) NOT NULL,
  `VOUCHER_NO` varchar(8) NOT NULL,
  `GRN_NO` varchar(8) NOT NULL,
  `USER_ID` int(5) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`AS_PRIOR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `asset_prior_reg` */

/*Table structure for table `asset_revaluation` */

DROP TABLE IF EXISTS `asset_revaluation`;

CREATE TABLE `asset_revaluation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCATION_ID` int(11) DEFAULT NULL,
  `DETAIL_ID` varchar(11) DEFAULT NULL,
  `DETAIL_CODE` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `BALANCE` double DEFAULT '0',
  `VALUE` double DEFAULT '0',
  `DATE` date DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `REVALUE` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `asset_revaluation` */

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `BOOK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACCESSION_NO` int(8) DEFAULT NULL,
  `PGIM_ID` int(8) DEFAULT NULL,
  `MFN_NO` int(11) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `TITLE` varchar(400) DEFAULT NULL,
  `AUTHOR_1` varchar(50) DEFAULT NULL,
  `AUTHOR_2` varchar(50) DEFAULT NULL,
  `AUTHOR_3` varchar(50) DEFAULT NULL,
  `AUTHOR_4` varchar(50) DEFAULT NULL,
  `EDITORS` varchar(50) DEFAULT NULL,
  `PLACE_OF_PUBLICATION` varchar(50) DEFAULT NULL,
  `PUBLISHER` varchar(50) DEFAULT NULL,
  `DATE_OF_PUBLICATION` varchar(50) DEFAULT NULL,
  `LOCATION` varchar(50) DEFAULT NULL,
  `SERIES` varchar(50) DEFAULT NULL,
  `EDITION` varchar(50) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `ISBN` varchar(50) DEFAULT NULL,
  `CURRENCY_RATE` varchar(50) DEFAULT NULL,
  `CLASS_NO` varchar(50) DEFAULT NULL,
  `PRICE_RS` double DEFAULT NULL,
  `SOURCE` varchar(50) DEFAULT NULL,
  `SUPPLIER_NAME` varchar(50) DEFAULT NULL,
  `PURCHASE_ORDER_NO` varchar(50) DEFAULT NULL,
  `CONTENTS` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BOOK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

/*Table structure for table `building` */

DROP TABLE IF EXISTS `building`;

CREATE TABLE `building` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUILDING_CODE` varchar(11) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `CITY_ID` int(11) NOT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `BUILDING_CODE_unique` (`BUILDING_CODE`,`CITY_ID`),
  KEY `fk_building_city1_idx` (`CITY_ID`),
  CONSTRAINT `fk_building_city1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `building` */

insert  into `building`(`ID`,`BUILDING_CODE`,`DESCRIPTION`,`CITY_ID`,`USER_ID`,`ACTION_TIME`) values (1,'BUI','Building No.1',1,2,'2019-02-15 04:42:45');

/*Table structure for table `building_history` */

DROP TABLE IF EXISTS `building_history`;

CREATE TABLE `building_history` (
  `ID_PK` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  `BUILDING_CODE` varchar(11) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `CITY_ID` int(11) NOT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(1) DEFAULT NULL,
  `STATUS` int(11) DEFAULT '0',
  PRIMARY KEY (`ID_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `building_history` */

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `CITY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_CODE` varchar(11) DEFAULT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`CITY_ID`),
  UNIQUE KEY `city_unique` (`CITY_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `city` */

insert  into `city`(`CITY_ID`,`CITY_CODE`,`DESCRIPTION`,`USER_ID`,`ACTION_TIME`) values (1,'PAN','Panadura',2,'2019-02-15 04:41:56');

/*Table structure for table `city_history` */

DROP TABLE IF EXISTS `city_history`;

CREATE TABLE `city_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_ID` int(11) NOT NULL,
  `CITY_CODE` varchar(11) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `STATUS` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `city_history` */

/*Table structure for table `company_master` */

DROP TABLE IF EXISTS `company_master`;

CREATE TABLE `company_master` (
  `COM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COM_CODE` varchar(10) NOT NULL,
  `COM_DES` varchar(100) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`COM_ID`),
  UNIQUE KEY `company_unique` (`COM_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `company_master` */

insert  into `company_master`(`COM_ID`,`COM_CODE`,`COM_DES`,`USER_ID`,`ACTION_TIME`) values (1,'SBS','Somro BPO Services (Pvt) Ltd',2,'2019-02-15 04:54:16');

/*Table structure for table `company_master_history` */

DROP TABLE IF EXISTS `company_master_history`;

CREATE TABLE `company_master_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COM_ID` int(11) NOT NULL,
  `COM_CODE` varchar(10) NOT NULL,
  `COM_DES` varchar(100) DEFAULT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `STATUS` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `company_master_history` */

insert  into `company_master_history`(`ID`,`COM_ID`,`COM_CODE`,`COM_DES`,`USER_ID`,`ACTION_TIME`,`UPDATE_TIME`,`UPDATE_USER`,`STATUS`) values (1,1,'SBS','Somro BPO Services (Pvt) Ltd',2,'2019-02-15 04:54:16','2019-02-15 06:16:40',2,1);

/*Table structure for table `currency` */

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `CURRENCY_ID` int(10) NOT NULL AUTO_INCREMENT,
  `CURRENCY_CODE` varchar(3) DEFAULT NULL,
  `DESCRIPTION` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`CURRENCY_ID`),
  UNIQUE KEY `currency` (`CURRENCY_CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `currency` */

insert  into `currency`(`CURRENCY_ID`,`CURRENCY_CODE`,`DESCRIPTION`) values (1,'LKR','Sri Lanka'),(2,'USD','US Doller');

/*Table structure for table `currency_rate` */

DROP TABLE IF EXISTS `currency_rate`;

CREATE TABLE `currency_rate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CURRENCY_FROM` int(10) DEFAULT NULL,
  `CURRENCY_TO` int(10) DEFAULT NULL,
  `EXCHANGE_RATE` double(16,0) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_currency_rate` (`CURRENCY_FROM`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `currency_rate` */

insert  into `currency_rate`(`ID`,`CURRENCY_FROM`,`CURRENCY_TO`,`EXCHANGE_RATE`,`DATE`,`USER_ID`,`ACTION_TIME`) values (1,2,1,170,'2019-02-05',2,'2019-02-14 18:42:54'),(2,1,1,0,'2000-07-13',2,'2019-03-19 08:15:43'),(3,1,1,0,'2000-05-01',2,'2019-03-19 10:14:20'),(4,1,1,1,'1996-07-16',2,'2019-03-19 10:18:33'),(5,1,1,0,'1996-07-17',2,'2019-03-19 11:02:57'),(6,1,1,0,'2015-06-24',2,'2019-03-21 03:37:02');

/*Table structure for table `damage` */

DROP TABLE IF EXISTS `damage`;

CREATE TABLE `damage` (
  `DMG_AS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(10) DEFAULT NULL,
  `DMG_ASSET_ID` int(11) DEFAULT NULL,
  `DMG_DES` varchar(100) DEFAULT NULL,
  `DMG_COST` double(16,2) DEFAULT NULL,
  `UPDATEDBY` int(11) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`DMG_AS_ID`),
  KEY `FK_damage` (`DMG_ASSET_ID`),
  CONSTRAINT `FK_damage` FOREIGN KEY (`DMG_ASSET_ID`) REFERENCES `asset` (`AS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `damage` */

insert  into `damage`(`DMG_AS_ID`,`TRANSACTION_NO`,`DMG_ASSET_ID`,`DMG_DES`,`DMG_COST`,`UPDATEDBY`,`DATE`,`USER_ID`,`ACTION_TIME`) values (1,NULL,53,'DAMAGE- ELECTRICAL KETTLE',1240.00,0,'2018-10-17',2,NULL);

/*Table structure for table `department_master` */

DROP TABLE IF EXISTS `department_master`;

CREATE TABLE `department_master` (
  `DEP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEP_CODE` varchar(10) NOT NULL,
  `DEP_DES` varchar(100) DEFAULT NULL,
  `COM_ID` int(11) NOT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`DEP_ID`),
  UNIQUE KEY `department_unique` (`DEP_CODE`),
  KEY `fk_department_master_company_master1_idx` (`COM_ID`),
  CONSTRAINT `fk_department_master_company_master1` FOREIGN KEY (`COM_ID`) REFERENCES `company_master` (`COM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `department_master` */

insert  into `department_master`(`DEP_ID`,`DEP_CODE`,`DEP_DES`,`COM_ID`,`USER_ID`,`ACTION_TIME`) values (1,'FIA','Finance & Administration',1,2,'2019-02-15 04:56:08'),(2,'SWD','Software Development',1,2,'2019-02-15 04:56:41'),(3,'ADM','Administration',1,2,'2019-02-15 06:45:32');

/*Table structure for table `department_master_history` */

DROP TABLE IF EXISTS `department_master_history`;

CREATE TABLE `department_master_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEP_ID` int(11) NOT NULL,
  `DEP_CODE` varchar(10) NOT NULL,
  `DEP_DES` varchar(100) DEFAULT NULL,
  `COM_ID` int(11) NOT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `STATUS` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department_master_history` */

/*Table structure for table `disposal` */

DROP TABLE IF EXISTS `disposal`;

CREATE TABLE `disposal` (
  `DP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AS_ID` int(11) NOT NULL,
  `DP_DATE` date NOT NULL,
  `DP_DES` varchar(100) DEFAULT NULL,
  `DP_REASON` varchar(35) DEFAULT NULL,
  `DP_UPDATEBY` varchar(4) DEFAULT NULL,
  `DP_LUPDATE` datetime DEFAULT NULL,
  `CURRENCY_TYPE` int(5) DEFAULT NULL,
  `CURRENCY_VALUE` double(16,0) DEFAULT NULL,
  `DP_VALUE` double(16,0) DEFAULT '0',
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `TRANSACTION_NO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DP_ID`),
  KEY `fk_disposal_asset1_idx` (`AS_ID`),
  CONSTRAINT `fk_disposal_asset1` FOREIGN KEY (`AS_ID`) REFERENCES `asset` (`AS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `disposal` */

insert  into `disposal`(`DP_ID`,`AS_ID`,`DP_DATE`,`DP_DES`,`DP_REASON`,`DP_UPDATEBY`,`DP_LUPDATE`,`CURRENCY_TYPE`,`CURRENCY_VALUE`,`DP_VALUE`,`USER_ID`,`ACTION_TIME`,`TRANSACTION_NO`) values (1,46,'1996-07-23','Damage Fan Motor','Damage',NULL,NULL,1,2500,2500,2,'2019-03-28 11:52:33','AD000001'),(2,48,'1999-07-27','Selling Filing Cupboards','Selling',NULL,NULL,1,3000,3000,2,'2019-03-28 11:55:55','AD000002');

/*Table structure for table `floor` */

DROP TABLE IF EXISTS `floor`;

CREATE TABLE `floor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUILDING_ID` int(11) NOT NULL,
  `FLOOR_CODE` varchar(11) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `floor_unique` (`BUILDING_ID`,`FLOOR_CODE`),
  KEY `fk_flow_building1_idx` (`BUILDING_ID`),
  CONSTRAINT `FKgdrrovy57kuolw4qr2oajvept` FOREIGN KEY (`BUILDING_ID`) REFERENCES `building` (`ID`),
  CONSTRAINT `fk_flow_building1` FOREIGN KEY (`BUILDING_ID`) REFERENCES `building` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `floor` */

insert  into `floor`(`ID`,`BUILDING_ID`,`FLOOR_CODE`,`DESCRIPTION`,`USER_ID`,`ACTION_TIME`) values (1,1,'FLO','1st Floor',2,'2019-02-15 04:43:21');

/*Table structure for table `floor_history` */

DROP TABLE IF EXISTS `floor_history`;

CREATE TABLE `floor_history` (
  `ID_PK` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  `BUILDING_ID` int(11) NOT NULL,
  `FLOOR_CODE` varchar(11) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `STATUS` int(1) DEFAULT '1',
  PRIMARY KEY (`ID_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `floor_history` */

/*Table structure for table `incometax` */

DROP TABLE IF EXISTS `incometax`;

CREATE TABLE `incometax` (
  `INC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACC_FROM_YEAR` date NOT NULL,
  `ACC_TO_YEAR` date DEFAULT NULL,
  `DEP_RATE` double NOT NULL,
  `AS_ID` int(11) NOT NULL,
  PRIMARY KEY (`INC_ID`),
  KEY `fk_incometax_asset1_idx` (`AS_ID`),
  CONSTRAINT `fk_incometax_asset1` FOREIGN KEY (`AS_ID`) REFERENCES `asset` (`AS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `incometax` */

/*Table structure for table `location_master` */

DROP TABLE IF EXISTS `location_master`;

CREATE TABLE `location_master` (
  `LOC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOC_CODE` varchar(35) DEFAULT NULL,
  `LOC_DES` varchar(100) DEFAULT NULL,
  `SEC_ID` int(11) DEFAULT NULL,
  `ROOM_ID` int(11) NOT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`LOC_ID`),
  UNIQUE KEY `location_unique` (`LOC_CODE`),
  KEY `FK_location_master` (`SEC_ID`),
  KEY `fk_location_master_room1_idx` (`ROOM_ID`),
  CONSTRAINT `FK1pvec1tirigyykmvk2m187pqy` FOREIGN KEY (`ROOM_ID`) REFERENCES `room` (`ID`),
  CONSTRAINT `FK_location_master` FOREIGN KEY (`SEC_ID`) REFERENCES `section_master` (`SEC_ID`),
  CONSTRAINT `fk_location_master_room1` FOREIGN KEY (`ROOM_ID`) REFERENCES `room` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `location_master` */

insert  into `location_master`(`LOC_ID`,`LOC_CODE`,`LOC_DES`,`SEC_ID`,`ROOM_ID`,`USER_ID`,`ACTION_TIME`) values (2,'PANBUIFLORO1FIAADM','Location No.1',1,1,2,'2019-02-15 06:33:52'),(3,'PANBUIFLORO2SWDICT','Location No.2',2,2,2,'2019-02-15 06:35:17'),(4,'PANBUIFLORO3FIAADM','Location No.3',1,3,2,'2019-02-15 06:41:56'),(5,'PANBUIFLORO4ADMADM','Location No.4',3,4,2,'2019-02-15 07:01:22');

/*Table structure for table `location_master_history` */

DROP TABLE IF EXISTS `location_master_history`;

CREATE TABLE `location_master_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOC_ID` int(11) NOT NULL,
  `LOC_CODE` varchar(35) DEFAULT NULL,
  `LOC_DES` varchar(100) DEFAULT NULL,
  `SEC_ID` int(11) DEFAULT NULL,
  `ROOM_ID` int(11) NOT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `location_master_history` */

/*Table structure for table `maintenance_computer` */

DROP TABLE IF EXISTS `maintenance_computer`;

CREATE TABLE `maintenance_computer` (
  `COMPUTER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `BRAND` varchar(50) DEFAULT NULL,
  `COM_TYPE` varchar(20) DEFAULT NULL,
  `PROCESSOR` varchar(100) DEFAULT NULL,
  `RAM_SIZE` varchar(6) DEFAULT NULL,
  `HDD` varchar(6) DEFAULT NULL,
  `MONITOR` varchar(6) DEFAULT NULL,
  `SYSTEM_TYPE` varchar(50) DEFAULT NULL,
  `OPERATING_SYSTEM` varchar(50) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `DEVICE_NAME` varchar(50) DEFAULT NULL,
  `COM_COLOR` varchar(20) DEFAULT NULL,
  `DEVICE_ID` varchar(50) DEFAULT NULL,
  `PRODUCT_ID` varchar(50) DEFAULT NULL,
  `BATTERY` varchar(50) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WIDTH` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `BUYER` varchar(50) DEFAULT NULL,
  `BUYER_ADDRESS` varchar(100) DEFAULT NULL,
  `BUYER_TEL` varchar(20) DEFAULT NULL,
  `ADAPTER` varchar(6) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`COMPUTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_computer` */

/*Table structure for table `maintenance_computer_history` */

DROP TABLE IF EXISTS `maintenance_computer_history`;

CREATE TABLE `maintenance_computer_history` (
  `COMPUTER_HISTORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPUTER_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `BRAND` varchar(50) DEFAULT NULL,
  `COM_TYPE` varchar(20) DEFAULT NULL,
  `PROCESSOR` varchar(100) DEFAULT NULL,
  `RAM_SIZE` varchar(6) DEFAULT NULL,
  `HDD` varchar(6) DEFAULT NULL,
  `MONITOR` varchar(6) DEFAULT NULL,
  `SYSTEM_TYPE` varchar(50) DEFAULT NULL,
  `OPERATING_SYSTEM` varchar(50) DEFAULT NULL,
  `IS_WARRANTY` tinyint(1) DEFAULT NULL,
  `IS_INSURANCE` tinyint(1) DEFAULT NULL,
  `COMMENTS` varchar(200) DEFAULT NULL,
  `DEVICE_NAME` varchar(50) DEFAULT NULL,
  `COM_COLOR` varchar(20) DEFAULT NULL,
  `DEVICE_ID` varchar(50) DEFAULT NULL,
  `PRODUCT_ID` varchar(50) DEFAULT NULL,
  `BATTERY` varchar(50) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WIDTH` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `BUYER` varchar(50) DEFAULT NULL,
  `BUYER_ADDRESS` varchar(100) DEFAULT NULL,
  `BUYER_TEL` varchar(20) DEFAULT NULL,
  `ADAPTER` varchar(6) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `TRANSACTION_NO` varchar(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `STATUS` int(1) DEFAULT '0',
  `id` int(11) NOT NULL,
  PRIMARY KEY (`COMPUTER_HISTORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_computer_history` */

/*Table structure for table `maintenance_fixtures_fittings` */

DROP TABLE IF EXISTS `maintenance_fixtures_fittings`;

CREATE TABLE `maintenance_fixtures_fittings` (
  `FITTINGS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `WIDTH` varchar(6) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`FITTINGS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_fixtures_fittings` */

insert  into `maintenance_fixtures_fittings`(`FITTINGS_ID`,`ASSET_ID`,`WIDTH`,`LENGTH`,`WEIGHT`,`HEIGHT`,`IS_WARRANTY`,`IS_INSURANCE`,`COMMENTS`,`USER_ID`,`ACTION_TIME`) values (1,2,'vbfcv2','vcv125','3652cc','35565c',0,0,NULL,2,'2019-03-27 20:20:31');

/*Table structure for table `maintenance_fixtures_fittings_history` */

DROP TABLE IF EXISTS `maintenance_fixtures_fittings_history`;

CREATE TABLE `maintenance_fixtures_fittings_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FITTINGS_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `WIDTH` varchar(6) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `IS_SERVICE_AGRE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_fixtures_fittings_history` */

insert  into `maintenance_fixtures_fittings_history`(`ID`,`FITTINGS_ID`,`ASSET_ID`,`WIDTH`,`LENGTH`,`WEIGHT`,`HEIGHT`,`IS_WARRANTY`,`IS_INSURANCE`,`COMMENTS`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`,`IS_SERVICE_AGRE`) values (1,1,1,'vbfcv2','vcv125','3652cc','35565c',0,1,NULL,2,'2019-03-27 20:17:23',2,'2019-03-27 20:06:24',0),(2,1,1,'vbfcv2','vcv125','3652cc','35565c',0,1,NULL,2,'2019-03-27 20:20:31',2,'2019-03-27 20:17:23',0);

/*Table structure for table `maintenance_furniture` */

DROP TABLE IF EXISTS `maintenance_furniture`;

CREATE TABLE `maintenance_furniture` (
  `FURNITURE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  `ASSET_ID_FROM` int(11) DEFAULT NULL,
  `ASSET_ID_TO` int(11) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`FURNITURE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_furniture` */

insert  into `maintenance_furniture`(`FURNITURE_ID`,`ASSET_ID`,`IS_WARRANTY`,`IS_INSURANCE`,`USER_ID`,`ACTION_TIME`,`ASSET_ID_FROM`,`ASSET_ID_TO`,`COMMENTS`) values (9,3,1,0,2,'2019-03-27 19:00:35',0,0,NULL),(19,2,0,1,2,'2019-03-28 12:30:40',0,0,NULL);

/*Table structure for table `maintenance_furniture_history` */

DROP TABLE IF EXISTS `maintenance_furniture_history`;

CREATE TABLE `maintenance_furniture_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FURNITURE_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `ASSET_ID_FROM` int(11) DEFAULT NULL,
  `ASSET_ID_TO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_furniture_history` */

insert  into `maintenance_furniture_history`(`ID`,`FURNITURE_ID`,`ASSET_ID`,`IS_WARRANTY`,`IS_INSURANCE`,`COMMENTS`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`,`ASSET_ID_FROM`,`ASSET_ID_TO`) values (3,3,2,1,0,NULL,2,'2019-03-27 18:36:33',0,NULL,0,0),(9,4,6,0,0,NULL,2,'2019-03-27 18:37:30',0,NULL,0,0),(10,9,0,0,0,NULL,2,'2019-03-28 10:42:49',0,NULL,0,0),(11,1,0,1,1,NULL,2,'2019-03-28 10:56:35',0,NULL,0,0),(12,1,0,1,1,NULL,2,'2019-03-28 11:02:30',0,NULL,0,0),(13,1,0,1,1,NULL,2,'2019-03-28 11:07:15',0,NULL,NULL,NULL),(14,1,0,1,1,NULL,2,'2019-03-28 12:03:01',0,NULL,NULL,NULL),(15,1,0,1,1,NULL,2,'2019-03-28 12:12:56',0,NULL,NULL,NULL),(16,16,0,0,0,NULL,2,'2019-03-28 12:21:44',0,NULL,NULL,NULL),(17,17,2,1,0,NULL,2,'2019-03-28 12:28:18',0,NULL,NULL,NULL),(18,18,2,1,1,NULL,2,'2019-03-28 12:30:40',0,NULL,NULL,NULL);

/*Table structure for table `maintenance_insurance` */

DROP TABLE IF EXISTS `maintenance_insurance`;

CREATE TABLE `maintenance_insurance` (
  `INSURANCE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(10) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `INSURANCE_POLICY_NO` varchar(10) DEFAULT NULL,
  `INSURANCE_POLICY` varchar(100) DEFAULT NULL,
  `INSURANCE_PERIOD` varchar(50) DEFAULT NULL,
  `INSURANCE_PERIOD_FROM` date DEFAULT NULL,
  `INSURANCE_PERIOD_TO` date DEFAULT NULL,
  `INSURANCE_VALUE` double(14,2) DEFAULT NULL,
  `INSURANCE_COMPANY` varchar(100) DEFAULT NULL,
  `INSURANCE_AGENT` varchar(50) DEFAULT NULL,
  `INSURANCE_ADDRESS` varchar(100) DEFAULT NULL,
  `INSURANCE_TELEPHONE_NO` varchar(20) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  `INSURANCE_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`INSURANCE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_insurance` */

insert  into `maintenance_insurance`(`INSURANCE_ID`,`TRANSACTION_NO`,`ASSET_ID`,`INSURANCE_POLICY_NO`,`INSURANCE_POLICY`,`INSURANCE_PERIOD`,`INSURANCE_PERIOD_FROM`,`INSURANCE_PERIOD_TO`,`INSURANCE_VALUE`,`INSURANCE_COMPANY`,`INSURANCE_AGENT`,`INSURANCE_ADDRESS`,`INSURANCE_TELEPHONE_NO`,`USER_ID`,`ACTION_TIME`,`INSURANCE_TYPE`) values (1,'IN000001',1,'FFF1452635','Fire','12 months','2019-01-01','2019-12-31',1000000.00,'AIA Insurance Co.Ltd','Mr.Danuka Samarakkodi',NULL,'0382546985',2,'2019-01-30 10:04:17',NULL),(3,'IN000003',3,'gfff','fddfgdf','3','2019-03-28','2019-03-30',4534.00,'fdg','dfg','dfd','gf',2,'2019-03-28 09:06:07',NULL),(4,'IN000004',2,'544','542','24','2019-03-29','2019-03-30',5445.00,'45','5445','54545','0382546985',2,'2019-03-28 14:22:00',NULL);

/*Table structure for table `maintenance_insurance_history` */

DROP TABLE IF EXISTS `maintenance_insurance_history`;

CREATE TABLE `maintenance_insurance_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSATCION_NO` varchar(10) DEFAULT NULL,
  `INSURANCE_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `INSURANCE_POLICY_NO` varchar(10) DEFAULT NULL,
  `INSURANCE_POLICY` varchar(100) DEFAULT NULL,
  `INSURANCE_PERIOD` varchar(50) DEFAULT NULL,
  `INSURANCE_PERIOD_FROM` date DEFAULT NULL,
  `INSURANCE_PERIOD_TO` date DEFAULT NULL,
  `INSURANCE_VALUE` double(14,2) DEFAULT NULL,
  `INSURANCE_COMPANY` varchar(100) DEFAULT NULL,
  `INSURANCE_AGENT` varchar(50) DEFAULT NULL,
  `INSURANCE_ADDRESS` varchar(100) DEFAULT NULL,
  `INSURANCE_TELEPHONE_NO` varchar(20) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `INSURANCE_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_insurance_history` */

insert  into `maintenance_insurance_history`(`ID`,`TRANSATCION_NO`,`INSURANCE_ID`,`ASSET_ID`,`INSURANCE_POLICY_NO`,`INSURANCE_POLICY`,`INSURANCE_PERIOD`,`INSURANCE_PERIOD_FROM`,`INSURANCE_PERIOD_TO`,`INSURANCE_VALUE`,`INSURANCE_COMPANY`,`INSURANCE_AGENT`,`INSURANCE_ADDRESS`,`INSURANCE_TELEPHONE_NO`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`,`INSURANCE_TYPE`) values (3,'IN000002',2,2,'548984','D656','2 Y','2019-03-01','2022-03-01',7000.00,'563322255','DFEGE','EYERYRYTRYRYTRYR','0382546985',2,'2019-03-28 13:53:26',2,'2019-03-28 13:42:56',NULL),(4,'IN000004',4,2,'544','542','24','2019-03-29','2019-03-30',5445.00,'45','5445','54545','0382546985',2,'2019-03-28 14:11:26',2,'2019-03-28 14:07:39',NULL),(5,'IN000004',4,2,'544','542','24','2019-03-29','2019-03-30',5445.00,'45','5445','54545','0382546985',2,'2019-03-28 14:21:10',2,'2019-03-28 14:11:26',NULL),(6,'IN000004',4,2,'544','542','24','2019-03-29','2019-03-30',5445.00,'45','5445','54545','0382546985',2,'2019-03-28 14:22:00',2,'2019-03-28 14:21:10',NULL);

/*Table structure for table `maintenance_lab_equipment` */

DROP TABLE IF EXISTS `maintenance_lab_equipment`;

CREATE TABLE `maintenance_lab_equipment` (
  `EQUIPMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `TYPE_FUEL` varchar(20) DEFAULT NULL,
  `MAKE` varchar(20) DEFAULT NULL,
  `COUNTRY_ORIGIN` varchar(50) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `YEAR_MANUFACTURE` int(10) DEFAULT '0',
  `WIDTH` varchar(6) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSUARANCE` int(1) DEFAULT '0',
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`EQUIPMENT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_lab_equipment` */

insert  into `maintenance_lab_equipment`(`EQUIPMENT_ID`,`ASSET_ID`,`TYPE_FUEL`,`MAKE`,`COUNTRY_ORIGIN`,`MODEL`,`YEAR_MANUFACTURE`,`WIDTH`,`LENGTH`,`WEIGHT`,`HEIGHT`,`IS_WARRANTY`,`IS_INSUARANCE`,`IS_SERVICE_AGRE`,`COMMENTS`,`USER_ID`,`ACTION_TIME`) values (1,2,'1','1','1','11',1992,'445tt','11','11','3232',0,1,0,NULL,2,'2019-03-27 19:25:21'),(2,5,'22','22','22','22',22,'22','22','22','1215se',0,0,0,NULL,2,'2019-03-27 19:28:24');

/*Table structure for table `maintenance_lab_equipment_history` */

DROP TABLE IF EXISTS `maintenance_lab_equipment_history`;

CREATE TABLE `maintenance_lab_equipment_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EQUIPMENT_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `TYPE_FUEL` varchar(20) DEFAULT NULL,
  `MAKE` varchar(20) DEFAULT NULL,
  `COUNTRY_ORIGIN` varchar(50) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `YEAR_MANUFACTURE` int(10) DEFAULT '0',
  `WIDTH` varchar(6) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSUARANCE` int(1) DEFAULT '0',
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `IS_INSURANCE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_lab_equipment_history` */

/*Table structure for table `maintenance_land` */

DROP TABLE IF EXISTS `maintenance_land`;

CREATE TABLE `maintenance_land` (
  `LAND_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `DEED_TYPE` int(20) DEFAULT NULL,
  `DEED_NO` varchar(6) DEFAULT NULL,
  `DEED_SIGN_DATE` datetime DEFAULT NULL,
  `DEED_REG_DATE` datetime DEFAULT NULL,
  `LAN_ADD1` varchar(20) DEFAULT NULL,
  `LAN_ADD2` varchar(20) DEFAULT NULL,
  `LAN_ADD3` varchar(20) DEFAULT NULL,
  `LAN_ADD4` varchar(20) DEFAULT NULL,
  `DEED_VALUE` double(16,0) DEFAULT NULL,
  `EXTENT` varchar(20) DEFAULT NULL,
  `COMMENTS` varchar(200) DEFAULT NULL,
  `ATTESTER` varchar(100) DEFAULT NULL,
  `ATTESTER_ADD` varchar(200) DEFAULT NULL,
  `SELLER` varchar(100) DEFAULT NULL,
  `SELL_ADD` varchar(200) DEFAULT NULL,
  `GRA_NIL_DIVI_NO` varchar(6) DEFAULT NULL,
  `DIVISION_NO` varchar(6) DEFAULT NULL,
  `ASSESMENT_NO` varchar(6) DEFAULT NULL,
  `ASSESMENT_VALUE` varchar(16) DEFAULT NULL,
  `SURVEY_PLAN_NO` varchar(6) DEFAULT NULL,
  `SURVEYOR_NAME` varchar(100) DEFAULT NULL,
  `SURVEYOR_ADD` varchar(200) DEFAULT NULL,
  `SURVEYOR_TEL` varchar(20) DEFAULT NULL,
  `SURVEYOR_DATE` varchar(10) DEFAULT NULL,
  `LOT_NO` varchar(6) DEFAULT NULL,
  `LAND_NAME` varchar(100) DEFAULT NULL,
  `LAND_SITUATED` varchar(100) DEFAULT NULL,
  `LAND_P_AREA` varchar(100) DEFAULT NULL,
  `LAND_DISTRICT` varchar(100) DEFAULT NULL,
  `LAND_PROVINCE` varchar(100) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_land` */

/*Table structure for table `maintenance_land_building` */

DROP TABLE IF EXISTS `maintenance_land_building`;

CREATE TABLE `maintenance_land_building` (
  `LAND_BUILDING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `BUILDING_ADDRESS1` varchar(20) DEFAULT NULL,
  `BUILDING_ADDRESS2` varchar(20) DEFAULT NULL,
  `BUILDING_ADDRESS3` varchar(20) DEFAULT NULL,
  `BUILDING_ADDRESS4` varchar(20) DEFAULT NULL,
  `DEED_TYPE` int(20) DEFAULT NULL,
  `DEED_NO` varchar(6) DEFAULT NULL,
  `DEED_SIGNED_DATE` datetime DEFAULT NULL,
  `DEED_REGISTER_DATE` datetime DEFAULT NULL,
  `DEED_VALUE` double(16,0) DEFAULT '0',
  `EXTENT` varchar(20) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `ASSESSEMENT_NO` varchar(6) DEFAULT NULL,
  `ASSESSEMENT_VALUE` varchar(16) DEFAULT NULL,
  `BUILDING_STORIED` varchar(3) DEFAULT NULL,
  `BUILDING_PLAN_NO` varchar(6) DEFAULT NULL,
  `COC_NO` varchar(6) DEFAULT NULL,
  `ATTESTER` varchar(100) DEFAULT NULL,
  `ATTESTER_ADDRESS` varchar(200) DEFAULT NULL,
  `SELLER` varchar(100) DEFAULT NULL,
  `SELLER_ADDRESS` varchar(200) DEFAULT NULL,
  `GRA_NIL_DIV_NO` varchar(6) DEFAULT NULL,
  `DIVISION_NO` varchar(6) DEFAULT NULL,
  `SURVEY_PLAN_NO` varchar(6) DEFAULT NULL,
  `SURVEY_NAME` varchar(100) DEFAULT NULL,
  `SURVEY_ADDRESS` varchar(200) DEFAULT NULL,
  `SURVEY_TELEPHONE` varchar(20) DEFAULT NULL,
  `SURVEY_DATE` varchar(10) DEFAULT NULL,
  `LOT_NO` varchar(6) DEFAULT NULL,
  `LAND_NAME` varchar(100) DEFAULT NULL,
  `LAND_SITUATED` varchar(100) DEFAULT NULL,
  `LAND_PROVINCIAL_AREA` varchar(100) DEFAULT NULL,
  `LAND_DISTRICT` varchar(100) DEFAULT NULL,
  `LAND_PROVINCE` varchar(100) DEFAULT NULL,
  `IS_INSURANCE` tinyint(1) DEFAULT '0',
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`LAND_BUILDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_land_building` */

/*Table structure for table `maintenance_land_building_history` */

DROP TABLE IF EXISTS `maintenance_land_building_history`;

CREATE TABLE `maintenance_land_building_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAND_BUILDING_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `BUILDING_ADDRESS1` varchar(20) DEFAULT NULL,
  `BUILDING_ADDRESS2` varchar(20) DEFAULT NULL,
  `BUILDING_ADDRESS3` varchar(20) DEFAULT NULL,
  `BUILDING_ADDRESS4` varchar(20) DEFAULT NULL,
  `DEED_TYPE` int(20) DEFAULT NULL,
  `DEED_NO` varchar(6) DEFAULT NULL,
  `DEED_SIGNED_DATE` datetime DEFAULT NULL,
  `DEED_REGISTER_DATE` datetime DEFAULT NULL,
  `DEED_VALUE` double(16,0) DEFAULT '0',
  `EXTENT` varchar(20) DEFAULT NULL,
  `COMMENTS` varchar(200) DEFAULT NULL,
  `ASSESSEMENT_NO` varchar(6) DEFAULT NULL,
  `ASSESSEMENT_VALUE` double(16,0) DEFAULT '0',
  `BUILDING_STORIED` int(3) DEFAULT '0',
  `BUILDING_PLAN_NO` varchar(6) DEFAULT NULL,
  `COC_NO` varchar(6) DEFAULT NULL,
  `ATTESTER` varchar(100) DEFAULT NULL,
  `ATTESTER_ADDRESS` varchar(200) DEFAULT NULL,
  `SELLER` varchar(100) DEFAULT NULL,
  `SELLER_ADDRESS` varchar(200) DEFAULT NULL,
  `GRA_NIL_DIV_NO` varchar(6) DEFAULT NULL,
  `DIVISION_NO` varchar(6) DEFAULT NULL,
  `SURVEY_PLAN_NO` varchar(6) DEFAULT NULL,
  `SURVEY_NAME` varchar(100) DEFAULT NULL,
  `SURVEY_ADDRESS` varchar(200) DEFAULT NULL,
  `SURVEY_TELEPHONE` varchar(20) DEFAULT NULL,
  `SURVEY_DATE` varchar(10) DEFAULT NULL,
  `LOT_NO` varchar(6) DEFAULT NULL,
  `LAND_NAME` varchar(100) DEFAULT NULL,
  `LAND_SITUATED` varchar(100) DEFAULT NULL,
  `LAND_PROVINCIAL_AREA` varchar(100) DEFAULT NULL,
  `LAND_DISTRICT` varchar(100) DEFAULT NULL,
  `LAND_PROVINCE` varchar(100) DEFAULT NULL,
  `IS_INSURANCE` tinyint(1) DEFAULT '0',
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `LandBuildingHistoryID` int(11) NOT NULL,
  `LAND_BUILDING_HISTORY_ID` varchar(255) DEFAULT NULL,
  `ASSET_CODE` varchar(255) DEFAULT NULL,
  `BUILDING_INSURANCE` varchar(255) DEFAULT NULL,
  `TRANSACTION_NO` int(11) DEFAULT NULL,
  `VALUE` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_land_building_history` */

/*Table structure for table `maintenance_land_history` */

DROP TABLE IF EXISTS `maintenance_land_history`;

CREATE TABLE `maintenance_land_history` (
  `LAND_HISTORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAND_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `DEED_TYPE` int(20) DEFAULT NULL,
  `DEED_NO` varchar(6) DEFAULT NULL,
  `DEED_SIGN_DATE` datetime DEFAULT NULL,
  `DEED_REG_DATE` datetime DEFAULT NULL,
  `LAN_ADD1` varchar(20) DEFAULT NULL,
  `LAN_ADD2` varchar(20) DEFAULT NULL,
  `LAN_ADD3` varchar(20) DEFAULT NULL,
  `LAN_ADD4` varchar(20) DEFAULT NULL,
  `DEED_VALUE` double(16,0) DEFAULT '0',
  `EXTENT` varchar(20) DEFAULT NULL,
  `COMMENTS` varchar(200) DEFAULT NULL,
  `ATTESTER` varchar(100) DEFAULT NULL,
  `ATTESTER_ADD` varchar(200) DEFAULT NULL,
  `SELLER` varchar(100) DEFAULT NULL,
  `SELL_ADD` varchar(200) DEFAULT NULL,
  `GRA_NIL_DIVI_NO` varchar(6) DEFAULT NULL,
  `DIVISION_NO` varchar(6) DEFAULT NULL,
  `ASSESMENT_NO` varchar(6) DEFAULT NULL,
  `ASSESMENT_VALUE` double(16,0) DEFAULT '0',
  `SURVEY_PLAN_NO` varchar(6) DEFAULT NULL,
  `SURVEYOR_NAME` varchar(100) DEFAULT NULL,
  `SURVEYOR_ADD` varchar(200) DEFAULT NULL,
  `SURVEYOR_TEL` varchar(20) DEFAULT NULL,
  `SURVEYOR_DATE` varchar(10) DEFAULT NULL,
  `LOT_NO` varchar(6) DEFAULT NULL,
  `LAND_NAME` varchar(100) DEFAULT NULL,
  `LAND_SITUATED` varchar(100) DEFAULT NULL,
  `LAND_P_AREA` varchar(100) DEFAULT NULL,
  `LAND_DISTRICT` varchar(100) DEFAULT NULL,
  `LAND_PROVINCE` varchar(100) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `TRANSACTION_NO` int(11) DEFAULT NULL,
  `VALUE` double DEFAULT NULL,
  PRIMARY KEY (`LAND_HISTORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_land_history` */

/*Table structure for table `maintenance_lease_asset` */

DROP TABLE IF EXISTS `maintenance_lease_asset`;

CREATE TABLE `maintenance_lease_asset` (
  `LEASE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(10) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `LEASE_TYPE` int(1) DEFAULT NULL,
  `LEASE_AGRE_NO` int(11) DEFAULT NULL,
  `LEASE_TOT` double(50,2) DEFAULT NULL,
  `LEASE_NO_PREMIUM` int(11) DEFAULT NULL,
  `LEASE_PREMIUM` double(50,2) DEFAULT NULL,
  `LEASE_PREMIUM_DATE` int(2) DEFAULT NULL,
  `LEASE_PERIOD_FROM` date DEFAULT NULL,
  `LEASE_PERIOD_TO` date DEFAULT NULL,
  `LEASE_COMPANY` varchar(200) DEFAULT NULL,
  `CONTACT_PERSON` varchar(50) DEFAULT NULL,
  `LEASE_ADDRESS` varchar(200) DEFAULT NULL,
  `LEASE_TELEPHONE_NO` varchar(20) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`LEASE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_lease_asset` */

insert  into `maintenance_lease_asset`(`LEASE_ID`,`TRANSACTION_NO`,`ASSET_ID`,`LEASE_TYPE`,`LEASE_AGRE_NO`,`LEASE_TOT`,`LEASE_NO_PREMIUM`,`LEASE_PREMIUM`,`LEASE_PREMIUM_DATE`,`LEASE_PERIOD_FROM`,`LEASE_PERIOD_TO`,`LEASE_COMPANY`,`CONTACT_PERSON`,`LEASE_ADDRESS`,`LEASE_TELEPHONE_NO`,`USER_ID`,`ACTION_TIME`) values (1,'LA000001',1,2,1,1.00,1,1.00,1,'2019-03-01','2019-03-01','1','1','ABC','1',2,'2019-03-14 01:03:13');

/*Table structure for table `maintenance_lease_asset_history` */

DROP TABLE IF EXISTS `maintenance_lease_asset_history`;

CREATE TABLE `maintenance_lease_asset_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LEASE_ID` int(11) DEFAULT NULL,
  `TRANSACTION_NO` varchar(10) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `LEASE_TYPE` varchar(25) DEFAULT NULL,
  `LEASE_AGRE_NO` int(11) DEFAULT NULL,
  `LEASE_TOT` double DEFAULT NULL,
  `LEASE_NO_PREMIUM` int(11) DEFAULT NULL,
  `LEASE_PREMIUM` double DEFAULT NULL,
  `LEASE_PREMIUM_DATE` varchar(10) DEFAULT NULL,
  `LEASE_PERIOD_FROM` date DEFAULT NULL,
  `LEASE_PERIOD_TO` date DEFAULT NULL,
  `LEASE_COMPANY` varchar(200) DEFAULT NULL,
  `LEASE_ADDRESS` varchar(200) DEFAULT NULL,
  `LEASE_TEL_NO` int(10) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `CONTACT_PERSON` varchar(255) DEFAULT NULL,
  `LEASE_TELEPHONE_NO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_lease_asset_history` */

insert  into `maintenance_lease_asset_history`(`ID`,`LEASE_ID`,`TRANSACTION_NO`,`ASSET_ID`,`LEASE_TYPE`,`LEASE_AGRE_NO`,`LEASE_TOT`,`LEASE_NO_PREMIUM`,`LEASE_PREMIUM`,`LEASE_PREMIUM_DATE`,`LEASE_PERIOD_FROM`,`LEASE_PERIOD_TO`,`LEASE_COMPANY`,`LEASE_ADDRESS`,`LEASE_TEL_NO`,`USER_ID`,`ACTION_TIME`,`UPDATE_USER`,`UPDATE_TIME`,`CONTACT_PERSON`,`LEASE_TELEPHONE_NO`) values (1,NULL,'LA000001',102,'1',20,111111,1,11,'12','2019-03-14','2019-03-29','543','3545',NULL,2,'2019-03-29 08:46:48',NULL,NULL,'5345','56'),(2,NULL,'LA000001',1,'1',13,111111,11,11,'13','2019-03-08','2019-03-27','11','111',NULL,2,'2019-03-29 08:50:29',NULL,NULL,'111','111'),(3,NULL,'LA000001',2,'1',44,455,4,544,'13','2019-03-05','2019-03-29','44','44',NULL,2,'2019-03-29 09:19:17',NULL,NULL,'44','44');

/*Table structure for table `maintenance_library_book` */

DROP TABLE IF EXISTS `maintenance_library_book`;

CREATE TABLE `maintenance_library_book` (
  `LIBRARY_BOOK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `AUTHOR` varchar(100) DEFAULT NULL,
  `EDITORS` varchar(100) DEFAULT NULL,
  `PLACE_OF_PUBLICATION` varchar(100) DEFAULT NULL,
  `PUBLISHER` varchar(100) DEFAULT NULL,
  `DATE_OF_PUBLICATION` varchar(10) DEFAULT NULL,
  `SERIES_NO` int(10) DEFAULT '0',
  `EDITION` varchar(10) DEFAULT NULL,
  `ISBM_NO` varchar(10) DEFAULT NULL,
  `CONTENTS` varchar(100) DEFAULT NULL,
  `COMMENTS` varchar(200) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`LIBRARY_BOOK_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_library_book` */

insert  into `maintenance_library_book`(`LIBRARY_BOOK_ID`,`ASSET_ID`,`AUTHOR`,`EDITORS`,`PLACE_OF_PUBLICATION`,`PUBLISHER`,`DATE_OF_PUBLICATION`,`SERIES_NO`,`EDITION`,`ISBM_NO`,`CONTENTS`,`COMMENTS`,`USER_ID`,`ACTION_TIME`) values (1,2,'dsafs','asdsaf','dfdfasa','dfsdf','03/20/2019',12,'656+5+6','dgd','fdgd','dfgd',2,'2019-03-27 21:09:57');

/*Table structure for table `maintenance_library_book_history` */

DROP TABLE IF EXISTS `maintenance_library_book_history`;

CREATE TABLE `maintenance_library_book_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LIBRARY_BOOK_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `AUTHOR` varchar(100) DEFAULT NULL,
  `EDITORS` varchar(100) DEFAULT NULL,
  `PLACE_OF_PUBLICATION` varchar(100) DEFAULT NULL,
  `PUBLISHER` varchar(100) DEFAULT NULL,
  `DATE_OF_PUBLICATION` varchar(10) DEFAULT NULL,
  `SERIES_NO` int(10) DEFAULT '0',
  `EDITION` varchar(10) DEFAULT NULL,
  `ISBM_NO` varchar(10) DEFAULT NULL,
  `CONTENTS` varchar(100) DEFAULT NULL,
  `COMMENTS` varchar(200) DEFAULT NULL,
  `UPDATE_USER` int(1) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_library_book_history` */

insert  into `maintenance_library_book_history`(`ID`,`LIBRARY_BOOK_ID`,`ASSET_ID`,`AUTHOR`,`EDITORS`,`PLACE_OF_PUBLICATION`,`PUBLISHER`,`DATE_OF_PUBLICATION`,`SERIES_NO`,`EDITION`,`ISBM_NO`,`CONTENTS`,`COMMENTS`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`) values (1,1,2,'dsafs','asdsaf','dfdfasa','dfsdf','03/20/2019',12,'feds','dgd','fdgd','dfgd',0,NULL,2,'2019-03-27 20:44:41'),(2,1,2,'dsafs','asdsaf','dfdfasa','dfsdf','03/20/2019',12,'feds','dgd','fdgd','dfgd',0,NULL,2,'2019-03-27 20:44:56');

/*Table structure for table `maintenance_maintenance_data` */

DROP TABLE IF EXISTS `maintenance_maintenance_data`;

CREATE TABLE `maintenance_maintenance_data` (
  `MAINTENANCE_DATA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(11) NOT NULL,
  `ASSET_ID` int(10) DEFAULT NULL,
  `MAINT_ENTRY_DA` date DEFAULT NULL,
  `MAINT_DA` varchar(12) DEFAULT NULL,
  `MAINT_WORK` varchar(200) DEFAULT NULL,
  `MAINT_METER` int(10) DEFAULT NULL,
  `MAINT_MASTER` varchar(200) DEFAULT NULL,
  `MAINT_COST` double(14,2) DEFAULT NULL,
  `MAINT_AC_CODE` varchar(11) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  PRIMARY KEY (`MAINTENANCE_DATA_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_maintenance_data` */

insert  into `maintenance_maintenance_data`(`MAINTENANCE_DATA_ID`,`TRANSACTION_NO`,`ASSET_ID`,`MAINT_ENTRY_DA`,`MAINT_DA`,`MAINT_WORK`,`MAINT_METER`,`MAINT_MASTER`,`MAINT_COST`,`MAINT_AC_CODE`,`USER_ID`,`ACTION_TIME`,`UPDATE_TIME`,`UPDATE_USER`) values (5,'MD000002',5,'2019-03-28','03/23/2019','sdfsd',334,'SELECT',3232.00,'232',2,'2019-03-28 08:29:00',NULL,NULL),(6,'MD000001',2,'2019-03-28','03/22/2019','kxvmxcvnx',221,'Other',22.00,'22',2,'2019-03-28 08:29:15',NULL,NULL);

/*Table structure for table `maintenance_maintenance_data_history` */

DROP TABLE IF EXISTS `maintenance_maintenance_data_history`;

CREATE TABLE `maintenance_maintenance_data_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MAINTENANCE_DATA_ID` int(11) DEFAULT NULL,
  `TRANSACTION_NO` varchar(11) NOT NULL,
  `ASSET_ID` int(10) DEFAULT NULL,
  `MAINT_ENTRY_DA` date DEFAULT NULL,
  `MAINT_DA` varchar(12) DEFAULT NULL,
  `MAINT_WORK` varchar(200) DEFAULT NULL,
  `MAINT_METER` int(10) DEFAULT NULL,
  `MAINT_MASTER` varchar(200) DEFAULT NULL,
  `MAINT_COST` double(14,2) DEFAULT NULL,
  `MAINT_AC_CODE` varchar(11) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_maintenance_data_history` */

insert  into `maintenance_maintenance_data_history`(`ID`,`MAINTENANCE_DATA_ID`,`TRANSACTION_NO`,`ASSET_ID`,`MAINT_ENTRY_DA`,`MAINT_DA`,`MAINT_WORK`,`MAINT_METER`,`MAINT_MASTER`,`MAINT_COST`,`MAINT_AC_CODE`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`) values (1,1,'MD000001',2,'2019-03-26','03/22/2019','fd',221,'Other',22.00,'22',2,'2019-03-26 01:26:17',2,'2019-03-26 01:26:02'),(2,2,'MD000001',2,'2019-03-26','03/22/2019','fd2',221,'Other',22.00,'22',2,'2019-03-27 21:33:01',2,'2019-03-26 01:26:17'),(3,4,'MD000002',3,'2019-03-27','03/22/2019','sdvs',234234,'RAM',333.00,'34332',2,'2019-03-28 08:26:19',2,'2019-03-27 21:43:38'),(4,3,'MD000001',2,'2019-03-27','03/22/2019','fd2',221,'Other',22.00,'22',2,'2019-03-28 08:29:15',2,'2019-03-27 21:33:01');

/*Table structure for table `maintenance_modification` */

DROP TABLE IF EXISTS `maintenance_modification`;

CREATE TABLE `maintenance_modification` (
  `MODIFICATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(10) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `MODI_TYPE` int(1) DEFAULT NULL,
  `MODI_DATE` date DEFAULT NULL,
  `MODI_WORK` varchar(200) DEFAULT NULL,
  `MODI_COST` double DEFAULT NULL,
  `MODI_REASON` varchar(200) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `MODI_DA` datetime DEFAULT NULL,
  PRIMARY KEY (`MODIFICATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_modification` */

insert  into `maintenance_modification`(`MODIFICATION_ID`,`TRANSACTION_NO`,`ASSET_ID`,`MODI_TYPE`,`MODI_DATE`,`MODI_WORK`,`MODI_COST`,`MODI_REASON`,`USER_ID`,`ACTION_TIME`,`MODI_DA`) values (1,'MO000001',2,1,NULL,'aaaaaaaaaaaaa',11000,'111111',2,'2019-03-29 02:44:03',NULL),(2,'MO000002',3,2,'2019-03-27','sasdw3432432',12233333333333,'fgfddfdf',2,'2019-03-28 08:49:17',NULL),(3,'MO000003',4,1,NULL,'72',757,'77',2,'2019-03-29 02:44:18',NULL),(4,'MO000004',6,2,'2019-03-22','ef',333,'333',2,'2019-03-29 02:46:17',NULL);

/*Table structure for table `maintenance_modification_history` */

DROP TABLE IF EXISTS `maintenance_modification_history`;

CREATE TABLE `maintenance_modification_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(10) DEFAULT NULL,
  `MODIFICATION_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `MODI_TYPE` int(1) DEFAULT NULL,
  `MODI_DATE` date DEFAULT NULL,
  `MODI_WORK` varchar(200) DEFAULT NULL,
  `MODI_COST` double DEFAULT NULL,
  `MODI_REASON` varchar(200) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `MODI_DA` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `maintenance_modification_history` */

insert  into `maintenance_modification_history`(`ID`,`TRANSACTION_NO`,`MODIFICATION_ID`,`ASSET_ID`,`MODI_TYPE`,`MODI_DATE`,`MODI_WORK`,`MODI_COST`,`MODI_REASON`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`,`MODI_DA`) values (2,'MO000001',1,2,1,NULL,'4245252',53524,'edd',2,'2019-03-29 02:30:17',2,'2019-03-29 02:24:45',NULL),(3,'MO000001',1,2,1,NULL,'4245252',53524,'111111',2,'2019-03-29 02:33:48',2,'2019-03-29 02:30:17',NULL),(4,'MO000001',1,2,1,NULL,'4245252',223,'111111',2,'2019-03-29 02:37:59',2,'2019-03-29 02:33:48',NULL),(5,'MO000001',1,2,1,NULL,'4245252',152,'111111',2,'2019-03-29 02:38:45',2,'2019-03-29 02:37:59',NULL),(6,'MO000001',1,2,1,'2019-03-22','aaaaaaaaaaaaa',152,'111111',2,'2019-03-29 02:44:03',2,'2019-03-29 02:38:45',NULL);

/*Table structure for table `maintenance_office_equipment` */

DROP TABLE IF EXISTS `maintenance_office_equipment`;

CREATE TABLE `maintenance_office_equipment` (
  `OFFICE_EQUIPMENTS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `TYPE_FUEL` varchar(20) DEFAULT NULL,
  `MAKE` varchar(20) DEFAULT NULL,
  `COUNTRY_ORIGIN` varchar(50) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `YEAR_MANUFACTURE` int(6) DEFAULT '0',
  `WIDTH` varchar(6) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `COLOUR` varchar(20) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`OFFICE_EQUIPMENTS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_office_equipment` */

insert  into `maintenance_office_equipment`(`OFFICE_EQUIPMENTS_ID`,`ASSET_ID`,`TYPE_FUEL`,`MAKE`,`COUNTRY_ORIGIN`,`MODEL`,`YEAR_MANUFACTURE`,`WIDTH`,`LENGTH`,`WEIGHT`,`HEIGHT`,`COLOUR`,`IS_WARRANTY`,`IS_INSURANCE`,`IS_SERVICE_AGRE`,`COMMENTS`,`USER_ID`,`ACTION_TIME`) values (1,2,'55','55','55','555',5544,'101010','55','ghjh','555',NULL,0,1,0,NULL,2,'2019-03-28 09:54:45');

/*Table structure for table `maintenance_office_equipment_history` */

DROP TABLE IF EXISTS `maintenance_office_equipment_history`;

CREATE TABLE `maintenance_office_equipment_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OFFICE_EQUIPMENTS_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `TYPE_FUEL` varchar(20) DEFAULT NULL,
  `MAKE` varchar(20) DEFAULT NULL,
  `COUNTRY_ORIGIN` varchar(50) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `YEAR_MANUFACTURE` int(6) DEFAULT '0',
  `WIDTH` varchar(6) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `COLOUR` varchar(20) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_office_equipment_history` */

insert  into `maintenance_office_equipment_history`(`ID`,`OFFICE_EQUIPMENTS_ID`,`ASSET_ID`,`TYPE_FUEL`,`MAKE`,`COUNTRY_ORIGIN`,`MODEL`,`YEAR_MANUFACTURE`,`WIDTH`,`LENGTH`,`WEIGHT`,`HEIGHT`,`COLOUR`,`IS_WARRANTY`,`IS_INSURANCE`,`IS_SERVICE_AGRE`,`COMMENTS`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`) values (3,1,2,'55','55','55','555',5544,'55','55','ghjh','555',NULL,0,1,0,NULL,2,'2019-03-28 09:54:45',2,'2019-03-28 09:54:14');

/*Table structure for table `maintenance_plant_machinary` */

DROP TABLE IF EXISTS `maintenance_plant_machinary`;

CREATE TABLE `maintenance_plant_machinary` (
  `PLANT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `TYPE_FUEL` varchar(20) DEFAULT NULL,
  `MAKE` varchar(20) DEFAULT NULL,
  `COUNTRY_ORIGIN` varchar(50) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `YEAR_MANUFACTURE` int(6) DEFAULT '0',
  `WEIDTH` varchar(10) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `MANUFACTURE` varchar(100) DEFAULT NULL,
  `BAYER` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `TELEPHONE` varchar(15) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  `plantId` int(11) NOT NULL,
  PRIMARY KEY (`PLANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_plant_machinary` */

/*Table structure for table `maintenance_plant_machinary_history` */

DROP TABLE IF EXISTS `maintenance_plant_machinary_history`;

CREATE TABLE `maintenance_plant_machinary_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PLANT_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `TYPE_FUEL` varchar(20) DEFAULT NULL,
  `MAKE` varchar(20) DEFAULT NULL,
  `COUNTRY_ORIGIN` varchar(50) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `YEAR_MANUFACTURE` int(6) DEFAULT NULL,
  `WEIDTH` varchar(10) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `MANUFACTURE` varchar(100) DEFAULT NULL,
  `BAYER` varchar(100) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `TELEPHONE` varchar(15) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_plant_machinary_history` */

/*Table structure for table `maintenance_running_data` */

DROP TABLE IF EXISTS `maintenance_running_data`;

CREATE TABLE `maintenance_running_data` (
  `RUNNING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(8) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `DATE` varchar(12) DEFAULT NULL,
  `TIME` varchar(25) DEFAULT NULL,
  `MET_FRO_NO` int(14) DEFAULT NULL,
  `MET_TO_NO` int(14) DEFAULT NULL,
  `COST` double(14,2) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`RUNNING_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `maintenance_running_data` */

insert  into `maintenance_running_data`(`RUNNING_ID`,`TRANSACTION_NO`,`ASSET_ID`,`DATE`,`TIME`,`MET_FRO_NO`,`MET_TO_NO`,`COST`,`REMARK`,`USER_ID`,`ACTION_TIME`) values (2,'RD000002',4,'03/27/2019','2:00am',554,45,55.00,'555',2,'2019-03-28 09:39:22'),(3,'RD000003',6,'03/22/2019','2:00am',122,123,100.00,'35',2,'2019-03-28 09:41:08'),(4,'RD000004',5,'03/28/2019','2:00am',33,333,3333333333.00,'333',2,'2019-03-28 09:42:04'),(5,'RD000001',2,'03/02/2019','1:00am',3,1,1.00,'555',2,'2019-03-28 09:42:44');

/*Table structure for table `maintenance_running_data_history` */

DROP TABLE IF EXISTS `maintenance_running_data_history`;

CREATE TABLE `maintenance_running_data_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RUNNING_ID` int(11) DEFAULT NULL,
  `TRANSACTION_NO` varchar(8) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `DATE` varchar(12) DEFAULT NULL,
  `TIME` varchar(25) DEFAULT NULL,
  `MET_FRO_NO` int(14) DEFAULT NULL,
  `MET_TO_NO` int(14) DEFAULT NULL,
  `COST` double(14,2) DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `maintenance_running_data_history` */

insert  into `maintenance_running_data_history`(`ID`,`RUNNING_ID`,`TRANSACTION_NO`,`ASSET_ID`,`DATE`,`TIME`,`MET_FRO_NO`,`MET_TO_NO`,`COST`,`REMARK`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`) values (1,1,'RD000001',2,'03/02/2019','1:00am',3,1,1.00,'555',2,'2019-03-28 09:42:44',0,'2019-03-26 01:26:43');

/*Table structure for table `maintenance_service_agreement` */

DROP TABLE IF EXISTS `maintenance_service_agreement`;

CREATE TABLE `maintenance_service_agreement` (
  `AGREE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(10) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `AGREE_NUMBER` varchar(20) DEFAULT NULL,
  `AGREE_PERIOD` varchar(50) DEFAULT NULL,
  `AGREE_FROM` date DEFAULT NULL,
  `AGREE_TO` date DEFAULT NULL,
  `AGREE_COST` double(14,2) DEFAULT NULL,
  `AGREE_COMPANY` varchar(100) DEFAULT NULL,
  `AGREE_SERVICE_INTERVAL` varchar(10) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`AGREE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_service_agreement` */

insert  into `maintenance_service_agreement`(`AGREE_ID`,`TRANSACTION_NO`,`ASSET_ID`,`AGREE_NUMBER`,`AGREE_PERIOD`,`AGREE_FROM`,`AGREE_TO`,`AGREE_COST`,`AGREE_COMPANY`,`AGREE_SERVICE_INTERVAL`,`USER_ID`,`ACTION_TIME`) values (1,'SA000001',3,'250','ssssss','2019-03-29','2019-03-31',2452523.00,'asxassa','gr34t34343',2,'2019-03-28 23:46:40');

/*Table structure for table `maintenance_service_agreement_history` */

DROP TABLE IF EXISTS `maintenance_service_agreement_history`;

CREATE TABLE `maintenance_service_agreement_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(10) DEFAULT NULL,
  `AGREE_ID` int(11) DEFAULT NULL,
  `ASSET_ID` varchar(11) DEFAULT NULL,
  `AGREE_NUMBER` varchar(20) DEFAULT NULL,
  `AGREE_PERIOD` varchar(50) DEFAULT NULL,
  `AGREE_FROM` date DEFAULT NULL,
  `AGREE_TO` date DEFAULT NULL,
  `AGREE_COST` double DEFAULT NULL,
  `AGREE_COMPANY` varchar(100) DEFAULT NULL,
  `AGREE_SERVICE_INTERVAL` varchar(10) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_service_agreement_history` */

insert  into `maintenance_service_agreement_history`(`ID`,`TRANSACTION_NO`,`AGREE_ID`,`ASSET_ID`,`AGREE_NUMBER`,`AGREE_PERIOD`,`AGREE_FROM`,`AGREE_TO`,`AGREE_COST`,`AGREE_COMPANY`,`AGREE_SERVICE_INTERVAL`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`) values (1,'SA000001',1,'3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'2019-03-28 22:38:42',2,'2019-03-28 09:21:04'),(2,'SA000001',1,'3',NULL,'ssssss','2019-03-29','2019-03-31',2452523,'asxassa','gr34t34343',2,'2019-03-28 23:46:40',2,'2019-03-28 22:38:42');

/*Table structure for table `maintenance_software` */

DROP TABLE IF EXISTS `maintenance_software`;

CREATE TABLE `maintenance_software` (
  `SOFTWARE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `SELLER_DEALER` varchar(100) DEFAULT NULL,
  `SELLER_ADD` varchar(200) DEFAULT NULL,
  `SOFT_OWNER_NAME` varchar(100) DEFAULT NULL,
  `PRODUCT_KEY` varchar(100) DEFAULT NULL,
  `NO_USERS` varchar(12) DEFAULT NULL,
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`SOFTWARE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_software` */

insert  into `maintenance_software`(`SOFTWARE_ID`,`ASSET_ID`,`SELLER_DEALER`,`SELLER_ADD`,`SOFT_OWNER_NAME`,`PRODUCT_KEY`,`NO_USERS`,`IS_SERVICE_AGRE`,`COMMENTS`,`USER_ID`,`ACTION_TIME`) values (1,2,'sfdsdfeqr3r','fgdfgdrer','543523','fgdf4t4rt','100',1,NULL,2,'2019-03-27 21:32:13');

/*Table structure for table `maintenance_software_history` */

DROP TABLE IF EXISTS `maintenance_software_history`;

CREATE TABLE `maintenance_software_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SOFTWARE_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `SELLER_DEALER` varchar(100) DEFAULT NULL,
  `SELLER_ADD` varchar(200) DEFAULT NULL,
  `SOFT_OWNER_NAME` varchar(100) DEFAULT NULL,
  `PRODUCT_KEY` varchar(100) DEFAULT NULL,
  `NO_USERS` varchar(12) DEFAULT NULL,
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_software_history` */

insert  into `maintenance_software_history`(`ID`,`SOFTWARE_ID`,`ASSET_ID`,`SELLER_DEALER`,`SELLER_ADD`,`SOFT_OWNER_NAME`,`PRODUCT_KEY`,`NO_USERS`,`IS_SERVICE_AGRE`,`COMMENTS`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`) values (1,1,2,'sfdsdfeqr3r','fgdfgdrer','543523','fgdf4t4rt','56',1,NULL,2,'2019-03-27 21:32:13',2,'2019-03-27 21:21:41');

/*Table structure for table `maintenance_sport_equipment` */

DROP TABLE IF EXISTS `maintenance_sport_equipment`;

CREATE TABLE `maintenance_sport_equipment` (
  `SPORT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `TYPE_FUEL` varchar(20) DEFAULT NULL,
  `MAKE` varchar(20) DEFAULT NULL,
  `COUNTRY_ORIGIN` varchar(50) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `YEAR_MANUFACTURE` int(6) DEFAULT '0',
  `WIDTH` varchar(6) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`SPORT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_sport_equipment` */

insert  into `maintenance_sport_equipment`(`SPORT_ID`,`ASSET_ID`,`TYPE_FUEL`,`MAKE`,`COUNTRY_ORIGIN`,`MODEL`,`YEAR_MANUFACTURE`,`WIDTH`,`LENGTH`,`WEIGHT`,`HEIGHT`,`IS_WARRANTY`,`IS_INSURANCE`,`IS_SERVICE_AGRE`,`COMMENTS`,`USER_ID`,`ACTION_TIME`) values (1,2,'afsf','asfasf','faf','111111',1312,'hfhfgh','ff6456','dfgdfg','fhfgh4',0,1,0,NULL,2,'2019-03-27 21:04:53');

/*Table structure for table `maintenance_sport_equipment_history` */

DROP TABLE IF EXISTS `maintenance_sport_equipment_history`;

CREATE TABLE `maintenance_sport_equipment_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SPORT_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `TYPE_FUEL` varchar(20) DEFAULT NULL,
  `MAKE` varchar(20) DEFAULT NULL,
  `COUNTRY_ORIGIN` varchar(50) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `YEAR_MANUFACTURE` int(6) DEFAULT '0',
  `WIDTH` varchar(6) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_sport_equipment_history` */

insert  into `maintenance_sport_equipment_history`(`ID`,`SPORT_ID`,`ASSET_ID`,`TYPE_FUEL`,`MAKE`,`COUNTRY_ORIGIN`,`MODEL`,`YEAR_MANUFACTURE`,`WIDTH`,`LENGTH`,`WEIGHT`,`HEIGHT`,`IS_WARRANTY`,`IS_INSURANCE`,`IS_SERVICE_AGRE`,`COMMENTS`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`) values (1,1,2,'afsf','asfasf','faf','asfa',1312,'hfhfgh','ff6456','dfgdfg','fhfgh4',0,1,0,NULL,2,'2019-03-27 21:04:53',2,'2019-03-27 21:00:25');

/*Table structure for table `maintenance_teaching_equipment` */

DROP TABLE IF EXISTS `maintenance_teaching_equipment`;

CREATE TABLE `maintenance_teaching_equipment` (
  `TEACHING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `WIDTH` varchar(10) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`TEACHING_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_teaching_equipment` */

insert  into `maintenance_teaching_equipment`(`TEACHING_ID`,`ASSET_ID`,`MODEL`,`WIDTH`,`LENGTH`,`WEIGHT`,`HEIGHT`,`IS_WARRANTY`,`IS_INSURANCE`,`IS_SERVICE_AGRE`,`COMMENTS`,`USER_ID`,`ACTION_TIME`) values (1,2,'dfvdvd','3232222222','sfd','sdfsdf','fsf',0,0,0,NULL,2,'2019-03-28 09:59:13');

/*Table structure for table `maintenance_teaching_equipment_history` */

DROP TABLE IF EXISTS `maintenance_teaching_equipment_history`;

CREATE TABLE `maintenance_teaching_equipment_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEACHING_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `WIDTH` varchar(10) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `IS_SERVICE_AGRE` int(1) DEFAULT '0',
  `COMMENTS` varchar(200) DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_teaching_equipment_history` */

/*Table structure for table `maintenance_vehicle` */

DROP TABLE IF EXISTS `maintenance_vehicle`;

CREATE TABLE `maintenance_vehicle` (
  `VEHICLEID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_ID` int(11) DEFAULT NULL,
  `REGI_NO` varchar(12) DEFAULT NULL,
  `VEHICLE_CLASS` varchar(50) DEFAULT NULL,
  `TYPE_FUEL` varchar(20) DEFAULT NULL,
  `MAKE` varchar(20) DEFAULT NULL,
  `COUNTRY_ORIGIN` varchar(50) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `YEAR_MANUFACTUTE` int(6) DEFAULT NULL,
  `COLOUR` varchar(20) DEFAULT NULL,
  `CHASSIS_NO` varchar(20) DEFAULT NULL,
  `ENGINE_NO` varchar(20) DEFAULT NULL,
  `COMMENTS` varchar(200) DEFAULT NULL,
  `CY_CAPACITY` double DEFAULT '0',
  `TAX_CLASS` varchar(50) DEFAULT NULL,
  `REGI_STATUS` varchar(50) DEFAULT NULL,
  `PREVI_OWNER_NO` int(99) DEFAULT NULL,
  `SEAT_CAPACITY` int(3) DEFAULT NULL,
  `TYRE_SIZE_FRONT` varchar(10) DEFAULT NULL,
  `TYRE_SIZE_REAR` varchar(10) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `SELLER_NAME` varchar(50) DEFAULT NULL,
  `SELLER_ADDRESS` varchar(100) DEFAULT NULL,
  `SELLER_TELEPHONE_NO` varchar(20) DEFAULT NULL,
  `REG_PROVINCIAL` varchar(100) DEFAULT NULL,
  `FIRST_REGISTRATION_DATE` varchar(10) DEFAULT NULL,
  `DA_LICENCE` varchar(6) DEFAULT NULL,
  `SERVICE_INTERVAL` varchar(10) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`VEHICLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_vehicle` */

/*Table structure for table `maintenance_vehicle_history` */

DROP TABLE IF EXISTS `maintenance_vehicle_history`;

CREATE TABLE `maintenance_vehicle_history` (
  `VEHICLE_HISTORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `VEHICLEID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `REGI_NO` varchar(12) DEFAULT NULL,
  `VEHICLE_CLASS` varchar(50) DEFAULT NULL,
  `TYPE_FUEL` varchar(20) DEFAULT NULL,
  `MAKE` varchar(20) DEFAULT NULL,
  `COUNTRY_ORIGIN` varchar(50) DEFAULT NULL,
  `MODEL` varchar(50) DEFAULT NULL,
  `YEAR_MANUFACTUTE` int(6) DEFAULT NULL,
  `COLOUR` varchar(20) DEFAULT NULL,
  `CHASSIS_NO` varchar(20) DEFAULT NULL,
  `ENGINE_NO` varchar(20) DEFAULT NULL,
  `COMMENTS` varchar(200) DEFAULT NULL,
  `CY_CAPACITY` double DEFAULT NULL,
  `TAX_CLASS` varchar(50) DEFAULT NULL,
  `REGI_STATUS` varchar(50) DEFAULT NULL,
  `PREVI_OWNER_NO` int(99) DEFAULT NULL,
  `SEAT_CAPACITY` int(3) DEFAULT NULL,
  `TYRE_SIZE_FRONT` varchar(10) DEFAULT NULL,
  `TYRE_SIZE_REAR` varchar(10) DEFAULT NULL,
  `LENGTH` varchar(6) DEFAULT NULL,
  `WEIGHT` varchar(6) DEFAULT NULL,
  `HEIGHT` varchar(6) DEFAULT NULL,
  `SELLER_NAME` varchar(50) DEFAULT NULL,
  `SELLER_ADDRESS` varchar(100) DEFAULT NULL,
  `SELLER_TELEPHONE_NO` varchar(20) DEFAULT NULL,
  `REG_PROVINCIAL` varchar(100) DEFAULT NULL,
  `FIRST_REGISTRATION_DATE` varchar(100) DEFAULT NULL,
  `DA_LICENCE` varchar(6) DEFAULT NULL,
  `SERVICE_INTERVAL` varchar(10) DEFAULT NULL,
  `IS_WARRANTY` int(1) DEFAULT '0',
  `IS_INSURANCE` int(1) DEFAULT '0',
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`VEHICLE_HISTORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_vehicle_history` */

/*Table structure for table `maintenance_warranty` */

DROP TABLE IF EXISTS `maintenance_warranty`;

CREATE TABLE `maintenance_warranty` (
  `WARRANTY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(10) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `WARRANTY_PERIOD` varchar(10) DEFAULT NULL,
  `WARRANTY_PERIOD_FROM` date DEFAULT NULL,
  `WARRANTY_PERIOD_TO` date DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`WARRANTY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_warranty` */

insert  into `maintenance_warranty`(`WARRANTY_ID`,`TRANSACTION_NO`,`ASSET_ID`,`WARRANTY_PERIOD`,`WARRANTY_PERIOD_FROM`,`WARRANTY_PERIOD_TO`,`USER_ID`,`ACTION_TIME`) values (1,'WA000001',2,'3213','2019-03-22','2019-03-30',2,'2019-03-28 16:03:11');

/*Table structure for table `maintenance_warranty_history` */

DROP TABLE IF EXISTS `maintenance_warranty_history`;

CREATE TABLE `maintenance_warranty_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANSACTION_NO` varchar(10) DEFAULT NULL,
  `WARRANTY_ID` int(11) DEFAULT NULL,
  `ASSET_ID` int(11) DEFAULT NULL,
  `WARRANTY_PERIOD` varchar(10) DEFAULT NULL,
  `WARRANTY_PERIOD_FROM` date DEFAULT NULL,
  `WARRANTY_PERIOD_TO` date DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `UPDATE_TIME` timestamp NULL DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `maintenance_warranty_history` */

insert  into `maintenance_warranty_history`(`ID`,`TRANSACTION_NO`,`WARRANTY_ID`,`ASSET_ID`,`WARRANTY_PERIOD`,`WARRANTY_PERIOD_FROM`,`WARRANTY_PERIOD_TO`,`UPDATE_USER`,`UPDATE_TIME`,`USER_ID`,`ACTION_TIME`) values (1,'WA000001',NULL,2,'3213',NULL,NULL,2,'2019-03-28 16:03:11',2,'2019-03-28 16:03:03');

/*Table structure for table `maxcode` */

DROP TABLE IF EXISTS `maxcode`;

CREATE TABLE `maxcode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TR_TYPE` varchar(255) DEFAULT NULL,
  `TR_MAX_NO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `maxcode` */

/*Table structure for table `physical_verification` */

DROP TABLE IF EXISTS `physical_verification`;

CREATE TABLE `physical_verification` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCATION_ID` int(11) DEFAULT NULL,
  `DETAIL_ID` varchar(11) DEFAULT NULL,
  `DETAIL_CODE` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `BALANCE` double DEFAULT '0',
  `DATE` date DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `physical_verification` */

/*Table structure for table `report_preparation_data` */

DROP TABLE IF EXISTS `report_preparation_data`;

CREATE TABLE `report_preparation_data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSET_CODE` varchar(20) DEFAULT NULL,
  `MAIN_CAT` varchar(11) DEFAULT NULL,
  `SUB_CAT` varchar(11) DEFAULT NULL,
  `DETAIL_CAT` varchar(11) DEFAULT NULL,
  `COMPANY_CODE` varchar(11) DEFAULT NULL,
  `DEPARTMENT_CODE` varchar(11) DEFAULT NULL,
  `SECTION_CODE` varchar(11) DEFAULT NULL,
  `LOCATION_CODE` varchar(35) DEFAULT NULL,
  `IS_DISPOSAL` tinyint(4) DEFAULT NULL,
  `DISPOSAL_DATE` date DEFAULT NULL,
  `DISPOSAL_AMOUNT` double DEFAULT NULL,
  `DISP_VALUE_DISPOSAL` double DEFAULT NULL,
  `IS_TRANSFER` tinyint(4) DEFAULT '0',
  `TRANSFER_DATE` date DEFAULT NULL,
  `NO_OF_TRANSFERS` int(11) DEFAULT NULL,
  `IS_DAMAGE` tinyint(4) DEFAULT NULL,
  `DAMAGE_DATE` date DEFAULT NULL,
  `NO_OF_DAMAGE` int(11) DEFAULT NULL,
  `IS_IMPROVEMENT` tinyint(4) DEFAULT '0',
  `IMPROVEMENT_DATE` date DEFAULT NULL,
  `LEDGER_CODE` varchar(11) DEFAULT NULL,
  `LIFE_TIME` varchar(11) DEFAULT NULL,
  `DEPRECIATION_RATE` double DEFAULT NULL,
  `ASSET_VALUE` double DEFAULT '0',
  `VALUE_AFTER_IMPROVEMENT` double DEFAULT '0',
  `FROM_DATE_VALUE` double DEFAULT '0',
  `FROM_DATE_DISP_VAL` double DEFAULT '0',
  `BF_DISP_VALUE` double DEFAULT '0',
  `TO_DATE_VALUE` double DEFAULT '0',
  `TO_DATE_DISP_VAL` double DEFAULT '0',
  `CURRENT_VALUE` double DEFAULT '0',
  `TAX_RATE` double DEFAULT '0',
  `FROM_DATE_TAX_VALUE` double DEFAULT '0',
  `FROM_DATE_TAX_DISP_VAL` double DEFAULT '0',
  `TO_DATE_TAX_VALUE` double DEFAULT '0',
  `TO_DATE_TAX_DISP_VAL` double DEFAULT '0',
  `TAX_CURRNT_VALUE` double DEFAULT '0',
  `AUTH_PERSON` varchar(45) DEFAULT NULL,
  `ANALYSIS_CODE` varchar(11) DEFAULT NULL,
  `PURCHASED_DATE` date DEFAULT NULL,
  `REGISTED_DATE` date DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `CURRENCY_TYPE` int(5) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8;

/*Data for the table `report_preparation_data` */

/*Table structure for table `report_preparation_detail_balance` */

DROP TABLE IF EXISTS `report_preparation_detail_balance`;

CREATE TABLE `report_preparation_detail_balance` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DETAIL_CODE_ID` int(11) DEFAULT NULL,
  `BALANCE` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

/*Data for the table `report_preparation_detail_balance` */

insert  into `report_preparation_detail_balance`(`ID`,`DETAIL_CODE_ID`,`BALANCE`) values (200,5,0),(201,6,1),(202,7,16),(203,8,0),(204,9,0),(205,10,1),(206,11,4),(207,12,19),(208,13,0),(209,14,1),(210,15,0),(211,16,8),(212,17,1),(213,18,1),(214,19,1),(215,20,0),(216,21,2),(217,22,2),(218,23,0),(219,24,0),(220,25,2),(221,26,3),(222,27,1),(223,28,4),(224,29,11),(225,30,5),(226,31,0),(227,32,17),(228,33,2),(229,34,0),(230,35,0),(231,36,0),(232,37,6),(233,38,1),(234,39,1),(235,40,1),(236,41,1),(237,42,1),(238,43,2),(239,44,1),(240,45,1),(241,46,2),(242,47,1),(243,48,1),(244,49,1),(245,50,1),(246,52,1),(247,53,1),(248,54,40),(249,55,1),(250,56,1),(251,57,1),(252,58,2),(253,59,1),(254,60,1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `role` */

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FLOOR_ID` int(11) NOT NULL,
  `ROOM_CODE` varchar(11) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FLOW_ID` (`FLOOR_ID`,`ROOM_CODE`),
  KEY `fk_room_flow1_idx` (`FLOOR_ID`),
  CONSTRAINT `FK3mksbvb2559qkgvt3bs2xnwef` FOREIGN KEY (`FLOOR_ID`) REFERENCES `floor` (`ID`),
  CONSTRAINT `FK_room` FOREIGN KEY (`FLOOR_ID`) REFERENCES `floor` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `room` */

insert  into `room`(`ID`,`FLOOR_ID`,`ROOM_CODE`,`DESCRIPTION`,`USER_ID`,`ACTION_TIME`) values (1,1,'RO1','R1-Finance & Administration',2,'2019-02-15 04:49:45'),(2,1,'RO2','R2-Software Development',2,'2019-02-15 04:50:36'),(3,1,'RO3','R3-Directors',2,'2019-02-15 04:51:24'),(4,1,'RO4','R4-Meeting Room',2,'2019-02-15 04:52:09');

/*Table structure for table `room_history` */

DROP TABLE IF EXISTS `room_history`;

CREATE TABLE `room_history` (
  `ID_PK` int(11) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  `FLOOR_ID` int(11) NOT NULL,
  `ROOM_CODE` varchar(11) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `STATUS` int(1) DEFAULT '0',
  PRIMARY KEY (`ID_PK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `room_history` */

/*Table structure for table `section_master` */

DROP TABLE IF EXISTS `section_master`;

CREATE TABLE `section_master` (
  `SEC_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEC_CODE` varchar(10) DEFAULT NULL,
  `SEC_DES` varchar(100) DEFAULT NULL,
  `DEP_ID` int(11) NOT NULL,
  `USER_ID` int(10) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`SEC_ID`),
  UNIQUE KEY `section_unique` (`SEC_CODE`,`DEP_ID`),
  KEY `fk_section_master_department_master1_idx` (`DEP_ID`),
  CONSTRAINT `fk_section_master_department_master1` FOREIGN KEY (`DEP_ID`) REFERENCES `department_master` (`DEP_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `section_master` */

insert  into `section_master`(`SEC_ID`,`SEC_CODE`,`SEC_DES`,`DEP_ID`,`USER_ID`,`ACTION_TIME`) values (1,'ADM','Admin',1,2,'2019-02-15 04:57:43'),(2,'ICT','ICT',2,2,'2019-02-15 04:58:13'),(3,'ADM','Admin',3,2,'2019-02-15 06:53:51');

/*Table structure for table `section_master_history` */

DROP TABLE IF EXISTS `section_master_history`;

CREATE TABLE `section_master_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEC_ID` int(11) NOT NULL,
  `SEC_CODE` varchar(10) DEFAULT NULL,
  `SEC_DES` varchar(100) DEFAULT NULL,
  `DEP_ID` int(11) NOT NULL,
  `USER_ID` int(10) NOT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `UPDATE_USER` int(11) DEFAULT NULL,
  `STATUS` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `section_master_history` */

/*Table structure for table `transfer` */

DROP TABLE IF EXISTS `transfer`;

CREATE TABLE `transfer` (
  `TF_ID` int(35) NOT NULL AUTO_INCREMENT,
  `TF_REGCODE` varchar(35) DEFAULT NULL,
  `TF_ASSET` int(35) NOT NULL,
  `TF_FROMCODE` varchar(45) NOT NULL,
  `FROM_DEP` varchar(35) DEFAULT NULL,
  `FROM_SEC` varchar(35) DEFAULT NULL,
  `FROM_LOC` varchar(35) DEFAULT NULL,
  `TF_TOCODE` varchar(45) NOT NULL,
  `TO_DEP` varchar(35) DEFAULT NULL,
  `TO_SEC` varchar(35) DEFAULT NULL,
  `TO_LOC` varchar(35) DEFAULT NULL,
  `EMP_NO_FROM` varchar(35) DEFAULT NULL,
  `EMP_NO_TO` varchar(35) DEFAULT NULL,
  `TF_DATE` datetime DEFAULT NULL,
  `TF_UPDATEBY` int(11) DEFAULT NULL,
  `ISSUED_TO` varchar(100) DEFAULT NULL,
  `COMMENTS` varchar(100) DEFAULT NULL,
  `TYPE` int(1) DEFAULT '1',
  `USER_ID` int(11) DEFAULT NULL,
  `ACTION_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`TF_ID`),
  KEY `FK_transfer` (`TF_ASSET`),
  CONSTRAINT `FK_transfer` FOREIGN KEY (`TF_ASSET`) REFERENCES `asset` (`AS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `transfer` */

insert  into `transfer`(`TF_ID`,`TF_REGCODE`,`TF_ASSET`,`TF_FROMCODE`,`FROM_DEP`,`FROM_SEC`,`FROM_LOC`,`TF_TOCODE`,`TO_DEP`,`TO_SEC`,`TO_LOC`,`EMP_NO_FROM`,`EMP_NO_TO`,`TF_DATE`,`TF_UPDATEBY`,`ISSUED_TO`,`COMMENTS`,`TYPE`,`USER_ID`,`ACTION_TIME`) values (1,NULL,40,'FIAADMPANBUIFLORO3FIAADM','FIA','ADM','PANBUIFLORO3FIAADM','FIAADMPANBUIFLORO1FIAADM','FIA','ADM','PANBUIFLORO1FIAADM',NULL,NULL,'2018-10-03 00:00:00',2,'ICT','',1,2,'2019-03-01 09:53:47');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(225) NOT NULL,
  `ACTION_TIME` datetime NOT NULL,
  `CREATED_USER` int(11) DEFAULT NULL,
  `USER_TYPE_ID` int(11) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `fk_user_user_type1_idx` (`USER_TYPE_ID`),
  CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`USER_TYPE_ID`) REFERENCES `user_type` (`USER_TYPE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`USER_ID`,`USER_NAME`,`PASSWORD`,`ACTION_TIME`,`CREATED_USER`,`USER_TYPE_ID`) values (1,'msd','$2a$10$6yAJDa3z57mBT0Od9pGp4.xPIs/Oi5/tnWbcpVtXa4m2RfSZV7NTe','2018-04-08 18:07:14',0,1),(2,'admin','$2a$10$PraFZ5r7ZR6tmr.yqpVITelI7IqnMUoaBhbTPqpWbNpNEy5Zqwaj2','2018-05-18 14:48:19',2,2),(3,'somro','$2a$10$m.9SmNBNdOaIzjz8yntekeGjRaEXV1uIv5SQnrS6l0onrSEZD2RUi','2018-04-17 20:25:46',3,2),(4,'Sachika','$2a$10$t5Ctfp24er/HizIQHea8hu3BQhDARMH/SmWLzZXsKAZjud/RVkkji','2018-08-27 15:02:31',2,1),(5,'test','$2a$10$ZiWpLGLy83EeuN4Ya3itT.SA4I69BzhVoioyA752kyk2BcgUGFU1e','2018-11-15 08:25:37',2,2);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  UNIQUE KEY `UK_it77eq964jhfqtu54081ebtio` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `user_role` */

/*Table structure for table `user_type` */

DROP TABLE IF EXISTS `user_type`;

CREATE TABLE `user_type` (
  `USER_TYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_TYPE` varchar(45) NOT NULL,
  PRIMARY KEY (`USER_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user_type` */

insert  into `user_type`(`USER_TYPE_ID`,`USER_TYPE`) values (1,'user'),(2,'admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
