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
-- Definition of table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
CREATE TABLE `bairro` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bairro`
--

/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` (`codigo`,`nome`) VALUES 
 (1,'Centro'),
 (2,'Centro 2'),
 (3,'Cachoeirinha 2');
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;


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
 (1,3,'12.00',NULL),
 (1,4,'16.50',NULL),
 (1,6,'6.50',NULL),
 (1,7,'23.40',NULL),
 (1,8,'19.90',NULL),
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marca`
--

/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`codigo`,`nome`) VALUES 
 (1,'ITAMBE 2'),
 (4,'Nestle 2'),
 (7,'bauduco'),
 (8,'Nova marca');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produto`
--

/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`codigo`,`nome`,`marcacod`) VALUES 
 (3,'Leite modal 2',1),
 (4,'Leite',4),
 (6,'Leite Desnatado',1),
 (7,'Leite condensado',4),
 (8,'Bolacha Crack',4),
 (9,'aeddased',NULL),
 (10,'Testando template',4),
 (11,'Teste 2 MODAL',7),
 (12,'ITAMBE 2',4),
 (13,'ITAMBE 2',4);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


--
-- Definition of table `supermercado`
--

DROP TABLE IF EXISTS `supermercado`;
CREATE TABLE `supermercado` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `bairrocod` int(10) unsigned DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_supermercado_bairro` (`bairrocod`),
  CONSTRAINT `FK_supermercado_bairro` FOREIGN KEY (`bairrocod`) REFERENCES `bairro` (`codigo`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supermercado`
--

/*!40000 ALTER TABLE `supermercado` DISABLE KEYS */;
INSERT INTO `supermercado` (`codigo`,`nome`,`endereco`,`bairrocod`,`telefone`) VALUES 
 (1,'Supermercado DB','coração da minha vìda MODAL',NULL,''),
 (2,'Supermercado Carrefour','TESTE MODALL SUPER 2',NULL,''),
 (3,'Supermercado Nova Era','endereco modal 3',NULL,''),
 (4,'sdfasdfadsf','TESTE MODALL SUPER 2',NULL,''),
 (5,'NOME MODAL','00000000',NULL,''),
 (6,'Nestle','endereco modal 3',NULL,''),
 (7,'Nestle','endereco modal 3',NULL,''),
 (8,'Teste 2 MODAL SDFGSF','ENDEReçõ MODAL',NULL,''),
 (9,'teste','endereco modal 3',NULL,''),
 (10,'teste 3','we4rwfsdf',NULL,''),
 (11,'tewrtwer','TESTE MODALL SUPER 2',NULL,NULL),
 (12,'Teste 2 MODAL','TESTE MODALL SUPER 2',NULL,NULL);
/*!40000 ALTER TABLE `supermercado` ENABLE KEYS */;


--
-- Definition of table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE `tipo_usuario` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_usuario`
--

/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` (`codigo`,`descricao`) VALUES 
 (1,'Adminstrador');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `tipocod` int(10) unsigned DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `bairrocod` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_usuario_tipo` (`tipocod`),
  KEY `FK_usuario_bairro` (`bairrocod`),
  CONSTRAINT `FK_usuario_bairro` FOREIGN KEY (`bairrocod`) REFERENCES `bairro` (`codigo`) ON DELETE SET NULL,
  CONSTRAINT `FK_usuario_tipo` FOREIGN KEY (`tipocod`) REFERENCES `tipo_usuario` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`codigo`,`nome`,`login`,`senha`,`tipocod`,`cpf`,`telefone`,`endereco`,`cep`,`bairrocod`) VALUES 
 (1,'Anthony Lopez Santillan','tonylsllan','senhaetal',1,'123.412.341-23','(99) 99999-9999','rua teste','12345-345',3),
 (2,'Maria da Silvav','mariadasilva','1234rfsfdsg',1,'234.523.452-12','(13) 41234-1234','Parque Residencial Manaus','69020-045',1),
 (3,'Jõao Paulo silva','joaopaulo','joaopaulosenha',1,'234.523.452-12','(19) 23000-0000','joaopaulo endereco','00000-033',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
