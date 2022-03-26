-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 25-Mar-2022 às 15:43
-- Versão do servidor: 8.0.17
-- versão do PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_portuario`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `con_conteiner`
--

CREATE TABLE `con_conteiner` (
  `id` int(6) NOT NULL,
  `cliente` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `numeroContainer` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tipo` enum('20','40') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('cheio','vazio') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `categoria` enum('Importação','Exportação') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `con_conteiner`
--

INSERT INTO `con_conteiner` (`id`, `cliente`, `numeroContainer`, `tipo`, `status`, `categoria`) VALUES
(1, 'Aço Metal', 'test1234567', '20', 'cheio', 'Importação'),
(2, 'FormaConteiner', 'silv1010122', '40', 'vazio', 'Exportação');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `con_conteiner`
--
ALTER TABLE `con_conteiner`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `con_conteiner`
--
ALTER TABLE `con_conteiner`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
