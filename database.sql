/*
SQLyog - Free MySQL GUI v5.19
Host - 5.1.54-community : Database - election_polling
*********************************************************************
Server version : 5.1.54-community
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `election_polling`;

USE `election_polling`;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `m_admin` */

DROP TABLE IF EXISTS `m_admin`;

CREATE TABLE `m_admin` (
  `Admin_code` int(10) NOT NULL AUTO_INCREMENT,
  `Admin_id` varchar(50) NOT NULL,
  `Admin_pwd` varchar(50) NOT NULL,
  PRIMARY KEY (`Admin_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `m_admin` */

insert into `m_admin` (`Admin_code`,`Admin_id`,`Admin_pwd`) values (1,'admin','admin');
insert into `m_admin` (`Admin_code`,`Admin_id`,`Admin_pwd`) values (2,'aaa','Male');
insert into `m_admin` (`Admin_code`,`Admin_id`,`Admin_pwd`) values (3,'bbbb','Male');
insert into `m_admin` (`Admin_code`,`Admin_id`,`Admin_pwd`) values (4,'ff','Female');

/*Table structure for table `m_bc_votes` */

DROP TABLE IF EXISTS `m_bc_votes`;

CREATE TABLE `m_bc_votes` (
  `T_no` int(60) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`T_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_bc_votes` */

/*Table structure for table `m_booth_manager` */

DROP TABLE IF EXISTS `m_booth_manager`;

CREATE TABLE `m_booth_manager` (
  `B_code` int(5) NOT NULL AUTO_INCREMENT,
  `B_M_name` varchar(50) NOT NULL,
  `B_M_userid` varchar(50) NOT NULL,
  `B_M_pwd` varchar(50) NOT NULL,
  `E_D_code` int(10) NOT NULL,
  `B_reference_no` varchar(50) NOT NULL,
  PRIMARY KEY (`B_code`),
  KEY `FK_m_booth_manager` (`E_D_code`),
  CONSTRAINT `m_booth_manager_ibfk_1` FOREIGN KEY (`E_D_code`) REFERENCES `m_electoral_district` (`E_D_code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `m_booth_manager` */

insert into `m_booth_manager` (`B_code`,`B_M_name`,`B_M_userid`,`B_M_pwd`,`E_D_code`,`B_reference_no`) values (2,'ashwini','ashwini','ashwini',1,'1001');

/*Table structure for table `m_candidate` */

DROP TABLE IF EXISTS `m_candidate`;

CREATE TABLE `m_candidate` (
  `C_code` int(10) NOT NULL AUTO_INCREMENT,
  `C_name` varchar(50) NOT NULL,
  `C_address` varchar(50) NOT NULL,
  `C_age` int(10) NOT NULL,
  `C_symbol` varchar(50) NOT NULL,
  `E_D_code` int(10) NOT NULL,
  `C_remarks` varchar(200) NOT NULL,
  `C_party` varchar(50) NOT NULL,
  PRIMARY KEY (`C_code`),
  KEY `FK_m_candidate` (`E_D_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `m_candidate` */

insert into `m_candidate` (`C_code`,`C_name`,`C_address`,`C_age`,`C_symbol`,`E_D_code`,`C_remarks`,`C_party`) values (1,'rag','dwd',65,'bjp.jpg',1,'please vote','bjp');
insert into `m_candidate` (`C_code`,`C_name`,`C_address`,`C_age`,`C_symbol`,`E_D_code`,`C_remarks`,`C_party`) values (2,'bbb','dwd',65,'cong.jpg',1,'please vote','congress');

/*Table structure for table `m_control_manager` */

DROP TABLE IF EXISTS `m_control_manager`;

CREATE TABLE `m_control_manager` (
  `C_M_code` int(10) NOT NULL AUTO_INCREMENT,
  `C_M_name` varchar(50) NOT NULL,
  `C_M_userid` varchar(50) NOT NULL,
  `C_M_pwd` varchar(50) NOT NULL,
  PRIMARY KEY (`C_M_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_control_manager` */

/*Table structure for table `m_electoral_district` */

DROP TABLE IF EXISTS `m_electoral_district`;

CREATE TABLE `m_electoral_district` (
  `E_D_code` int(10) NOT NULL AUTO_INCREMENT,
  `E_D_name` varchar(50) NOT NULL,
  `E_D_district` varchar(50) NOT NULL,
  `E_D_state` varchar(50) NOT NULL,
  PRIMARY KEY (`E_D_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `m_electoral_district` */

insert into `m_electoral_district` (`E_D_code`,`E_D_name`,`E_D_district`,`E_D_state`) values (1,'dharwad','dharwad','kar');

/*Table structure for table `m_vote` */

DROP TABLE IF EXISTS `m_vote`;

CREATE TABLE `m_vote` (
  `T_no` int(10) NOT NULL AUTO_INCREMENT,
  `C_code` int(10) NOT NULL,
  `B_code` int(50) NOT NULL,
  `E_D_code` int(10) NOT NULL,
  `No_votes` varchar(1000) NOT NULL,
  PRIMARY KEY (`T_no`,`C_code`,`B_code`,`E_D_code`),
  KEY `FK_m_votes` (`C_code`),
  KEY `FK_m_votes-1` (`B_code`),
  KEY `FK_m_votes-2` (`E_D_code`),
  CONSTRAINT `m_vote_ibfk_1` FOREIGN KEY (`C_code`) REFERENCES `m_candidate` (`C_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `m_vote_ibfk_2` FOREIGN KEY (`B_code`) REFERENCES `m_booth_manager` (`B_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `m_vote_ibfk_3` FOREIGN KEY (`E_D_code`) REFERENCES `m_electoral_district` (`E_D_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `m_vote` */

/*Table structure for table `m_voters` */

DROP TABLE IF EXISTS `m_voters`;

CREATE TABLE `m_voters` (
  `V_code` int(50) NOT NULL AUTO_INCREMENT,
  `V_id_no` varchar(50) NOT NULL,
  `V_name` varchar(50) NOT NULL,
  `V_address` varchar(100) DEFAULT NULL,
  `V_sex` char(10) DEFAULT NULL,
  `V_age` varchar(50) NOT NULL,
  `B_code` int(10) NOT NULL,
  `V_image` varchar(50) DEFAULT NULL,
  `V_position` varchar(20) NOT NULL,
  `V_Vote_status` varchar(20) NOT NULL,
  `finger_print_value` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`V_code`),
  KEY `FK_m_voters` (`B_code`),
  CONSTRAINT `m_voters_ibfk_1` FOREIGN KEY (`B_code`) REFERENCES `m_booth_manager` (`B_code`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `m_voters` */

insert into `m_voters` (`V_code`,`V_id_no`,`V_name`,`V_address`,`V_sex`,`V_age`,`B_code`,`V_image`,`V_position`,`V_Vote_status`,`finger_print_value`) values (1,'AP001','ashwini','btm','female','24',2,'1.jpg','available','polled','29~86');
insert into `m_voters` (`V_code`,`V_id_no`,`V_name`,`V_address`,`V_sex`,`V_age`,`B_code`,`V_image`,`V_position`,`V_Vote_status`,`finger_print_value`) values (2,'AP002','jack','btm','male','24',2,'2.jpg','available','polled','140~216');
insert into `m_voters` (`V_code`,`V_id_no`,`V_name`,`V_address`,`V_sex`,`V_age`,`B_code`,`V_image`,`V_position`,`V_Vote_status`,`finger_print_value`) values (3,'AP003','akshata','btm','female','23',2,'4.jpg','available','pending','3~39');

/*Table structure for table `m_votes` */

DROP TABLE IF EXISTS `m_votes`;

CREATE TABLE `m_votes` (
  `T_no` int(10) NOT NULL AUTO_INCREMENT,
  `C_code` int(10) DEFAULT NULL,
  `B_code` int(50) DEFAULT NULL,
  `E_D_code` int(10) DEFAULT NULL,
  `No_votes` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`T_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `m_votes` */

insert into `m_votes` (`T_no`,`C_code`,`B_code`,`E_D_code`,`No_votes`) values (1,1,2,1,'14517636612237447375893839251626426116866128143588506573215090356407584448575022177138446615927238890445654070076466743492912759916773650278970991098503703554807542465973730362534240996712442708100148287677824958700949796068596431807275749955713459254852914449728314460296392623114672629687759548127208938944');
insert into `m_votes` (`T_no`,`C_code`,`B_code`,`E_D_code`,`No_votes`) values (2,2,2,1,'26087503628803246353972310266511138572207425208784076335715137298406676207717381331127961268523991505128446561019779602304652705863377386460218018963461250623649313544944886311963169160395302766348226437545491561778578605636205090459190427500470116793673445522009787307894769526432741986615322766103924160206');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
