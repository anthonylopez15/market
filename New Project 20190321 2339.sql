-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.23-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mercado
--

CREATE DATABASE IF NOT EXISTS mercado;
USE mercado;

--
-- Definition of table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


--
-- Definition of table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE `estoque` (
  `supermercado` int(10) unsigned NOT NULL DEFAULT '0',
  `produto` int(10) unsigned NOT NULL DEFAULT '0',
  `preco` decimal(10,2) DEFAULT NULL,
  `porcentagem_desconto` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`supermercado`,`produto`) USING BTREE,
  KEY `FK_estoque_pro` (`produto`),
  CONSTRAINT `FK_estoque_pro` FOREIGN KEY (`produto`) REFERENCES `produto` (`codigo`),
  CONSTRAINT `FK_estoque_super` FOREIGN KEY (`supermercado`) REFERENCES `supermercado` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estoque`
--

/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` (`supermercado`,`produto`,`preco`,`porcentagem_desconto`) VALUES 
 (1,3,'12.34',NULL),
 (1,4,'2342.34',NULL),
 (1,7,'12.34',NULL),
 (1,8,'12.34',NULL),
 (1,9,'12.34',NULL),
 (2,8,'98.90',NULL),
 (3,8,'6.56',NULL),
 (3,9,'8.97',NULL),
 (5,3,'9.00',NULL),
 (5,9,'2.34',NULL),
 (7,4,'87.00',NULL),
 (7,9,'8.09',NULL),
 (9,3,'3.24',NULL);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;


--
-- Definition of table `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marca`
--

/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`codigo`,`nome`) VALUES 
 (1,'ITAMBE 2'),
 (4,'Nestle 2'),
 (7,'bauduco');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;


--
-- Definition of table `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `marcacod` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_produto_marca` (`marcacod`),
  CONSTRAINT `FK_produto_marca` FOREIGN KEY (`marcacod`) REFERENCES `marca` (`codigo`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produto`
--

/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`codigo`,`nome`,`marcacod`) VALUES 
 (3,'Leite',1),
 (4,'Leite',4),
 (6,'Leite Desnatado',1),
 (7,'Leite condensado',4),
 (8,'sedased',4),
 (9,'aeddased',NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


--
-- Definition of table `supermercado`
--

DROP TABLE IF EXISTS `supermercado`;
CREATE TABLE `supermercado` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supermercado`
--

/*!40000 ALTER TABLE `supermercado` DISABLE KEYS */;
INSERT INTO `supermercado` (`codigo`,`nome`,`endereco`) VALUES 
 (1,'Supermercado DB','coração da minha vìda MODAL'),
 (2,'Supermercado Carrefour','TESTE MODALL SUPER 2'),
 (3,'Supermercado Nova Era','endereco modal 3'),
 (4,'sdfasdfadsf','TESTE MODALL SUPER 2'),
 (5,'NOME MODAL','00000000'),
 (6,'Nestle','endereco modal 3'),
 (7,'Nestle','endereco modal 3'),
 (8,'Teste 2 MODAL SDFGSF','ENDEReçõ MODAL'),
 (9,'teste','endereco modal 3'),
 (10,'teste 3','we4rwfsdf');
/*!40000 ALTER TABLE `supermercado` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
