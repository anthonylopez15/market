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
  CONSTRAINT `FK_estoque_pro` FOREIGN KEY (`produto`) REFERENCES `produto` (`codigo`) ON DELETE CASCADE,
  CONSTRAINT `FK_estoque_super` FOREIGN KEY (`supermercado`) REFERENCES `supermercado` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estoque`
--

/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` (`supermercado`,`produto`,`preco`,`porcentagem_desconto`) VALUES 
 (16,3,'15.00',NULL),
 (16,4,'12.50',NULL),
 (16,8,'18.05',NULL),
 (17,3,'11.00',NULL),
 (17,4,'5.00',NULL),
 (17,6,'6.00',NULL);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;


--
-- Definition of table `itemproduto`
--

DROP TABLE IF EXISTS `itemproduto`;
CREATE TABLE `itemproduto` (
  `compracod` int(10) unsigned NOT NULL,
  `produto` int(10) unsigned NOT NULL,
  `preco` decimal(6,2) DEFAULT NULL,
  `quantidade` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`compracod`,`produto`),
  KEY `FK_itemproduto_produto` (`produto`),
  CONSTRAINT `FK_itemproduto_compra` FOREIGN KEY (`compracod`) REFERENCES `listacompras` (`codigo`) ON DELETE CASCADE,
  CONSTRAINT `FK_itemproduto_produto` FOREIGN KEY (`produto`) REFERENCES `produto` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `itemproduto`
--

/*!40000 ALTER TABLE `itemproduto` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemproduto` ENABLE KEYS */;


--
-- Definition of table `listacompras`
--

DROP TABLE IF EXISTS `listacompras`;
CREATE TABLE `listacompras` (
  `codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuariocod` int(10) unsigned DEFAULT NULL,
  `datahora` datetime DEFAULT NULL,
  `supermercado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `FK_listacompras_usuario` (`usuariocod`),
  CONSTRAINT `FK_listacompras_usuario` FOREIGN KEY (`usuariocod`) REFERENCES `usuario` (`codigo`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `listacompras`
--

/*!40000 ALTER TABLE `listacompras` DISABLE KEYS */;
INSERT INTO `listacompras` (`codigo`,`usuariocod`,`datahora`,`supermercado`) VALUES 
 (5,13,'2019-05-29 19:15:39',NULL),
 (6,13,'2019-05-29 19:17:46',NULL),
 (7,13,'2019-05-29 19:20:08',NULL),
 (8,13,'2019-05-29 19:36:42',NULL),
 (9,13,'2019-05-29 19:37:59',NULL),
 (10,13,'2019-05-29 19:41:07',NULL),
 (11,13,'2019-05-29 19:47:33',NULL),
 (12,13,'2019-05-29 19:58:07',NULL),
 (13,13,'2019-05-29 20:00:10',NULL),
 (14,13,'2019-05-29 20:08:32',NULL),
 (15,13,'2019-05-29 20:10:15',NULL),
 (16,13,'2019-05-29 20:11:15',NULL),
 (17,13,'2019-05-29 20:13:11',NULL),
 (18,13,'2019-05-29 20:13:52',NULL),
 (19,13,'2019-05-29 20:16:52',NULL),
 (20,13,'2019-05-29 20:35:22',NULL),
 (21,13,'2019-05-29 20:37:45',NULL),
 (22,13,'2019-05-29 21:05:45',NULL),
 (23,13,'2019-05-29 21:06:13',NULL),
 (24,13,'2019-05-29 21:06:30',NULL),
 (25,13,'2019-05-29 21:06:41',NULL),
 (26,13,'2019-05-29 21:19:12',NULL),
 (27,13,'2019-05-29 21:19:42',NULL),
 (28,13,'2019-05-29 21:23:39',NULL),
 (29,13,'2019-05-29 21:25:49',NULL),
 (30,13,'2019-05-29 21:26:05',NULL),
 (31,13,'2019-05-29 21:26:20',NULL),
 (32,13,'2019-05-29 21:27:50',NULL),
 (33,13,'2019-05-29 21:28:57',NULL),
 (34,13,'2019-05-29 21:29:18',NULL),
 (35,13,'2019-05-29 21:30:33',NULL),
 (36,13,'2019-05-29 21:57:58',NULL),
 (37,13,'2019-05-29 21:59:29',NULL),
 (38,13,'2019-05-29 23:23:49',NULL),
 (39,13,'2019-05-29 23:24:08',NULL),
 (40,13,'2019-05-29 23:24:19',NULL),
 (41,13,'2019-05-29 23:24:26',NULL),
 (42,13,'2019-05-29 23:24:58',NULL),
 (43,13,'2019-05-29 23:26:45',NULL),
 (44,13,'2019-05-29 23:26:53',NULL),
 (45,13,'2019-05-29 23:27:50',NULL),
 (46,13,'2019-05-29 23:28:00',NULL),
 (47,13,'2019-05-29 23:28:36',NULL),
 (48,13,'2019-05-29 23:30:00',NULL),
 (49,13,'2019-05-29 23:30:31',NULL),
 (50,13,'2019-05-29 23:38:46',NULL),
 (51,13,'2019-05-29 23:40:04',NULL),
 (52,13,'2019-05-29 23:40:40',NULL),
 (53,13,'2019-05-29 23:40:54',NULL),
 (54,13,'2019-05-29 23:40:58',NULL),
 (55,13,'2019-05-29 23:41:05',NULL),
 (56,13,'2019-05-29 23:41:51',NULL),
 (57,13,'2019-05-29 23:42:05',NULL),
 (58,13,'2019-05-29 23:42:58',NULL),
 (59,13,'2019-05-29 23:43:31',NULL),
 (60,13,'2019-05-29 23:43:44',NULL),
 (61,13,'2019-05-29 23:46:12',NULL),
 (62,13,'2019-05-29 23:49:43',NULL),
 (63,13,'2019-05-29 23:50:10',NULL),
 (64,13,'2019-05-29 23:51:54',NULL),
 (65,13,'2019-05-29 23:52:38',NULL),
 (66,13,'2019-05-29 23:53:54',NULL),
 (67,13,'2019-05-29 23:55:01',NULL),
 (68,13,'2019-05-29 23:55:30',NULL),
 (69,13,'2019-05-29 23:55:36',NULL),
 (70,13,'2019-05-29 23:55:55',NULL),
 (71,13,'2019-05-29 23:56:02',NULL),
 (72,13,'2019-05-29 23:56:12',NULL),
 (73,13,'2019-05-29 23:56:19',NULL),
 (74,13,'2019-05-29 23:56:30',NULL),
 (75,13,'2019-05-29 23:56:42',NULL),
 (76,13,'2019-05-29 23:56:53',NULL),
 (77,13,'2019-05-30 00:00:04',NULL),
 (78,13,'2019-05-30 00:02:09',NULL),
 (79,13,'2019-05-30 00:02:37',NULL),
 (80,13,'2019-05-30 00:02:49',NULL),
 (81,13,'2019-05-30 00:03:13',NULL),
 (82,13,'2019-05-30 00:03:21',NULL),
 (83,13,'2019-05-30 00:03:35',NULL),
 (84,13,'2019-05-30 00:03:52',NULL),
 (85,13,'2019-05-30 00:04:32',NULL),
 (86,13,'2019-05-30 00:05:50',NULL),
 (87,13,'2019-05-30 00:06:10',NULL),
 (88,13,'2019-05-30 00:06:20',NULL),
 (89,13,'2019-05-30 00:06:48',NULL),
 (90,13,'2019-05-30 00:07:26',NULL),
 (91,13,'2019-05-30 00:07:37',NULL),
 (92,13,'2019-05-30 00:07:56',NULL),
 (93,13,'2019-05-30 00:08:04',NULL),
 (94,13,'2019-05-30 00:12:31',NULL),
 (95,13,'2019-05-30 00:12:42',NULL),
 (96,13,'2019-05-30 00:13:03',NULL),
 (97,13,'2019-05-30 00:13:22',NULL),
 (98,13,'2019-05-30 00:13:51',NULL),
 (99,13,'2019-05-30 00:14:05',NULL),
 (100,13,'2019-05-30 00:14:21',NULL),
 (101,13,'2019-05-30 00:17:23',NULL),
 (102,13,'2019-05-30 00:17:45',NULL),
 (103,13,'2019-05-30 00:18:25',NULL),
 (104,13,'2019-05-30 00:23:10',NULL),
 (105,13,'2019-05-30 00:23:36',NULL),
 (106,13,'2019-05-30 00:24:39',NULL),
 (107,13,'2019-05-30 00:26:00',NULL),
 (108,13,'2019-05-30 00:26:05',NULL),
 (109,13,'2019-05-30 00:27:50',NULL),
 (110,13,'2019-05-30 00:28:17',NULL),
 (111,13,'2019-05-30 00:28:29',NULL),
 (112,13,'2019-05-30 00:29:04',NULL),
 (113,13,'2019-05-30 00:29:31',NULL),
 (114,13,'2019-05-30 00:30:58',NULL),
 (115,13,'2019-05-30 00:31:38',NULL),
 (116,13,'2019-05-30 00:31:58',NULL),
 (117,13,'2019-05-30 00:32:20',NULL),
 (118,13,'2019-05-30 00:32:32',NULL),
 (119,13,'2019-05-30 00:32:45',NULL),
 (120,13,'2019-05-30 00:33:23',NULL),
 (121,13,'2019-05-30 00:34:15',NULL),
 (122,13,'2019-05-30 00:34:30',NULL),
 (123,13,'2019-05-30 00:36:35',NULL),
 (124,13,'2019-05-30 00:36:50',NULL),
 (125,13,'2019-05-30 00:37:05',NULL),
 (126,13,'2019-05-30 00:38:42',NULL),
 (127,13,'2019-05-30 00:41:44',NULL),
 (128,13,'2019-05-30 00:42:23',NULL),
 (129,13,'2019-05-30 00:42:27',NULL),
 (130,13,'2019-05-30 00:42:56',NULL),
 (131,13,'2019-05-30 00:47:06',NULL),
 (132,13,'2019-05-30 00:48:28',NULL),
 (133,13,'2019-05-30 00:49:54',NULL),
 (134,13,'2019-05-30 00:51:02',NULL),
 (135,13,'2019-05-30 00:51:36',NULL),
 (136,13,'2019-05-30 00:55:11',NULL),
 (137,13,'2019-05-30 00:56:11',NULL),
 (138,13,'2019-05-30 01:06:06',NULL),
 (139,13,'2019-05-30 01:06:52',NULL),
 (140,13,'2019-05-30 01:08:06',NULL),
 (141,13,'2019-05-30 01:09:13',NULL),
 (142,13,'2019-05-30 01:09:22',NULL),
 (143,13,'2019-05-30 01:09:43',NULL),
 (144,13,'2019-05-30 01:09:55',NULL),
 (145,13,'2019-05-30 01:10:06',NULL),
 (146,13,'2019-05-30 01:10:08',NULL),
 (147,13,'2019-05-30 01:10:21',NULL),
 (148,13,'2019-05-30 01:10:33',NULL),
 (149,13,'2019-05-30 01:10:50',NULL),
 (150,13,'2019-05-30 01:10:59',NULL),
 (151,13,'2019-05-30 01:11:06',NULL),
 (152,13,'2019-05-30 01:11:08',NULL),
 (153,13,'2019-05-30 01:11:18',NULL);
/*!40000 ALTER TABLE `listacompras` ENABLE KEYS */;


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
 (11,'Teste 2 MODAL',7,'Desativo',NULL),
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
 (18,'teste123','teste123','23452345',2,NULL,'teste_santillan@gmail.com',NULL,'Ativado','(43) 52454-3234',11);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
