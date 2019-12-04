-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 04/12/2019 às 16:50
-- Versão do servidor: 5.7.28-0ubuntu0.18.04.4
-- Versão do PHP: 7.2.24-0ubuntu0.18.04.1
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET
  time_zone = "+00:00";
  /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
  /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
  /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
  /*!40101 SET NAMES utf8mb4 */;
--
  -- Banco de dados: `hospital`
  --
  -- --------------------------------------------------------
  --
  -- Estrutura para tabela `ala`
  --
  CREATE TABLE `ala` (
    `id_ala` int(11) NOT NULL,
    `fk_id_hospital` int(11) NOT NULL,
    `fk_id_especialidade` int(11) NOT NULL,
    `nome` varchar(50) NOT NULL,
    `quant_leitos` int(11) DEFAULT '1'
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura para tabela `doenca`
  --
  CREATE TABLE `doenca` (
    `id_doenca` int(11) NOT NULL,
    `doenca` varchar(50) NOT NULL,
    `nome_cientifico` varchar(50) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura para tabela `endereco`
  --
  CREATE TABLE `endereco` (
    `cep` varchar(9) NOT NULL,
    `logradouro` varchar(100) NOT NULL,
    `bairro` varchar(100) NOT NULL,
    `cidade` varchar(100) NOT NULL,
    `uf` varchar(2) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
  -- Fazendo dump de dados para tabela `endereco`
  --
INSERT INTO `endereco` (`cep`, `logradouro`, `bairro`, `cidade`, `uf`)
VALUES
  (
    '23520-120',
    'Rua Antenor',
    'Santa Cruz',
    'Rio de Janeiro',
    'RJ'
  );
-- --------------------------------------------------------
  --
  -- Estrutura para tabela `especialidade`
  --
  CREATE TABLE `especialidade` (
    `id_especialidade` int(11) NOT NULL,
    `nome` varchar(100) NOT NULL,
    `valor_dia` decimal(12, 2) NOT NULL,
    `ativo` tinyint(1) NOT NULL DEFAULT '1'
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
  -- Fazendo dump de dados para tabela `especialidade`
  --
INSERT INTO `especialidade` (`id_especialidade`, `nome`, `valor_dia`, `ativo`)
VALUES
  (1, 'Queimados', '11.00', 0),
  (2, 'Trauma', '15.00', 0),
  (5, 'Ortopedia', '50.00', 1),
  (14, 'Infantil', '23.00', 1);
-- --------------------------------------------------------
  --
  -- Estrutura para tabela `funcionario`
  --
  CREATE TABLE `funcionario` (
    `id_funcionario` int(11) NOT NULL,
    `fk_id_hospital` int(11) NOT NULL,
    `fk_cep` varchar(9) NOT NULL,
    `nome` varchar(100) NOT NULL,
    `data_nasc` date NOT NULL,
    `cpf` int(11) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura para tabela `hospital`
  --
  CREATE TABLE `hospital` (
    `id_hospital` int(11) NOT NULL,
    `nome` varchar(100) NOT NULL,
    `fk_cep` varchar(9) NOT NULL,
    `numero` varchar(100) NOT NULL,
    `complemento` varchar(100) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
  -- Fazendo dump de dados para tabela `hospital`
  --
INSERT INTO `hospital` (
    `id_hospital`,
    `nome`,
    `fk_cep`,
    `numero`,
    `complemento`
  )
VALUES
  (1, 'Hospital Geral', '23520-120', '34', NULL);
-- --------------------------------------------------------
  --
  -- Estrutura para tabela `lista_paciente`
  --
  CREATE TABLE `lista_paciente` (
    `fk_id_doenca` int(11) DEFAULT NULL,
    `fk_id_paciente` int(11) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura para tabela `medico`
  --
  CREATE TABLE `medico` (
    `fk_funcionario` int(11) NOT NULL,
    `crm` varchar(50) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura para tabela `paciente`
  --
  CREATE TABLE `paciente` (
    `id_paciente` int(11) NOT NULL,
    `fk_id_ala` int(11) DEFAULT NULL,
    `fk_id_sexo` int(11) DEFAULT NULL,
    `fk_cep` varchar(9) DEFAULT NULL,
    `nome` varchar(100) DEFAULT NULL,
    `email` varchar(100) DEFAULT NULL,
    `cpf` int(11) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
-- --------------------------------------------------------
  --
  -- Estrutura para tabela `sexo`
  --
  CREATE TABLE `sexo` (
    `id_sexo` int(11) NOT NULL,
    `sexo` varchar(100) DEFAULT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
  -- Índices de tabelas apagadas
  --
  --
  -- Índices de tabela `ala`
  --
ALTER TABLE `ala`
ADD
  PRIMARY KEY (`id_ala`),
ADD
  KEY `hospital` (`fk_id_hospital`),
ADD
  KEY `especialidade` (`fk_id_especialidade`);
--
  -- Índices de tabela `doenca`
  --
ALTER TABLE `doenca`
ADD
  PRIMARY KEY (`id_doenca`);
--
  -- Índices de tabela `endereco`
  --
ALTER TABLE `endereco`
ADD
  PRIMARY KEY (`cep`);
--
  -- Índices de tabela `especialidade`
  --
ALTER TABLE `especialidade`
ADD
  PRIMARY KEY (`id_especialidade`),
ADD
  UNIQUE KEY `especialidade` (`nome`),
ADD
  UNIQUE KEY `especialidade_2` (`nome`);
--
  -- Índices de tabela `funcionario`
  --
ALTER TABLE `funcionario`
ADD
  PRIMARY KEY (`id_funcionario`),
ADD
  UNIQUE KEY `cpf` (`cpf`),
ADD
  KEY `fk_id_hospital` (`fk_id_hospital`),
ADD
  KEY `fk_cep` (`fk_cep`);
--
  -- Índices de tabela `hospital`
  --
ALTER TABLE `hospital`
ADD
  PRIMARY KEY (`id_hospital`),
ADD
  KEY `fk_cep` (`fk_cep`);
--
  -- Índices de tabela `lista_paciente`
  --
ALTER TABLE `lista_paciente`
ADD
  KEY `FK_id_doenca` (`fk_id_doenca`),
ADD
  KEY `FK_id_paciente` (`fk_id_paciente`);
--
  -- Índices de tabela `medico`
  --
ALTER TABLE `medico`
ADD
  KEY `fk_funcionario` (`fk_funcionario`);
--
  -- Índices de tabela `paciente`
  --
ALTER TABLE `paciente`
ADD
  PRIMARY KEY (`id_paciente`),
ADD
  UNIQUE KEY `cpf` (`cpf`),
ADD
  UNIQUE KEY `email` (`email`),
ADD
  KEY `cep` (`fk_cep`),
ADD
  KEY `ala` (`fk_id_ala`),
ADD
  KEY `sexo` (`fk_id_sexo`);
--
  -- Índices de tabela `sexo`
  --
ALTER TABLE `sexo`
ADD
  PRIMARY KEY (`id_sexo`);
--
  -- AUTO_INCREMENT de tabelas apagadas
  --
  --
  -- AUTO_INCREMENT de tabela `especialidade`
  --
ALTER TABLE `especialidade`
MODIFY
  `id_especialidade` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 16;
--
  -- AUTO_INCREMENT de tabela `funcionario`
  --
ALTER TABLE `funcionario`
MODIFY
  `id_funcionario` int(11) NOT NULL AUTO_INCREMENT;
--
  -- AUTO_INCREMENT de tabela `hospital`
  --
ALTER TABLE `hospital`
MODIFY
  `id_hospital` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 2;
--
  -- AUTO_INCREMENT de tabela `sexo`
  --
ALTER TABLE `sexo`
MODIFY
  `id_sexo` int(11) NOT NULL AUTO_INCREMENT;
--
  -- Restrições para dumps de tabelas
  --
  --
  -- Restrições para tabelas `ala`
  --
ALTER TABLE `ala`
ADD
  CONSTRAINT `especialidade` FOREIGN KEY (`fk_id_especialidade`) REFERENCES `especialidade` (`id_especialidade`),
ADD
  CONSTRAINT `hospital` FOREIGN KEY (`fk_id_hospital`) REFERENCES `hospital` (`id_hospital`);
--
  -- Restrições para tabelas `funcionario`
  --
ALTER TABLE `funcionario`
ADD
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`fk_id_hospital`) REFERENCES `hospital` (`id_hospital`),
ADD
  CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`fk_cep`) REFERENCES `endereco` (`cep`);
--
  -- Restrições para tabelas `hospital`
  --
ALTER TABLE `hospital`
ADD
  CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`fk_cep`) REFERENCES `endereco` (`cep`);
--
  -- Restrições para tabelas `lista_paciente`
  --
ALTER TABLE `lista_paciente`
ADD
  CONSTRAINT `FK_id_doenca` FOREIGN KEY (`fk_id_doenca`) REFERENCES `doenca` (`id_doenca`),
ADD
  CONSTRAINT `FK_id_paciente` FOREIGN KEY (`fk_id_paciente`) REFERENCES `paciente` (`id_paciente`);
--
  -- Restrições para tabelas `medico`
  --
ALTER TABLE `medico`
ADD
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`fk_funcionario`) REFERENCES `funcionario` (`id_funcionario`);
--
  -- Restrições para tabelas `paciente`
  --
ALTER TABLE `paciente`
ADD
  CONSTRAINT `ala` FOREIGN KEY (`fk_id_ala`) REFERENCES `ala` (`id_ala`),
ADD
  CONSTRAINT `cep` FOREIGN KEY (`fk_cep`) REFERENCES `endereco` (`cep`),
ADD
  CONSTRAINT `sexo` FOREIGN KEY (`fk_id_sexo`) REFERENCES `sexo` (`id_sexo`);
  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;