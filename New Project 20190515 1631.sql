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
  `status` varchar(45) DEFAULT 'Ativo',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bairro`
--

/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` (`codigo`,`nome`,`status`) VALUES 
 (1,'Centro','Ativo'),
 (2,'Centro 2','Desativado'),
 (3,'Cachoeirinha 2','Ativo'),
 (4,'Cidade nova','Ativo');
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;


--
-- Definition of table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE `endereco` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rua` varchar(45) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `cep` varchar(45) DEFAULT NULL,
  `bairrocod` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_endereco_bairro` (`bairrocod`),
  CONSTRAINT `FK_endereco_bairro` FOREIGN KEY (`bairrocod`) REFERENCES `bairro` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `endereco`
--

/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` (`codigo`,`rua`,`numero`,`cep`,`bairrocod`) VALUES 
 (1,'Endereco numero lat','Endereco numero lat','69020-000',1),
 (2,'opa','opa','69020-030',3),
 (3,'rua do cara porra','12123kdf','13249-912',4),
 (4,'rua super','numero super','21343-123',4),
 (5,'rua super','numero super','21343-123',4),
 (6,'rua super','numero super','21343-123',4),
 (7,'rua super','numero super','21343-123',4),
 (8,'rua super','numero super','21343-123',4),
 (9,'Avenida Maceió','L-327','21343-123',3),
 (10,'Rua Igarape manaus','12','21343-123',1),
 (11,'Avenida Joaquim Nabuco','12','69020-030',2);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;


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
 (1,3,'13.00',NULL),
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
 (9,3,'3.24',NULL),
 (16,3,'14.00',NULL),
 (16,4,'12.50',NULL),
 (16,8,'55.05',NULL);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;


--
-- Definition of table `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT 'Ativo',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marca`
--

/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`codigo`,`nome`,`status`) VALUES 
 (1,'ITAMBE 2','Ativo'),
 (4,'Nestle 2','Ativo'),
 (7,'bauduco','Desativado'),
 (8,'Nova marca','Ativo');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;


--
-- Definition of table `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `marcacod` int(10) unsigned DEFAULT NULL,
  `status` varchar(45) DEFAULT 'Ativo',
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_produto_marca` (`marcacod`),
  CONSTRAINT `FK_produto_marca` FOREIGN KEY (`marcacod`) REFERENCES `marca` (`codigo`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produto`
--

/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`codigo`,`nome`,`marcacod`,`status`,`descricao`) VALUES 
 (3,'Leite modal 2',1,'Ativo','Leito da melhor qualidade'),
 (4,'Leite',4,'Ativo',NULL),
 (6,'Leite Desnatado',1,'Ativo',NULL),
 (7,'Leite condensado',4,'Ativo',NULL),
 (8,'Bolacha Crack',4,'Ativo',NULL),
 (9,'aeddased',NULL,'Ativo',NULL),
 (10,'Testando template',4,'Ativo',NULL),
 (11,'Teste 2 MODAL',7,'Ativo',NULL),
 (12,'ITAMBE 2',4,'Ativo',NULL),
 (13,'ITAMBE 2',4,'Ativo',NULL),
 (14,'Celular',8,'Ativo','celular descricaoooo'),
 (15,'Celular',8,'Ativo',NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;


--
-- Definition of table `supermercado`
--

DROP TABLE IF EXISTS `supermercado`;
CREATE TABLE `supermercado` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT 'Ativo',
  `enderecocod` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_supermercado_endereco` (`enderecocod`),
  CONSTRAINT `FK_supermercado_endereco` FOREIGN KEY (`enderecocod`) REFERENCES `endereco` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supermercado`
--

/*!40000 ALTER TABLE `supermercado` DISABLE KEYS */;
INSERT INTO `supermercado` (`codigo`,`nome`,`status`,`enderecocod`) VALUES 
 (1,'Supermercado DB','Ativo',NULL),
 (2,'Supermercado Carrefour','Ativo',NULL),
 (3,'Supermercado Nova Era','Ativo',NULL),
 (4,'sdfasdfadsf','Ativo',NULL),
 (5,'NOME MODAL','Ativo',NULL),
 (6,'Nestle','Ativo',NULL),
 (7,'Nestle','Ativo',NULL),
 (8,'Teste 2 MODAL SDFGSF','Ativo',NULL),
 (9,'teste','Ativo',NULL),
 (10,'teste 3','Ativo',NULL),
 (11,'tewrtwer','Ativo',NULL),
 (12,'Teste 2 MODAL','Ativo',NULL),
 (13,'teste 2','Ativo',NULL),
 (14,'teste 2','Ativo',NULL),
 (15,'Supermercado DB','Ativo',NULL),
 (16,'Carefur','Ativo',9),
 (17,'Supermercado DB','Ativo',10);
/*!40000 ALTER TABLE `supermercado` ENABLE KEYS */;


--
-- Definition of table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE `tipo_usuario` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_usuario`
--

/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` (`codigo`,`descricao`) VALUES 
 (1,'Adminstrador'),
 (2,'Cliente');
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
  `email` varchar(45) DEFAULT NULL,
  `rg` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'Ativado',
  `telefone` varchar(45) DEFAULT NULL,
  `enderecocod` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_usuario_tipo` (`tipocod`),
  KEY `FK_usuario_endereco` (`enderecocod`),
  CONSTRAINT `FK_usuario_endereco` FOREIGN KEY (`enderecocod`) REFERENCES `endereco` (`codigo`),
  CONSTRAINT `FK_usuario_tipo` FOREIGN KEY (`tipocod`) REFERENCES `tipo_usuario` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`codigo`,`nome`,`login`,`senha`,`tipocod`,`cpf`,`email`,`rg`,`status`,`telefone`,`enderecocod`) VALUES 
 (1,'Pedro araujo','pedroaraujo','senhaetal',1,'123.412.341-23','teste12@gmail.com','1234','Ativado','(92) 99149-5555',NULL),
 (2,'Maria da Silvav','mariadasilva','1234rfsfdsg',1,'234.523.452-12','teste@gmail.com','','Ativado','(92) 00001-3241',NULL),
 (3,'Jõao Paulo silva','joaopaulo','joaopaulosenha',1,'234.523.452-12','teste@gmail.com','','Ativado',NULL,NULL),
 (4,'Anthony Lopez','lopezsantillan123','132421',1,'234.523.452-34','teste@gmail.com','','Ativado',NULL,NULL),
 (5,'Anthony Lopez','lopezsantillan','132421',1,'234.523.452-34','teste@gmail.com','','Ativado',NULL,NULL),
 (6,'Teste2222','mariadasilva','45234523452345',1,'243.523.452-34','teste@gmail.com','','Ativado',NULL,NULL),
 (7,'Teste','mariadasilva','45234523452345',1,'243.523.452-34','teste@gmail.com','','Desativado',NULL,NULL),
 (8,'marlon','23pwg','11234',1,'132.431.212-34','teste2@gmail.com','','Ativado',NULL,NULL),
 (9,'Registro br','registrobr','1234!@#$',2,'412.923.459-23','emaill444@hotmail.com','','Ativado',NULL,NULL),
 (10,'carlos','calors123','carlos123',1,'241.234.012-34','carlos@gmail.com','2134032-1','Ativado','(23) 91234-0000',NULL),
 (11,'carlos','calors123','carlos123',1,'241.234.012-34','carlos@gmail.com','2134032-1','Ativado','(23) 91234-0000',NULL),
 (12,'marcelo silva','marcelo1234','marcelo123',1,'912.349.321-34','marcelo@gmail.com','0912390-0','Ativado','(92) 91234-9919',NULL),
 (13,'usuario cliente','usuariocliente','usuariocliente',2,NULL,'usuario@gmail.com',NULL,'Ativado','(92) 30340-0324',NULL),
 (15,'Nome com endereco alt','login enderoco alt','senha enderocoalt',2,'912.349.321-34','marceloalt@gmail.com','0912390-0','Ativado','(23) 91234-2123',1),
 (16,'manolo teste','manolouser','1234',2,'234.912.394-12','teste345@gmail.com','9239412-9','Ativado','(99) 12340-3210',2),
 (17,'criando cliente','opa1234123l','1234918234',2,NULL,'clientealt@gmail.com',NULL,'Ativado','(12) 39412-9341',3),
 (18,'qwer','fgsgf','23452345',2,NULL,'teste_santillan@gmail.com',NULL,'Ativado','(43) 52454-3234',11);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
