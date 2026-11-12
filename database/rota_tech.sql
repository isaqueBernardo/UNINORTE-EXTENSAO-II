-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12/11/2026 às 05:22
-- Versão do servidor: 10.11.16-MariaDB
-- Versão do PHP: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `rota_tech`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `career_answers`
--

CREATE TABLE `career_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `career_question_id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(240) NOT NULL,
  `scores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`scores`)),
  `feedback` varchar(240) DEFAULT NULL,
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `career_answers`
--

INSERT INTO `career_answers` (`id`, `career_question_id`, `label`, `scores`, `feedback`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, 'Criar uma pagina para mostrar os projetos', '{\"desenvolvimento-web\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(2, 1, 'Verificar como proteger as contas', '{\"ciberseguranca\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(3, 1, 'Pesquisar como os alunos usariam o laboratorio', '{\"dados-ia\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(4, 1, 'Inventar um desafio interativo de inauguracao', '{\"jogos-digitais\":3,\"desenvolvimento-web\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(5, 2, 'Desenha um aplicativo de pedidos simples', '{\"design-ux\":3,\"desenvolvimento-web\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(6, 2, 'Analisa horarios e tamanho das filas', '{\"dados-ia\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(7, 2, 'Cria um jogo para ensinar organizacao de filas', '{\"jogos-digitais\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(8, 2, 'Propõe uma forma segura de registrar pedidos', '{\"ciberseguranca\":3,\"desenvolvimento-web\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(9, 3, 'Investiga o roteador e as conexoes', '{\"infra-cloud\":3,\"ciberseguranca\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(10, 3, 'Prepara uma versao offline da pagina', '{\"desenvolvimento-web\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(11, 3, 'Pensa em uma experiencia alternativa para o publico', '{\"design-ux\":3,\"jogos-digitais\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(12, 3, 'Registra quando acontece para identificar padroes', '{\"dados-ia\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(13, 4, 'Confiro origem, dominio e possiveis riscos', '{\"ciberseguranca\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(14, 4, 'Produzo uma pagina de alerta educativo', '{\"desenvolvimento-web\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(15, 4, 'Transformo as dicas em quiz interativo', '{\"jogos-digitais\":3,\"ciberseguranca\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(16, 4, 'Analiso tipos de golpes mais comuns', '{\"dados-ia\":3,\"ciberseguranca\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(17, 5, 'Construir um site que a turma possa explorar', '{\"desenvolvimento-web\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(18, 5, 'Fazer um simulador com escolhas e pontuacao', '{\"jogos-digitais\":3,\"desenvolvimento-web\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(19, 5, 'Coletar dados e mostrar um grafico interessante', '{\"dados-ia\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(20, 5, 'Planejar os equipamentos e a conectividade', '{\"infra-cloud\":3,\"ciberseguranca\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(21, 6, 'Conversa com alunos e cria novas telas', '{\"design-ux\":3,\"desenvolvimento-web\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(22, 6, 'Corrige o codigo que faz as paginas travarem', '{\"desenvolvimento-web\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(23, 6, 'Estuda metricas de uso e abandono', '{\"dados-ia\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(24, 6, 'Testa riscos de acesso indevido', '{\"ciberseguranca\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(25, 7, 'Conectar as pecas e montar uma solucao', '{\"desenvolvimento-web\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(26, 7, 'Investigar erros e preservar a seguranca', '{\"ciberseguranca\":3,\"dados-ia\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(27, 7, 'Escutar ideias e criar algo intuitivo', '{\"design-ux\":3,\"jogos-digitais\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(28, 7, 'Descobrir o que os numeros estao dizendo', '{\"dados-ia\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(29, 8, 'Criar personagem, fases e recompensas', '{\"jogos-digitais\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(30, 8, 'Programar o placar e as regras', '{\"desenvolvimento-web\":3,\"jogos-digitais\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(31, 8, 'Testar se os dados de desempenho fazem sentido', '{\"dados-ia\":3,\"jogos-digitais\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(32, 8, 'Garantir que cada conta seja protegida', '{\"ciberseguranca\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(33, 9, 'Verifica dados e procura explicacoes', '{\"dados-ia\":3,\"ciberseguranca\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(34, 9, 'Desenha um infografico facil de entender', '{\"design-ux\":3,\"dados-ia\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(35, 9, 'Cria uma pagina para divulgar as descobertas', '{\"desenvolvimento-web\":3,\"dados-ia\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(36, 9, 'Pensa em um jogo para explorar os resultados', '{\"jogos-digitais\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(37, 10, 'Criaria um portal para os estudantes', '{\"desenvolvimento-web\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(38, 10, 'Deixaria os sistemas confiaveis e disponiveis', '{\"infra-cloud\":3,\"ciberseguranca\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(39, 10, 'Usaria dados para planejar melhorias', '{\"dados-ia\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(40, 10, 'Criaria uma experiencia divertida de aprendizagem', '{\"jogos-digitais\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(41, 11, 'Um programa criado por mim funcionando', '{\"desenvolvimento-web\":3,\"jogos-digitais\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(42, 11, 'Um risco digital que ajudei a impedir', '{\"ciberseguranca\":3,\"infra-cloud\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(43, 11, 'Uma conclusao interessante encontrada nos dados', '{\"dados-ia\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(44, 11, 'Pessoas achando um produto facil e divertido', '{\"design-ux\":3,\"jogos-digitais\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(45, 12, 'Criaria paginas e experimentaria codigo', '{\"desenvolvimento-web\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(46, 12, 'Montaria e entenderia redes e computadores', '{\"infra-cloud\":3,\"ciberseguranca\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 2, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(47, 12, 'Inventaria um mundo jogavel e suas regras', '{\"jogos-digitais\":3,\"design-ux\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 3, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(48, 12, 'Testaria hipoteses com uma planilha de dados', '{\"dados-ia\":3,\"ciberseguranca\":1}', 'Boa escolha! Explore mais de uma área de tecnologia.', 4, '2026-11-12 04:12:21', '2026-11-12 04:12:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `career_attempts`
--

CREATE TABLE `career_attempts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('in_progress','completed') NOT NULL DEFAULT 'in_progress',
  `result_career_id` bigint(20) UNSIGNED DEFAULT NULL,
  `scores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`scores`)),
  `question_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`question_ids`)),
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `career_attempts`
--

INSERT INTO `career_attempts` (`id`, `user_id`, `status`, `result_career_id`, `scores`, `question_ids`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'completed', 3, '{\"dados-ia\":15,\"design-ux\":10,\"ciberseguranca\":7,\"desenvolvimento-web\":2,\"jogos-digitais\":9,\"infra-cloud\":5}', '[1,2,3,4,5,6,7,8,9,10,11,12]', '2026-11-12 03:15:21', '2026-11-12 02:41:43', '2026-11-12 03:15:21'),
(2, 8, 'completed', 1, '{\"desenvolvimento-web\":34,\"design-ux\":5,\"ciberseguranca\":3,\"infra-cloud\":3,\"jogos-digitais\":2,\"dados-ia\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-01 12:00:00', '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(3, 9, 'completed', 2, '{\"ciberseguranca\":26,\"infra-cloud\":14,\"desenvolvimento-web\":1,\"dados-ia\":7}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-02 12:01:00', '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(4, 10, 'completed', 3, '{\"dados-ia\":36,\"design-ux\":4,\"infra-cloud\":4,\"ciberseguranca\":3,\"jogos-digitais\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-03 12:02:00', '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(5, 11, 'completed', 4, '{\"desenvolvimento-web\":14,\"design-ux\":24,\"jogos-digitais\":6,\"dados-ia\":4}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-04 12:03:00', '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(6, 12, 'completed', 5, '{\"jogos-digitais\":27,\"desenvolvimento-web\":3,\"design-ux\":17,\"ciberseguranca\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-05 12:04:00', '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(7, 13, 'completed', 6, '{\"ciberseguranca\":16,\"infra-cloud\":19,\"dados-ia\":3,\"desenvolvimento-web\":6,\"jogos-digitais\":3,\"design-ux\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-06 12:05:00', '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(8, 14, 'completed', 1, '{\"desenvolvimento-web\":34,\"design-ux\":8,\"infra-cloud\":3,\"jogos-digitais\":2,\"dados-ia\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-07 12:06:00', '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(9, 15, 'completed', 2, '{\"ciberseguranca\":26,\"infra-cloud\":14,\"desenvolvimento-web\":1,\"dados-ia\":7}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-08 12:07:00', '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(10, 16, 'completed', 3, '{\"dados-ia\":36,\"design-ux\":4,\"infra-cloud\":4,\"ciberseguranca\":3,\"jogos-digitais\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-01 12:08:00', '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(11, 17, 'completed', 4, '{\"desenvolvimento-web\":14,\"design-ux\":24,\"jogos-digitais\":9,\"dados-ia\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-02 12:09:00', '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(12, 18, 'completed', 5, '{\"jogos-digitais\":27,\"desenvolvimento-web\":2,\"design-ux\":15,\"ciberseguranca\":1,\"dados-ia\":3}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-03 12:10:00', '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(13, 19, 'completed', 6, '{\"ciberseguranca\":16,\"infra-cloud\":19,\"dados-ia\":3,\"desenvolvimento-web\":6,\"jogos-digitais\":3,\"design-ux\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', '2026-11-04 12:11:00', '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(14, 20, 'in_progress', NULL, '{\"desenvolvimento-web\":4,\"design-ux\":4}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', NULL, '2026-11-05 12:12:00', '2026-11-05 12:12:00'),
(15, 21, 'in_progress', NULL, '{\"ciberseguranca\":7,\"infra-cloud\":4,\"desenvolvimento-web\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', NULL, '2026-11-06 12:13:00', '2026-11-06 12:13:00'),
(16, 22, 'in_progress', NULL, '{\"dados-ia\":15,\"design-ux\":2,\"infra-cloud\":2,\"ciberseguranca\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', NULL, '2026-11-07 12:14:00', '2026-11-07 12:14:00'),
(17, 23, 'in_progress', NULL, '{\"desenvolvimento-web\":3,\"design-ux\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', NULL, '2026-11-08 12:15:00', '2026-11-08 12:15:00'),
(18, 24, 'in_progress', NULL, '{\"jogos-digitais\":10,\"desenvolvimento-web\":1,\"design-ux\":4,\"ciberseguranca\":1}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', NULL, '2026-11-01 12:16:00', '2026-11-01 12:16:00'),
(19, 25, 'in_progress', NULL, '{\"ciberseguranca\":8,\"infra-cloud\":10,\"dados-ia\":3,\"desenvolvimento-web\":3}', '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]', NULL, '2026-11-02 12:17:00', '2026-11-02 12:17:00'),
(20, 1, 'in_progress', NULL, '[]', '[1,2,3,4,5,6,7,8,9,10,11,12]', NULL, '2026-11-12 03:18:15', '2026-11-12 03:18:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `career_profiles`
--

CREATE TABLE `career_profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(100) NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(40) NOT NULL DEFAULT 'code',
  `accent` varchar(7) NOT NULL DEFAULT '#51BA42',
  `skills` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`skills`)),
  `starter_projects` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`starter_projects`)),
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `career_profiles`
--

INSERT INTO `career_profiles` (`id`, `slug`, `name`, `description`, `icon`, `accent`, `skills`, `starter_projects`, `active`, `created_at`, `updated_at`) VALUES
(1, 'desenvolvimento-web', 'Desenvolvimento Web', 'Crie sites e aplicativos que ajudam pessoas a resolver problemas cotidianos.', 'code-2', '#51BA42', '[\"HTML\",\"CSS\",\"JavaScript\",\"acessibilidade\"]', '[\"Pagina de uma feira de ciencias\",\"Site de acolhimento de alunos novos\"]', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(2, 'ciberseguranca', 'Seguranca Digital', 'Proteja informacoes, reconheca riscos e aprenda a tornar a internet mais segura.', 'shield-check', '#6EC8EE', '[\"senhas fortes\",\"privacidade\",\"redes\",\"etica digital\"]', '[\"Campanha contra golpes online\",\"Checklist de seguranca do laboratorio\"]', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(3, 'dados-ia', 'Dados e Inteligencia Artificial', 'Transforme perguntas em analises, graficos e descobertas responsaveis.', 'chart-no-axes-combined', '#AE9CFF', '[\"planilhas\",\"pensamento critico\",\"graficos\",\"IA responsavel\"]', '[\"Mapa de habitos de estudo\",\"Pesquisa sobre mobilidade escolar\"]', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(4, 'design-ux', 'Design UX/UI', 'Planeje experiencias digitais simples, inclusivas e agradaveis de usar.', 'palette', '#FFB973', '[\"empatia\",\"prototipacao\",\"pesquisa\",\"design acessivel\"]', '[\"Protótipo de aplicativo escolar\",\"Redesenho de cartaz de evento\"]', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(5, 'jogos-digitais', 'Desenvolvimento de Jogos', 'Misture narrativa, programacao e criatividade para construir mundos interativos.', 'gamepad-2', '#F48CAF', '[\"logica\",\"mecanicas\",\"arte 2D\",\"testes\"]', '[\"Minijogo sobre reciclagem\",\"Jogo de perguntas da biblioteca\"]', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(6, 'infra-cloud', 'Infraestrutura e Nuvem', 'Faca os sistemas funcionarem: redes, servicos, servidores e trabalho em equipe.', 'cloud', '#58D1C8', '[\"redes\",\"servidores\",\"monitoramento\",\"organizacao\"]', '[\"Mapa da rede da escola\",\"Plano de backup para projeto escolar\"]', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `career_questions`
--

CREATE TABLE `career_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(180) NOT NULL,
  `scenario` text NOT NULL,
  `category` varchar(80) NOT NULL DEFAULT 'desafio',
  `position` smallint(5) UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `career_questions`
--

INSERT INTO `career_questions` (`id`, `title`, `scenario`, `category`, `position`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Uma novidade chega na escola', 'A escola recebeu um laboratorio novo. Qual seria sua primeira contribuicao?', 'exploracao', 1, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(2, 'O misterio do recreio', 'Muitos alunos reclamam da fila da cantina. Voce...', 'desafio', 2, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(3, 'Missao: internet caiu!', 'Durante uma apresentacao, a conexao para de funcionar. Voce...', 'desafio', 3, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(4, 'Cuidado com um link estranho', 'Um colega recebeu uma mensagem suspeita. Como voce ajuda?', 'exploracao', 4, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(5, 'Uma ideia para a feira', 'Seu grupo precisa apresentar um tema de ciencias. O que anima voce?', 'desafio', 5, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(6, 'O desafio do aplicativo', 'Um app escolar recebe queixas de que e dificil usar. Voce...', 'desafio', 6, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(7, 'Trabalho em equipe', 'Em um projeto de tecnologia, qual papel combina com voce?', 'exploracao', 7, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(8, 'Um jogo educativo', 'A escola quer um jogo sobre sustentabilidade. Voce se empolga com...', 'desafio', 8, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(9, 'Uma pesquisa surpreendente', 'Uma pesquisa na escola aponta resultados inesperados. Voce...', 'desafio', 9, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(10, 'A escola do futuro', 'Se pudesse melhorar um ponto da sua escola com tecnologia...', 'exploracao', 10, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(11, 'Uma grande descoberta', 'Qual tipo de resultado mais faria voce comemorar?', 'desafio', 11, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(12, 'Escolha sua proxima missao', 'Com mais uma tarde livre para explorar tecnologia, voce...', 'desafio', 12, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `career_responses`
--

CREATE TABLE `career_responses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `career_attempt_id` bigint(20) UNSIGNED NOT NULL,
  `career_question_id` bigint(20) UNSIGNED NOT NULL,
  `career_answer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `career_responses`
--

INSERT INTO `career_responses` (`id`, `career_attempt_id`, `career_question_id`, `career_answer_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(2, 2, 2, 8, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(3, 2, 3, 10, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(4, 2, 4, 14, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(5, 2, 5, 17, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(6, 2, 6, 22, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(7, 2, 7, 25, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(8, 2, 8, 30, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(9, 2, 9, 35, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(10, 2, 10, 37, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(11, 2, 11, 41, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(12, 2, 12, 45, '2026-11-01 12:00:00', '2026-11-01 12:00:00'),
(13, 3, 1, 2, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(14, 3, 2, 8, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(15, 3, 3, 9, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(16, 3, 4, 13, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(17, 3, 5, 20, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(18, 3, 6, 24, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(19, 3, 7, 26, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(20, 3, 8, 32, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(21, 3, 9, 33, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(22, 3, 10, 38, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(23, 3, 11, 42, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(24, 3, 12, 48, '2026-11-02 12:01:00', '2026-11-02 12:01:00'),
(25, 4, 1, 3, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(26, 4, 2, 6, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(27, 4, 3, 12, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(28, 4, 4, 16, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(29, 4, 5, 19, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(30, 4, 6, 23, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(31, 4, 7, 28, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(32, 4, 8, 31, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(33, 4, 9, 33, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(34, 4, 10, 39, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(35, 4, 11, 43, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(36, 4, 12, 48, '2026-11-03 12:02:00', '2026-11-03 12:02:00'),
(37, 5, 1, 1, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(38, 5, 2, 5, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(39, 5, 3, 11, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(40, 5, 4, 14, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(41, 5, 5, 19, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(42, 5, 6, 21, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(43, 5, 7, 27, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(44, 5, 8, 29, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(45, 5, 9, 34, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(46, 5, 10, 37, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(47, 5, 11, 44, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(48, 5, 12, 45, '2026-11-04 12:03:00', '2026-11-04 12:03:00'),
(49, 6, 1, 4, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(50, 6, 2, 7, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(51, 6, 3, 11, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(52, 6, 4, 15, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(53, 6, 5, 18, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(54, 6, 6, 21, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(55, 6, 7, 27, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(56, 6, 8, 29, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(57, 6, 9, 36, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(58, 6, 10, 40, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(59, 6, 11, 44, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(60, 6, 12, 47, '2026-11-05 12:04:00', '2026-11-05 12:04:00'),
(61, 7, 1, 2, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(62, 7, 2, 6, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(63, 7, 3, 9, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(64, 7, 4, 13, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(65, 7, 5, 20, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(66, 7, 6, 22, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(67, 7, 7, 25, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(68, 7, 8, 32, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(69, 7, 9, 36, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(70, 7, 10, 38, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(71, 7, 11, 42, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(72, 7, 12, 46, '2026-11-06 12:05:00', '2026-11-06 12:05:00'),
(73, 8, 1, 1, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(74, 8, 2, 5, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(75, 8, 3, 10, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(76, 8, 4, 14, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(77, 8, 5, 17, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(78, 8, 6, 22, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(79, 8, 7, 25, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(80, 8, 8, 30, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(81, 8, 9, 35, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(82, 8, 10, 37, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(83, 8, 11, 41, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(84, 8, 12, 45, '2026-11-07 12:06:00', '2026-11-07 12:06:00'),
(85, 9, 1, 2, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(86, 9, 2, 8, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(87, 9, 3, 9, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(88, 9, 4, 13, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(89, 9, 5, 20, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(90, 9, 6, 24, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(91, 9, 7, 26, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(92, 9, 8, 32, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(93, 9, 9, 33, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(94, 9, 10, 38, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(95, 9, 11, 42, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(96, 9, 12, 48, '2026-11-08 12:07:00', '2026-11-08 12:07:00'),
(97, 10, 1, 3, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(98, 10, 2, 6, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(99, 10, 3, 12, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(100, 10, 4, 16, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(101, 10, 5, 19, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(102, 10, 6, 23, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(103, 10, 7, 28, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(104, 10, 8, 31, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(105, 10, 9, 33, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(106, 10, 10, 39, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(107, 10, 11, 43, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(108, 10, 12, 48, '2026-11-01 12:08:00', '2026-11-01 12:08:00'),
(109, 11, 1, 1, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(110, 11, 2, 5, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(111, 11, 3, 11, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(112, 11, 4, 14, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(113, 11, 5, 17, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(114, 11, 6, 21, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(115, 11, 7, 27, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(116, 11, 8, 29, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(117, 11, 9, 34, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(118, 11, 10, 40, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(119, 11, 11, 44, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(120, 11, 12, 45, '2026-11-02 12:09:00', '2026-11-02 12:09:00'),
(121, 12, 1, 4, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(122, 12, 2, 7, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(123, 12, 3, 11, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(124, 12, 4, 15, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(125, 12, 5, 18, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(126, 12, 6, 23, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(127, 12, 7, 27, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(128, 12, 8, 29, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(129, 12, 9, 36, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(130, 12, 10, 40, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(131, 12, 11, 44, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(132, 12, 12, 47, '2026-11-03 12:10:00', '2026-11-03 12:10:00'),
(133, 13, 1, 2, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(134, 13, 2, 6, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(135, 13, 3, 9, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(136, 13, 4, 13, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(137, 13, 5, 20, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(138, 13, 6, 22, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(139, 13, 7, 25, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(140, 13, 8, 32, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(141, 13, 9, 36, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(142, 13, 10, 38, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(143, 13, 11, 42, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(144, 13, 12, 46, '2026-11-04 12:11:00', '2026-11-04 12:11:00'),
(145, 14, 1, 1, '2026-11-05 12:12:00', '2026-11-05 12:12:00'),
(146, 14, 2, 5, '2026-11-05 12:12:00', '2026-11-05 12:12:00'),
(147, 15, 1, 2, '2026-11-06 12:13:00', '2026-11-06 12:13:00'),
(148, 15, 2, 8, '2026-11-06 12:13:00', '2026-11-06 12:13:00'),
(149, 15, 3, 9, '2026-11-06 12:13:00', '2026-11-06 12:13:00'),
(150, 16, 1, 3, '2026-11-07 12:14:00', '2026-11-07 12:14:00'),
(151, 16, 2, 6, '2026-11-07 12:14:00', '2026-11-07 12:14:00'),
(152, 16, 3, 12, '2026-11-07 12:14:00', '2026-11-07 12:14:00'),
(153, 16, 4, 16, '2026-11-07 12:14:00', '2026-11-07 12:14:00'),
(154, 16, 5, 19, '2026-11-07 12:14:00', '2026-11-07 12:14:00'),
(155, 17, 1, 1, '2026-11-08 12:15:00', '2026-11-08 12:15:00'),
(156, 18, 1, 4, '2026-11-01 12:16:00', '2026-11-01 12:16:00'),
(157, 18, 2, 7, '2026-11-01 12:16:00', '2026-11-01 12:16:00'),
(158, 18, 3, 11, '2026-11-01 12:16:00', '2026-11-01 12:16:00'),
(159, 18, 4, 15, '2026-11-01 12:16:00', '2026-11-01 12:16:00'),
(160, 19, 1, 2, '2026-11-02 12:17:00', '2026-11-02 12:17:00'),
(161, 19, 2, 6, '2026-11-02 12:17:00', '2026-11-02 12:17:00'),
(162, 19, 3, 9, '2026-11-02 12:17:00', '2026-11-02 12:17:00'),
(163, 19, 4, 13, '2026-11-02 12:17:00', '2026-11-02 12:17:00'),
(164, 19, 5, 20, '2026-11-02 12:17:00', '2026-11-02 12:17:00'),
(165, 19, 6, 22, '2026-11-02 12:17:00', '2026-11-02 12:17:00'),
(166, 1, 1, 3, '2026-11-12 03:13:03', '2026-11-12 03:13:03'),
(167, 1, 2, 8, '2026-11-12 03:13:32', '2026-11-12 03:13:32'),
(168, 1, 3, 11, '2026-11-12 03:14:20', '2026-11-12 03:14:20'),
(169, 1, 4, 13, '2026-11-12 03:14:38', '2026-11-12 03:14:38'),
(170, 1, 5, 18, '2026-11-12 03:14:45', '2026-11-12 03:14:45'),
(171, 1, 6, 23, '2026-11-12 03:14:49', '2026-11-12 03:14:49'),
(172, 1, 7, 27, '2026-11-12 03:14:54', '2026-11-12 03:14:54'),
(173, 1, 8, 31, '2026-11-12 03:15:00', '2026-11-12 03:15:00'),
(174, 1, 9, 36, '2026-11-12 03:15:04', '2026-11-12 03:15:04'),
(175, 1, 10, 39, '2026-11-12 03:15:08', '2026-11-12 03:15:08'),
(176, 1, 11, 43, '2026-11-12 03:15:13', '2026-11-12 03:15:13'),
(177, 1, 12, 46, '2026-11-12 03:15:21', '2026-11-12 03:15:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `verification_code` varchar(40) NOT NULL,
  `issued_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `certificates`
--

INSERT INTO `certificates` (`id`, `user_id`, `enrollment_id`, `verification_code`, `issued_at`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 'RT-DEMO26-001', '2026-11-02 13:20:00', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(2, 9, 2, 'RT-DEMO26-002', '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(3, 10, 3, 'RT-DEMO26-003', '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(4, 11, 4, 'RT-DEMO26-004', '2026-11-05 13:20:00', '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(5, 12, 5, 'RT-DEMO26-005', '2026-11-06 13:20:00', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(6, 13, 6, 'RT-DEMO26-006', '2026-11-07 13:20:00', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(7, 1, 25, 'RT-JOM2BDKJO1U2', '2026-11-12 03:16:56', '2026-11-12 03:16:56', '2026-11-12 03:16:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `classrooms`
--

CREATE TABLE `classrooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `school_year` varchar(9) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `classrooms`
--

INSERT INTO `classrooms` (`id`, `school_id`, `name`, `school_year`, `created_at`, `updated_at`) VALUES
(1, 1122, '1º Ano A', '2026', '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(2, 1122, '2º Ano A', '2026', '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(3, 1123, '1º Ano B', '2026', '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(4, 1123, '3º Ano A', '2026', '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(5, 1124, '2º Ano B', '2026', '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(6, 1124, '3º Ano B', '2026', '2026-11-12 04:12:21', '2026-11-12 04:12:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enrollments`
--

CREATE TABLE `enrollments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `learning_path_id` bigint(20) UNSIGNED NOT NULL,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `enrollments`
--

INSERT INTO `enrollments` (`id`, `user_id`, `learning_path_id`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 8, 1, '2026-11-02 13:20:00', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(2, 9, 2, '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(3, 10, 3, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(4, 11, 4, '2026-11-05 13:20:00', '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(5, 12, 5, '2026-11-06 13:20:00', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(6, 13, 6, '2026-11-07 13:20:00', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(7, 14, 1, NULL, '2026-11-08 13:20:00', '2026-11-08 13:20:00'),
(8, 15, 2, NULL, '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(9, 16, 3, NULL, '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(10, 17, 4, NULL, '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(11, 18, 5, NULL, '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(12, 19, 6, NULL, '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(13, 20, 1, NULL, '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(14, 21, 2, NULL, '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(15, 22, 3, NULL, '2026-11-08 13:20:00', '2026-11-08 13:20:00'),
(16, 23, 4, NULL, '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(17, 24, 5, NULL, '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(18, 25, 6, NULL, '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(19, 26, 1, NULL, '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(20, 27, 2, NULL, '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(21, 28, 3, NULL, '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(22, 29, 4, NULL, '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(23, 30, 5, NULL, '2026-11-08 13:20:00', '2026-11-08 13:20:00'),
(24, 31, 6, NULL, '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(25, 1, 3, '2026-11-12 03:16:56', '2026-11-12 03:15:51', '2026-11-12 03:16:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `feedback`
--

CREATE TABLE `feedback` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `learning_path_id` bigint(20) UNSIGNED NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `comment` varchar(400) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `learning_path_id`, `rating`, `comment`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 5, 'Gostei da forma como o projeto mistura prática e criatividade.', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(2, 9, 2, 5, 'As fases ajudaram a descobrir novas habilidades em tecnologia.', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(3, 10, 3, 5, 'O exercício final foi muito útil para pensar em um projeto escolar.', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(4, 11, 4, 5, 'Consegui entender como essa área pode contribuir com a escola.', '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(5, 12, 5, 5, 'Os desafios são acessíveis e interessantes para o ensino médio.', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(6, 13, 6, 5, 'Gostei da forma como o projeto mistura prática e criatividade.', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(7, 14, 1, 4, 'As fases ajudaram a descobrir novas habilidades em tecnologia.', '2026-11-08 13:20:00', '2026-11-08 13:20:00'),
(8, 15, 2, 4, 'O exercício final foi muito útil para pensar em um projeto escolar.', '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(9, 16, 3, 4, 'Consegui entender como essa área pode contribuir com a escola.', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(10, 17, 4, 4, 'Os desafios são acessíveis e interessantes para o ensino médio.', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(11, 18, 5, 4, 'Gostei da forma como o projeto mistura prática e criatividade.', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(12, 19, 6, 4, 'As fases ajudaram a descobrir novas habilidades em tecnologia.', '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(13, 20, 1, 4, 'O exercício final foi muito útil para pensar em um projeto escolar.', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(14, 21, 2, 4, 'Consegui entender como essa área pode contribuir com a escola.', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(15, 22, 3, 4, 'Os desafios são acessíveis e interessantes para o ensino médio.', '2026-11-08 13:20:00', '2026-11-08 13:20:00'),
(16, 23, 4, 4, 'Gostei da forma como o projeto mistura prática e criatividade.', '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(17, 24, 5, 4, 'As fases ajudaram a descobrir novas habilidades em tecnologia.', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(18, 25, 6, 4, 'O exercício final foi muito útil para pensar em um projeto escolar.', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(19, 1, 3, 5, 'asdasdasd', '2026-11-12 03:17:03', '2026-11-12 03:17:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `learning_paths`
--

CREATE TABLE `learning_paths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `career_profile_id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED DEFAULT NULL,
  `slug` varchar(140) NOT NULL,
  `title` varchar(160) NOT NULL,
  `description` text NOT NULL,
  `estimated_minutes` smallint(5) UNSIGNED NOT NULL DEFAULT 90,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `learning_paths`
--

INSERT INTO `learning_paths` (`id`, `career_profile_id`, `school_id`, `slug`, `title`, `description`, `estimated_minutes`, `published`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'trilha-desenvolvimento-web', 'Jornada de Desenvolvimento Web', 'Seis missões práticas e um projeto aplicado para explorar Desenvolvimento Web.', 90, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(2, 2, NULL, 'trilha-ciberseguranca', 'Jornada de Seguranca Digital', 'Seis missões práticas e um projeto aplicado para explorar Seguranca Digital.', 90, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(3, 3, NULL, 'trilha-dados-ia', 'Jornada de Dados e Inteligencia Artificial', 'Seis missões práticas e um projeto aplicado para explorar Dados e Inteligencia Artificial.', 90, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(4, 4, NULL, 'trilha-design-ux', 'Jornada de Design UX/UI', 'Seis missões práticas e um projeto aplicado para explorar Design UX/UI.', 90, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(5, 5, NULL, 'trilha-jogos-digitais', 'Jornada de Desenvolvimento de Jogos', 'Seis missões práticas e um projeto aplicado para explorar Desenvolvimento de Jogos.', 90, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(6, 6, NULL, 'trilha-infra-cloud', 'Jornada de Infraestrutura e Nuvem', 'Seis missões práticas e um projeto aplicado para explorar Infraestrutura e Nuvem.', 90, 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(190) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('aluno01@demo.rotateste.local', '3b3035d8d2586dd95d80c845257cb982fcdbde9c92f51f17dfab1079576df67c', '2025-01-01 15:00:00'),
('aluno02@demo.rotateste.local', 'f7e35469eaebb8eb7ad5e8c0236d794770f37f30347e3684e80cb2c5a7e14330', '2025-01-01 15:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `path_stages`
--

CREATE TABLE `path_stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `learning_path_id` bigint(20) UNSIGNED NOT NULL,
  `position` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `lesson` longtext NOT NULL,
  `mission_type` enum('choice','reflection') NOT NULL DEFAULT 'choice',
  `mission_prompt` text NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`options`)),
  `correct_option` tinyint(3) UNSIGNED DEFAULT NULL,
  `xp_reward` smallint(5) UNSIGNED NOT NULL DEFAULT 60,
  `estimated_minutes` smallint(5) UNSIGNED NOT NULL DEFAULT 15,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `path_stages`
--

INSERT INTO `path_stages` (`id`, `learning_path_id`, `position`, `title`, `description`, `lesson`, `mission_type`, `mission_prompt`, `options`, `correct_option`, `xp_reward`, `estimated_minutes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Como a web funciona', 'Uma pagina e formada por conteudo, estilo e comportamento.', 'HTML organiza o conteudo, CSS cuida do visual e JavaScript cria interacao. O navegador interpreta esses arquivos e mostra a pagina. Uma boa web tambem precisa funcionar em celular e com tecnologias assistivas.', 'choice', 'Qual linguagem estrutura os titulos e paragrafos de uma pagina?', '[\"HTML\",\"SQL\",\"Python\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(2, 1, 2, 'Uma pagina para todos', 'Inclusao digital começa no planejamento.', 'Textos legiveis, contraste adequado, navegacao por teclado e descricoes de imagens ajudam mais pessoas a acessar conteudos. Acessibilidade nao e um recurso opcional: faz parte da qualidade.', 'choice', 'Qual atitude melhora a acessibilidade?', '[\"Usar apenas cores para explicar\",\"Adicionar textos alternativos nas imagens\",\"Desativar teclado\"]', 1, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(3, 1, 3, 'CSS com proposito', 'Estilo comunica e orienta.', 'Com CSS voce cria cores, espacos, grades e adaptacoes para telas pequenas. Consistencia e espaco em branco ajudam o visitante a entender o que e importante.', 'choice', 'Qual recurso organiza elementos em colunas responsivas?', '[\"CSS Grid\",\"Tamanho fixo em todas as telas\",\"Senha do banco\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(4, 1, 4, 'Interacao consciente', 'Botões devem responder a acoes reais.', 'JavaScript recebe eventos, altera o conteudo e valida informacoes na interface. Regras importantes devem ser confirmadas tambem no servidor, porque o navegador pode ser alterado.', 'choice', 'Onde uma regra sensivel deve ser confirmada?', '[\"So no navegador\",\"Somente na cor do botao\",\"No servidor\"]', 2, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(5, 1, 5, 'Sua primeira ideia', 'Planeje um site util para sua escola.', 'Pense num problema simples, defina quem usara o site e quais tres telas seriam mais importantes. Inclua uma forma de tornar o projeto acessivel e respeitar a privacidade.', 'reflection', 'Descreva o site, quem utilizaria e quais seriam suas tres telas principais.', NULL, NULL, 100, 25, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(6, 1, 6, 'Lançamento e etica', 'Projetos digitais precisam ser testados.', 'Antes de compartilhar um site, teste links, leitura no celular, dados que solicita e acessibilidade. Nao publique nomes e fotos de colegas sem permissao.', 'choice', 'O que e importante antes de publicar?', '[\"Testar acessibilidade e proteger dados\",\"Solicitar CPF de todos\",\"Publicar sem revisar\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(7, 2, 1, 'O que protegemos', 'Dados pessoais merecem cuidado.', 'Seguranca digital procura preservar confidencialidade, integridade e disponibilidade. Isso significa impedir acessos indevidos, alteracoes nao autorizadas e interrupcoes.', 'choice', 'Qual principio busca manter sistemas acessiveis quando necessarios?', '[\"Disponibilidade\",\"Animacao\",\"Popularidade\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(8, 2, 2, 'Golpes e phishing', 'Desconfie de urgencias artificiais.', 'Golpes usam links, promessas e ameacas para obter dados. Verifique o dominio, converse com um responsavel e nunca compartilhe codigos de autenticacao.', 'choice', 'Ao receber link suspeito, o melhor e...', '[\"Informar a senha\",\"Conferir origem sem abrir o link\",\"Encaminhar a todos\"]', 1, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(9, 2, 3, 'Senhas e autenticação', 'Uma barreira nao basta.', 'Use senhas longas e diferentes, gerenciador de senhas quando possivel e verificacao em duas etapas. Nao anote senhas em locais publicos.', 'choice', 'Qual pratica protege melhor a conta?', '[\"Mesma senha em tudo\",\"Senha curta com nome\",\"Senha unica e segundo fator\"]', 2, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(10, 2, 4, 'Teste etico', 'Permissao vem antes da curiosidade.', 'Seguranca e investigacao com autorizacao. Nunca tente invadir redes, contas ou sistemas da escola. Treine em simuladores autorizados e ambientes de laboratorio.', 'choice', 'Quando testar a seguranca de um sistema?', '[\"Somente com autorizacao\",\"Quando estiver curioso\",\"Sem avisar ninguem\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(11, 2, 5, 'Campanha de prevencao', 'Ajude colegas a se protegerem.', 'Crie uma proposta de cartaz ou video ensinando a identificar golpes. Foque em mensagens simples e inclusivas, sem assustar as pessoas.', 'reflection', 'Escreva tres dicas praticas de uma campanha de prevencao a golpes.', NULL, NULL, 100, 25, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(12, 2, 6, 'Privacidade e resposta', 'Se algo acontecer, peça ajuda.', 'Registre o ocorrido de modo responsavel, avise pessoas competentes e altere credenciais comprometidas. Nao publique dados da vitima nem tente retaliar.', 'choice', 'Qual e a primeira atitude prudente diante de vazamento?', '[\"Divulgar o vazamento\",\"Buscar apoio e proteger a conta\",\"Apagar todas as provas\"]', 1, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(13, 3, 1, 'Perguntas antes de dados', 'Primeiro defina o que quer descobrir.', 'Analise de dados comeca com uma pergunta objetiva. As informacoes coletadas devem ser suficientes, relevantes e obtidas respeitando a privacidade.', 'choice', 'Qual e o primeiro passo de uma boa analise?', '[\"Fazer um grafico aleatorio\",\"Definir uma pergunta\",\"Coletar todos os dados possiveis\"]', 1, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(14, 3, 2, 'Dados limpos', 'Erros mudam conclusoes.', 'Dados duplicados, formatos diferentes e campos faltantes podem distorcer os resultados. Organizar a planilha ajuda a reduzir equívocos.', 'choice', 'Qual pratica ajuda a evitar contagem duplicada?', '[\"Revisar valores repetidos\",\"Esconder linhas\",\"Somar sem olhar\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(15, 3, 3, 'Grafico certo', 'Cada visual mostra uma historia.', 'Graficos de barras ajudam a comparar categorias; linhas mostram mudancas no tempo. O grafico deve ter titulos e escalas honestas.', 'choice', 'Para mostrar evolucao por mes, use preferencialmente...', '[\"Pizza com 40 fatias\",\"Grafico de linhas\",\"Imagem sem legenda\"]', 1, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(16, 3, 4, 'IA com criterio', 'Modelos podem errar.', 'Inteligencia artificial pode reconhecer padroes, mas tambem reproduzir vieses. Sempre confirme informacoes importantes com fontes confiaveis e evite compartilhar dados sensiveis.', 'choice', 'Qual atitude responsavel ao usar IA?', '[\"Confiar em toda resposta\",\"Inserir dados privados\",\"Conferir fontes e limites\"]', 2, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(17, 3, 5, 'Pesquisa da escola', 'Transforme curiosidade em um estudo.', 'Planeje uma pesquisa anonima sobre formas de estudar. Defina pergunta, modo de coletar respostas sem identificacao e que grafico usaria.', 'reflection', 'Descreva uma pesquisa anonima com pergunta, coleta e grafico escolhido.', NULL, NULL, 100, 25, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(18, 3, 6, 'Conclusoes transparentes', 'Diferencie correlacao de causa.', 'Dois fatos acontecerem juntos nao prova que um provocou o outro. Apresente incertezas, tamanho da amostra e limites dos dados.', 'choice', 'O que significa correlacao?', '[\"Uma relacao que nao prova causalidade\",\"Prova de causa\",\"Erro de digitacao\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(19, 4, 1, 'Design centrado nas pessoas', 'A experiencia começa em quem usa.', 'UX investiga necessidades, dificuldades e objetivos; UI cuida dos elementos com que interagimos. Um produto belo precisa ser facil e inclusivo.', 'choice', 'Qual e o ponto de partida de UX?', '[\"Ouvir as pessoas\",\"Escolher cores sem contexto\",\"Copiar qualquer site\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(20, 4, 2, 'Entrevistas simples', 'Pergunte antes de supor.', 'Entrevistas abertas ajudam a entender situacoes reais. Evite perguntas que empurrem o entrevistado para a resposta que voce prefere.', 'choice', 'Qual pergunta estimula relatos reais?', '[\"Voce ama este app, ne?\",\"O que foi dificil ao usar esse app?\",\"Confirma que o design esta perfeito?\"]', 1, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(21, 4, 3, 'Rascunhos rapidos', 'Ideias podem nascer no papel.', 'Wireframes sao desenhos simples de telas. Testar um rascunho cedo economiza tempo de desenvolvimento e deixa espaco para melhorias.', 'choice', 'O que e um wireframe?', '[\"Desenho estrutural de uma tela\",\"Banco de senhas\",\"Rede de computadores\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(22, 4, 4, 'Acessibilidade visual', 'Design bom inclui mais pessoas.', 'Cores com contraste suficiente, fontes legiveis e areas de toque adequadas ajudam estudantes com diferentes necessidades.', 'choice', 'Qual melhoria ajuda na leitura?', '[\"Texto minusculo\",\"Contraste adequado\",\"Mensagem somente em vermelho\"]', 1, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(23, 4, 5, 'Protótipo escolar', 'Desenhe antes de construir.', 'Imagine um aplicativo para localizar eventos da escola. Pense em tres telas, um estudante com pouca internet e no caminho mais curto ate a informacao.', 'reflection', 'Descreva tres telas e uma solucao para acesso com internet limitada.', NULL, NULL, 100, 25, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(24, 4, 6, 'Testes com usuarios', 'A primeira ideia pode melhorar.', 'Peca a colegas para tentar uma tarefa no prototipo. Observe sem dar respostas e anote onde a pessoa encontrou dificuldades.', 'choice', 'O que fazer num teste de usabilidade?', '[\"Observar dificuldades sem induzir\",\"Dizer onde clicar o tempo todo\",\"Ignorar comentarios\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(25, 5, 1, 'Mecânicas de jogo', 'Regras criam experiencias.', 'Todo jogo tem objetivo, regras e alguma forma de retorno. Antes de criar graficos elaborados, experimente se a acao principal e divertida.', 'choice', 'O que define uma mecanica?', '[\"Uma regra de interacao\",\"O nome do criador\",\"A marca do monitor\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(26, 5, 2, 'Desafios progressivos', 'Aprender deve ser possivel.', 'Boas fases introduzem uma habilidade, oferecem pratica e aumentam a complexidade gradualmente. Falhas devem ensinar, nao humilhar.', 'choice', 'Como organizar a dificuldade?', '[\"Impossivel desde o inicio\",\"Progressiva com feedback\",\"Sempre aleatoria\"]', 1, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(27, 5, 3, 'Personagens e narrativa', 'Um personagem precisa de motivo.', 'Uma historia simples conecta objetivo, obstaculo e recompensa. Criar personagens originais evita copiar obras de outras pessoas.', 'choice', 'Qual combinacao fortalece uma historia?', '[\"Objetivo, obstaculo e decisao\",\"Somente um menu\",\"Apenas sons altos\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(28, 5, 4, 'Logica e eventos', 'Ações geram consequencias.', 'Em muitos jogos, o programa verifica colisões, pontuação e mudanças de cena. Testes pequenos tornam mais facil encontrar falhas.', 'choice', 'Se um personagem encosta em uma moeda, o jogo pode...', '[\"Ignorar qualquer regra\",\"Executar evento de coleta\",\"Desligar o computador\"]', 1, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(29, 5, 5, 'Seu minijogo original', 'Idealize uma aventura educativa.', 'Defina o objetivo, como o jogador se move, um obstaculo, tres fases e a mensagem educativa que fica depois da partida.', 'reflection', 'Descreva objetivo, controles, obstaculo e tres fases do seu minijogo.', NULL, NULL, 100, 25, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(30, 5, 6, 'Teste e respeito', 'Jogadores merecem escolhas justas.', 'Evite mecanismos que exploram vulnerabilidades ou estimulam gastos. Teste legibilidade, orientacoes e retorno para quem esta comecando.', 'choice', 'Qual principio melhora um jogo educativo?', '[\"Feedback respeitoso e claro\",\"Punicao humilhante\",\"Regras ocultas\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(31, 6, 1, 'O caminho da internet', 'Computadores conversam em redes.', 'Um dispositivo usa redes para trocar informacoes com outros servicos. Roteadores, enderecos e conexoes permitem que paginas cheguem a voce.', 'choice', 'Qual equipamento liga redes e encaminha trafego?', '[\"Roteador\",\"Mouse pad\",\"Caixa de som\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(32, 6, 2, 'Servidor e cliente', 'Servicos respondem a pedidos.', 'Seu navegador pede uma pagina; um servidor recebe a requisicao e devolve uma resposta. Na nuvem, recursos podem ser provisionados conforme necessidade.', 'choice', 'Quem normalmente solicita uma pagina web?', '[\"O navegador do usuario\",\"A impressora desligada\",\"O cabo de energia\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(33, 6, 3, 'Disponibilidade', 'Servicos precisam estar funcionando.', 'Monitoramento mostra quando um sistema falha. Redundancia e planos de contingencia podem reduzir interrupcoes.', 'choice', 'O que ajuda a detectar problemas cedo?', '[\"Monitoramento\",\"Ignorar alertas\",\"Apagar registros\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(34, 6, 4, 'Backup responsavel', 'Uma copia pode salvar um projeto.', 'Backups precisam ser feitos regularmente, protegidos e testados. Guardar unica copia no mesmo aparelho nao protege contra defeitos.', 'choice', 'Qual pratica e mais segura?', '[\"Manter copia separada e testar restauracao\",\"Nunca fazer backup\",\"Copiar senha em publico\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(35, 6, 5, 'Uma escola conectada', 'Planeje um laboratorio disponivel.', 'Desenhe um plano para manter acesso a internet e arquivos de um projeto escolar mesmo quando ocorre uma falha. Inclua um responsavel e uma estrategia de backup.', 'reflection', 'Explique um plano simples de conectividade, monitoramento e backup.', NULL, NULL, 100, 25, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(36, 6, 6, 'Trabalho em equipe', 'Infraestrutura envolve colaboracao.', 'Registrar mudancas, pedir autorizacao e compartilhar aprendizados com a equipe reduz erros. Nunca altere redes da escola sem aval dos responsaveis.', 'choice', 'Ao precisar mudar a rede escolar, voce deve...', '[\"Solicitar autorizacao e documentar\",\"Alterar escondido\",\"Desligar sem avisar\"]', 0, 60, 10, '2026-11-12 04:12:21', '2026-11-12 04:12:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `schools`
--

CREATE TABLE `schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(160) NOT NULL,
  `code` varchar(20) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `schools`
--

INSERT INTO `schools` (`id`, `name`, `code`, `city`, `state`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Aconchego do Saber', 'RTMA25-00001', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(2, 'Alpha Kids Creche e Bercario Ltda', 'RTMA25-00002', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(3, 'Ama Associacao de Amigos do Autista no Amazonas', 'RTMA25-00003', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(4, 'Associacao Comunitaria de Educacao', 'RTMA25-00004', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(5, 'Associacao de Pais e Amigos dos Excepcionais', 'RTMA25-00005', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(6, 'Casa Verde Espaco Interativo', 'RTMA25-00006', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(7, 'Cbn Colegio Brigido Nogueira', 'RTMA25-00007', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(8, 'Ceac Centro de Ensino Adquirindo Conhecimento', 'RTMA25-00008', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(9, 'Cebach - Centro Educacional Batista da Chapada', 'RTMA25-00009', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(10, 'Ceima Centro Educacional Integrado de Manaus', 'RTMA25-00010', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(11, 'CEJA Prof Agenor Ferreira Lima', 'RTMA25-00011', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(12, 'CEJA Professor Paulo Freire', 'RTMA25-00012', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(13, 'CEJA Professora Jacira Caboclo', 'RTMA25-00013', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(14, 'Cekam - Centro Educacional Katia Mourao', 'RTMA25-00014', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(15, 'Cemeja Prof Samuel Benchimol', 'RTMA25-00015', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(16, 'Cent Mun de Escolarizacao do Adulto e da Pessoa Idosa - Cemeapi', 'RTMA25-00016', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(17, 'Centro de Atividades Danilo de Matos Areosa - SESC', 'RTMA25-00017', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(18, 'Centro de Educ Prof Pe Stelio Daliso - Cetam', 'RTMA25-00018', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(19, 'Centro de Educacao Anchieta', 'RTMA25-00019', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(20, 'Centro de Educacao Infantil Elenilda Santos', 'RTMA25-00020', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(21, 'Centro de Educacao Infantil Joao e Maria', 'RTMA25-00021', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(22, 'Centro de Educacao Integrada Saint Exupery', 'RTMA25-00022', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(23, 'Centro de Educacao Integral Christ Master', 'RTMA25-00023', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(24, 'Centro de Educacao Meu Caminho', 'RTMA25-00024', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(25, 'Centro de Educacao Meu Caminho Baby', 'RTMA25-00025', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(26, 'Centro de Educacao Paraiso Infantil', 'RTMA25-00026', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(27, 'Centro de Educacao Profissional e Tecnologica Unidade Galileia-Cetam', 'RTMA25-00027', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(28, 'Centro de Educacao Profissional Ltda - Centro de Ensino Literatus', 'RTMA25-00028', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(29, 'Centro de Educacao Recanto do Saber', 'RTMA25-00029', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(30, 'Centro de Educacao SESC Jose Roberto Tadros', 'RTMA25-00030', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(31, 'Centro de Ensino Abc da Crianca', 'RTMA25-00031', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(32, 'Centro de Ensino Alberto Conceicao', 'RTMA25-00032', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(33, 'Centro de Ensino Alonso Souza', 'RTMA25-00033', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(34, 'Centro de Ensino Alpha Delta', 'RTMA25-00034', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(35, 'Centro de Ensino Dinamarco', 'RTMA25-00035', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(36, 'Centro de Ensino Diva Fernandes', 'RTMA25-00036', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(37, 'Centro de Ensino e Treinamento Bg Ltda', 'RTMA25-00037', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(38, 'Centro de Ensino Espaco da Crianca', 'RTMA25-00038', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(39, 'Centro de Ensino Especial Helena Antipoff', 'RTMA25-00039', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(40, 'Centro de Ensino Estrela da Manha', 'RTMA25-00040', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(41, 'Centro de Ensino Excelencia do Saber', 'RTMA25-00041', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(42, 'Centro de Ensino Giulia Monteiro', 'RTMA25-00042', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(43, 'Centro de Ensino Iemac', 'RTMA25-00043', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(44, 'Centro de Ensino Integrado Tsaleah', 'RTMA25-00044', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(45, 'Centro de Ensino Maria Brasil', 'RTMA25-00045', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(46, 'Centro de Ensino Nivea Roque', 'RTMA25-00046', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(47, 'Centro de Ensino Sementinha do Futuro', 'RTMA25-00047', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(48, 'Centro de Ensino Unisabermais Ltda', 'RTMA25-00048', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(49, 'Centro de Ensino Vinho Novo', 'RTMA25-00049', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(50, 'Centro de Estudos Renascer', 'RTMA25-00050', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(51, 'Centro de Formacao Profissional de Comunicacao - Cfpc', 'RTMA25-00051', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(52, 'Centro de Formacao Profissional Fernando Alfredo Pequeno Franco - SENAC', 'RTMA25-00052', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(53, 'Centro de Formacao Profissional Jose Tadros', 'RTMA25-00053', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(54, 'Centro de Informatica Manoel Catharino dos Santos Gomes', 'RTMA25-00054', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(55, 'Centro de Recreacao Infanto Juvenil', 'RTMA25-00055', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(56, 'Centro de Servicos Educionais Jerusalem do Amazonas Ltda', 'RTMA25-00056', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(57, 'Centro de Turismo e Hospitalidade', 'RTMA25-00057', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(58, 'Centro Educ 12 de Outubro', 'RTMA25-00058', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(59, 'Centro Educ Ateniense', 'RTMA25-00059', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(60, 'Centro Educ Guarany', 'RTMA25-00060', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(61, 'Centro Educ Mª Edna Cantuaria dos Reis', 'RTMA25-00061', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(62, 'Centro Educaciona Bebe Querido', 'RTMA25-00062', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(63, 'Centro Educacional Adalberto Valle', 'RTMA25-00063', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(64, 'Centro Educacional Adalberto Valle - Unidade I', 'RTMA25-00064', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(65, 'Centro Educacional Agape', 'RTMA25-00065', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(66, 'Centro Educacional Agnus Dei Ltda', 'RTMA25-00066', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(67, 'Centro Educacional Ajuricaba', 'RTMA25-00067', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(68, 'Centro Educacional Alegria de Aprender', 'RTMA25-00068', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(69, 'Centro Educacional Alegria do Saber', 'RTMA25-00069', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(70, 'Centro Educacional Amazonia', 'RTMA25-00070', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(71, 'Centro Educacional Amiguinhos', 'RTMA25-00071', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(72, 'Centro Educacional Amor Divino', 'RTMA25-00072', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(73, 'Centro Educacional Amoud', 'RTMA25-00073', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(74, 'Centro Educacional Ana Celia', 'RTMA25-00074', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(75, 'Centro Educacional Anabella Maciel', 'RTMA25-00075', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(76, 'Centro Educacional Anibal Beca Cetam', 'RTMA25-00076', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(77, 'Centro Educacional Aprendiz', 'RTMA25-00077', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(78, 'Centro Educacional Aprendiz - Unidade 2', 'RTMA25-00078', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(79, 'Centro Educacional Arco Iris', 'RTMA25-00079', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(80, 'Centro Educacional Arte do Abc', 'RTMA25-00080', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(81, 'Centro Educacional Arthur Virgilio Filho', 'RTMA25-00081', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(82, 'Centro Educacional Aruana', 'RTMA25-00082', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(83, 'Centro Educacional Ayton Mello', 'RTMA25-00083', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(84, 'Centro Educacional Balao Magico', 'RTMA25-00084', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(85, 'Centro Educacional Batista Canaa', 'RTMA25-00085', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(86, 'Centro Educacional Betania', 'RTMA25-00086', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(87, 'Centro Educacional Brilhante Criativo', 'RTMA25-00087', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(88, 'Centro Educacional Brincando de Aprender', 'RTMA25-00088', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(89, 'Centro Educacional Caminhando no Saber', 'RTMA25-00089', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(90, 'Centro Educacional Cantinho do Saber', 'RTMA25-00090', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(91, 'Centro Educacional Cantinho do Saber', 'RTMA25-00091', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(92, 'Centro Educacional Carmina Dessana', 'RTMA25-00092', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(93, 'Centro Educacional Carrossel Ltda', 'RTMA25-00093', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(94, 'Centro Educacional Casimiro de Abreu', 'RTMA25-00094', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(95, 'Centro Educacional Casinha Feliz', 'RTMA25-00095', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(96, 'Centro Educacional Colibri', 'RTMA25-00096', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(97, 'Centro Educacional Colombo Ladislau', 'RTMA25-00097', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(98, 'Centro Educacional Conquista Interativo', 'RTMA25-00098', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(99, 'Centro Educacional Construir', 'RTMA25-00099', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(100, 'Centro Educacional Cordeiro', 'RTMA25-00100', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(101, 'Centro Educacional Crescendo com Cristo', 'RTMA25-00101', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(102, 'Centro Educacional Crescer', 'RTMA25-00102', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(103, 'Centro Educacional Criar e Recriar', 'RTMA25-00103', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(104, 'Centro Educacional Criar Mais', 'RTMA25-00104', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(105, 'Centro Educacional D Rosa', 'RTMA25-00105', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(106, 'Centro Educacional Dengo de Crianca', 'RTMA25-00106', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(107, 'Centro Educacional Dirlene Nascimento', 'RTMA25-00107', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(108, 'Centro Educacional Doce Comeco Concept Integrado', 'RTMA25-00108', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(109, 'Centro Educacional Dom Quixote', 'RTMA25-00109', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(110, 'Centro Educacional Drihelly Barbosa', 'RTMA25-00110', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(111, 'Centro Educacional Drihelly Barbosa II', 'RTMA25-00111', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(112, 'Centro Educacional e Bercario Aquarela do Abc', 'RTMA25-00112', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(113, 'Centro Educacional Edith Brandao', 'RTMA25-00113', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(114, 'Centro Educacional Elite do Saber', 'RTMA25-00114', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(115, 'Centro Educacional Elohim', 'RTMA25-00115', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(116, 'Centro Educacional Emanuel', 'RTMA25-00116', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(117, 'Centro Educacional Escolar', 'RTMA25-00117', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(118, 'Centro Educacional Especializado Shirley Bessa', 'RTMA25-00118', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(119, 'Centro Educacional Estrela da Manha', 'RTMA25-00119', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(120, 'Centro Educacional Estrela do Amanha', 'RTMA25-00120', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(121, 'Centro Educacional Estrela Guia', 'RTMA25-00121', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(122, 'Centro Educacional Estrelas do Amanha', 'RTMA25-00122', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(123, 'Centro Educacional Excelente', 'RTMA25-00123', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(124, 'Centro Educacional Fabricio Sampaio', 'RTMA25-00124', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(125, 'Centro Educacional Formando Vidas', 'RTMA25-00125', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(126, 'Centro Educacional Fucapi Lynaldo Cavalcante de Albuquerque Ceef', 'RTMA25-00126', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(127, 'Centro Educacional Genesis', 'RTMA25-00127', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(128, 'Centro Educacional Genesis', 'RTMA25-00128', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(129, 'Centro Educacional Geracao Eleita do Amazonas', 'RTMA25-00129', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(130, 'Centro Educacional Geracao Inteligente', 'RTMA25-00130', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(131, 'Centro Educacional Graca Level', 'RTMA25-00131', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(132, 'Centro Educacional Heranca do Senhor', 'RTMA25-00132', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(133, 'Centro Educacional Igapo Eireli', 'RTMA25-00133', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(134, 'Centro Educacional Imperial', 'RTMA25-00134', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(135, 'Centro Educacional Imperial Baby', 'RTMA25-00135', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(136, 'Centro Educacional Infancia Dourada', 'RTMA25-00136', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(137, 'Centro Educacional Inocencia Lima', 'RTMA25-00137', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(138, 'Centro Educacional Inteligente', 'RTMA25-00138', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(139, 'Centro Educacional Jamilza Moreira', 'RTMA25-00139', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(140, 'Centro Educacional Jeova Jire', 'RTMA25-00140', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(141, 'Centro Educacional Kelle Almeida Maciel - Cekam', 'RTMA25-00141', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(142, 'Centro Educacional Kelven Kenedy', 'RTMA25-00142', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(143, 'Centro Educacional La Salle', 'RTMA25-00143', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(144, 'Centro Educacional Lato Sensu', 'RTMA25-00144', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(145, 'Centro Educacional Lato Sensu III', 'RTMA25-00145', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(146, 'Centro Educacional Louisiana', 'RTMA25-00146', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(147, 'Centro Educacional Lourdes Reis - Celur', 'RTMA25-00147', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(148, 'Centro Educacional Lucena Batista', 'RTMA25-00148', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(149, 'Centro Educacional Manoel Gomes', 'RTMA25-00149', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(150, 'Centro Educacional Mara Nilce', 'RTMA25-00150', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(151, 'Centro Educacional Maria Andrade', 'RTMA25-00151', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(152, 'Centro Educacional Maria Clara Araujo', 'RTMA25-00152', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(153, 'Centro Educacional Maria da Fe', 'RTMA25-00153', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(154, 'Centro Educacional Maria Helena', 'RTMA25-00154', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(155, 'Centro Educacional Marilia Araujo', 'RTMA25-00155', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(156, 'Centro Educacional Menino Jesus', 'RTMA25-00156', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(157, 'Centro Educacional Menino Jesus de Praga', 'RTMA25-00157', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(158, 'Centro Educacional Metamorfose', 'RTMA25-00158', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(159, 'Centro Educacional Meyre de Freitas', 'RTMA25-00159', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(160, 'Centro Educacional Millenium', 'RTMA25-00160', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(161, 'Centro Educacional Montessori', 'RTMA25-00161', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(162, 'Centro Educacional Mundo Azul', 'RTMA25-00162', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(163, 'Centro Educacional Mundo do Saber', 'RTMA25-00163', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(164, 'Centro Educacional Mundo Encantado', 'RTMA25-00164', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(165, 'Centro Educacional Nadir Soares', 'RTMA25-00165', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(166, 'Centro Educacional Nossa Senhora de Fatima', 'RTMA25-00166', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(167, 'Centro Educacional os Pequenos Notaveis', 'RTMA25-00167', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(168, 'Centro Educacional Palavras do Saber', 'RTMA25-00168', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(169, 'Centro Educacional Parque das Hortensias', 'RTMA25-00169', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(170, 'Centro Educacional Parque das Maravilhas', 'RTMA25-00170', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(171, 'Centro Educacional Passinho de Anjo', 'RTMA25-00171', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(172, 'Centro Educacional Passo a Passo', 'RTMA25-00172', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(173, 'Centro Educacional Passos Firmes', 'RTMA25-00173', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(174, 'Centro Educacional Patricia Ribeiro', 'RTMA25-00174', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(175, 'Centro Educacional Pedacinho do Céu', 'RTMA25-00175', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(176, 'Centro Educacional Pequeno Aprendiz', 'RTMA25-00176', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(177, 'Centro Educacional Pequenos Brilhantes', 'RTMA25-00177', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(178, 'Centro Educacional Pequenos Criadores', 'RTMA25-00178', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(179, 'Centro Educacional Primicias do Senhor', 'RTMA25-00179', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(180, 'Centro Educacional Prof Ana Cleide', 'RTMA25-00180', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(181, 'Centro Educacional Prof Carlos Burga', 'RTMA25-00181', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(182, 'Centro Educacional Profª Helena Romero', 'RTMA25-00182', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(183, 'Centro Educacional Professora Lourdes Elane', 'RTMA25-00183', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(184, 'Centro Educacional Professora Sandra Burga', 'RTMA25-00184', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(185, 'Centro Educacional Raimundo Belo Ferreira', 'RTMA25-00185', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(186, 'Centro Educacional Raio de Luz', 'RTMA25-00186', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(187, 'Centro Educacional Recanto da Crianca e Interativo', 'RTMA25-00187', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(188, 'Centro Educacional Recanto do Senhor', 'RTMA25-00188', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(189, 'Centro Educacional Recanto do Senhor Baby', 'RTMA25-00189', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(190, 'Centro Educacional Recanto dos Anjos', 'RTMA25-00190', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(191, 'Centro Educacional Recanto dos Anjos', 'RTMA25-00191', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(192, 'Centro Educacional Renovacao do Saber', 'RTMA25-00192', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(193, 'Centro Educacional Risque e Rabisque', 'RTMA25-00193', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(194, 'Centro Educacional Rosa Mistica', 'RTMA25-00194', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(195, 'Centro Educacional Rosas de Cassia', 'RTMA25-00195', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(196, 'Centro Educacional Rozilda Neves', 'RTMA25-00196', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(197, 'Centro Educacional Sandra Cavalcante', 'RTMA25-00197', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(198, 'Centro Educacional Santa Teresinha', 'RTMA25-00198', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(199, 'Centro Educacional Seculo', 'RTMA25-00199', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(200, 'Centro Educacional Semeando Saber', 'RTMA25-00200', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(201, 'Centro Educacional Semente de Honra', 'RTMA25-00201', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(202, 'Centro Educacional Semente de Sabedoria do Amazonas', 'RTMA25-00202', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(203, 'Centro Educacional Semente do Amanha', 'RTMA25-00203', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(204, 'Centro Educacional Semente Preciosa', 'RTMA25-00204', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(205, 'Centro Educacional Sementinha de Amor', 'RTMA25-00205', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(206, 'Centro Educacional Sementinha Preciosa', 'RTMA25-00206', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(207, 'Centro Educacional Sementinha Preciosa Unidade Parque Dez', 'RTMA25-00207', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(208, 'Centro Educacional Shalom', 'RTMA25-00208', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(209, 'Centro Educacional Shekinah', 'RTMA25-00209', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(210, 'Centro Educacional Silvia Guerra', 'RTMA25-00210', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(211, 'Centro Educacional Sol Nascente', 'RTMA25-00211', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(212, 'Centro Educacional Soldadinho de Jesus', 'RTMA25-00212', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(213, 'Centro Educacional Soldados de Cristo', 'RTMA25-00213', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(214, 'Centro Educacional Sonho de Crianca', 'RTMA25-00214', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(215, 'Centro Educacional Sonho de Crianca', 'RTMA25-00215', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(216, 'Centro Educacional Sonho Dourado', 'RTMA25-00216', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(217, 'Centro Educacional Tabernaculo', 'RTMA25-00217', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(218, 'Centro Educacional Tales de Mileto', 'RTMA25-00218', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(219, 'Centro Educacional Tancredo Neves', 'RTMA25-00219', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(220, 'Centro Educacional Tavares Ferreira', 'RTMA25-00220', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(221, 'Centro Educacional Triunfo', 'RTMA25-00221', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(222, 'Centro Educacional Vencedores do Amazonas', 'RTMA25-00222', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(223, 'Centro Educacional Yasmin Aghatta- Ceya', 'RTMA25-00223', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(224, 'Centro Educacional Ze Carioca', 'RTMA25-00224', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(225, 'Centro Educaional Arte do Saber', 'RTMA25-00225', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(226, 'Centro Integrado da Amazonia', 'RTMA25-00226', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(227, 'Centro Integrado de Educacao Aprender - Ciea', 'RTMA25-00227', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(228, 'Centro Integrado de Educacao do Amazonas', 'RTMA25-00228', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(229, 'Centro Integrado de Educacao e Cidadania - Ciec', 'RTMA25-00229', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(230, 'Centro Integrado de Educacao e Desenvolvimento- Cied', 'RTMA25-00230', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(231, 'Centro Integrado Elizabeth Pinheiro', 'RTMA25-00231', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(232, 'Centro Integrado Estrela de Davi', 'RTMA25-00232', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(233, 'Centro Integrado Milton Pongitory', 'RTMA25-00233', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(234, 'Centro Metropolitano de Ensino Ltda', 'RTMA25-00234', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(235, 'Centro Positiviano de Ensino', 'RTMA25-00235', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(236, 'Centro Rural de Ensino com Mediacao Tecnologica de Manaus', 'RTMA25-00236', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(237, 'Cesf - Centro Educacional Sao Francisco', 'RTMA25-00237', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(238, 'Ceti Dariana Zuleica Correa Lopes', 'RTMA25-00238', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(239, 'Cime Dra Viviane Estrela Marques Rodella', 'RTMA25-00239', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(240, 'Cime Josefina Rosa de Mattos Pereira de Castro', 'RTMA25-00240', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(241, 'Cime Lucia Melo Ferreira Almeida', 'RTMA25-00241', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(242, 'Cime Professor Dr Jose Aldemir de Oliveira', 'RTMA25-00242', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(243, 'Cime Senador Artur Virgilio do Carmo Ribeiro Filho', 'RTMA25-00243', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(244, 'CMEI Abelhinha', 'RTMA25-00244', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(245, 'CMEI Ailton Roth', 'RTMA25-00245', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(246, 'CMEI Antonio Anastacio Cavalcante', 'RTMA25-00246', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(247, 'CMEI Argentina Barros', 'RTMA25-00247', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(248, 'CMEI Arlindo Pedro Junior', 'RTMA25-00248', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(249, 'CMEI Balbina Mestrinho', 'RTMA25-00249', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(250, 'CMEI Beatriz Sverner', 'RTMA25-00250', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(251, 'CMEI Blandino Jose Ribeiro', 'RTMA25-00251', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(252, 'CMEI Cecilia Cabral', 'RTMA25-00252', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(253, 'CMEI Coracao de Jesus', 'RTMA25-00253', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(254, 'CMEI Dalva Maria Costa e Silva', 'RTMA25-00254', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(255, 'CMEI Denival Leite de Oliveira Junior', 'RTMA25-00255', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(256, 'CMEI Dilsen Silva Alves', 'RTMA25-00256', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(257, 'CMEI Dom Bosco', 'RTMA25-00257', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(258, 'CMEI Doutor Fernando Trigueiro', 'RTMA25-00258', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(259, 'CMEI Escritor Alcides Werk', 'RTMA25-00259', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(260, 'CMEI Escritor Jose Bento Monteiro Lobato', 'RTMA25-00260', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(261, 'CMEI Escritor Raul Davila Pompeia', 'RTMA25-00261', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(262, 'CMEI Eva Gomes do Nascimento', 'RTMA25-00262', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(263, 'CMEI Fatima Maciel da Costa', 'RTMA25-00263', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(264, 'CMEI Flavio Emanuel Espirito Santo Junior', 'RTMA25-00264', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(265, 'CMEI Francisco Pereira da Silva', 'RTMA25-00265', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(266, 'CMEI Graziela Ribeiro', 'RTMA25-00266', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(267, 'CMEI Gustavo Capanema', 'RTMA25-00267', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(268, 'CMEI Heliodoro Balbi', 'RTMA25-00268', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(269, 'CMEI Hermann Gmeiner', 'RTMA25-00269', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(270, 'CMEI Humberto de Alencar Castelo Branco', 'RTMA25-00270', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(271, 'CMEI Irma Evelina Trindade', 'RTMA25-00271', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(272, 'CMEI Irmao Ciro R M Fonseca', 'RTMA25-00272', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(273, 'CMEI Ismail Aziz', 'RTMA25-00273', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(274, 'CMEI Jauary Guimaraes de Souza', 'RTMA25-00274', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(275, 'CMEI Jean Piaget', 'RTMA25-00275', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(276, 'CMEI Joao Barbosa', 'RTMA25-00276', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(277, 'CMEI Julia Barjona Labre', 'RTMA25-00277', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(278, 'CMEI Juracy Freitas Maciel', 'RTMA25-00278', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(279, 'CMEI Madre Ana Rosa Gattorno', 'RTMA25-00279', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(280, 'CMEI Madre Elisia', 'RTMA25-00280', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(281, 'CMEI Maestro Dirson Costa', 'RTMA25-00281', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(282, 'CMEI Marcio Souza', 'RTMA25-00282', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(283, 'CMEI Maria Clara Machado', 'RTMA25-00283', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(284, 'CMEI Maria da Fe Xerez Anzoategui', 'RTMA25-00284', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(285, 'CMEI Maria de Lourdes Braga', 'RTMA25-00285', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(286, 'CMEI Maria de Mattias', 'RTMA25-00286', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(287, 'CMEI Maria do Céu Vaz Doliveira', 'RTMA25-00287', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(288, 'CMEI Maria Emilia Mestrinho', 'RTMA25-00288', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(289, 'CMEI Maria Gracineide Chagas de Negreiros', 'RTMA25-00289', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(290, 'CMEI Mariete Carneiro da Silva', 'RTMA25-00290', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(291, 'CMEI Mary Assayag Hannan', 'RTMA25-00291', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(292, 'CMEI Moacir Andrade', 'RTMA25-00292', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(293, 'CMEI Nilza dos Santos Alencar', 'RTMA25-00293', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(294, 'CMEI Nilza Godoy', 'RTMA25-00294', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(295, 'CMEI Nossa Senhora da Boa Esperanca', 'RTMA25-00295', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(296, 'CMEI Nossa Senhora da Paz', 'RTMA25-00296', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(297, 'CMEI Olavo Bilac', 'RTMA25-00297', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(298, 'CMEI Onias Bento da Silva Filho', 'RTMA25-00298', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(299, 'CMEI Padre Claudio Dalbon', 'RTMA25-00299', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(300, 'CMEI Padre Luis Ruas', 'RTMA25-00300', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(301, 'CMEI Paulo Herban Jacob', 'RTMA25-00301', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(302, 'CMEI Phelippe Daou', 'RTMA25-00302', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(303, 'CMEI Poeta Alvares de Azevedo', 'RTMA25-00303', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(304, 'CMEI Poeta Antonio Goncalves Dias', 'RTMA25-00304', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(305, 'CMEI Poeta Manuel Bandeira', 'RTMA25-00305', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(306, 'CMEI Prof Ariete Gaio de Souza Oliveira', 'RTMA25-00306', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(307, 'CMEI Prof Caio Carlos Frota de Medeiros', 'RTMA25-00307', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(308, 'CMEI Prof Calixto Pereira Cavalcante', 'RTMA25-00308', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(309, 'CMEI Prof Diedres Gama Machado', 'RTMA25-00309', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(310, 'CMEI Prof Dr Felix Valois Coelho', 'RTMA25-00310', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(311, 'CMEI Prof Elza Damasceno da Silva', 'RTMA25-00311', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(312, 'CMEI Prof Escritor Paulinho de Brito', 'RTMA25-00312', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(313, 'CMEI Prof Jose Erico Pereira de Souza', 'RTMA25-00313', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(314, 'CMEI Prof Maria de Fatima Marques Campos', 'RTMA25-00314', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(315, 'CMEI Prof Maria do Socorro Cardoso Silva', 'RTMA25-00315', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(316, 'CMEI Prof Naide Soares de Oliveira', 'RTMA25-00316', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(317, 'CMEI Prof Odete de Araujo Puga Barbosa', 'RTMA25-00317', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(318, 'CMEI Prof Raimundo Figueiredo de Souza', 'RTMA25-00318', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(319, 'CMEI Prof Rita Fonseca Veloso', 'RTMA25-00319', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(320, 'CMEI Prof Rosira dos Santos Monteiro', 'RTMA25-00320', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(321, 'CMEI Prof Rozendo Neto de Lima', 'RTMA25-00321', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(322, 'CMEI Prof Safira Barbosa da Silva', 'RTMA25-00322', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(323, 'CMEI Prof Santina Castro Pereira', 'RTMA25-00323', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(324, 'CMEI Prof Sulamita Pereira Goncalves', 'RTMA25-00324', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(325, 'CMEI Profª Adelaide Bessa Wanderley', 'RTMA25-00325', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(326, 'CMEI Profª Analia Franco', 'RTMA25-00326', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(327, 'CMEI Profª Cacilda Pinto de Lima', 'RTMA25-00327', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(328, 'CMEI Profª Dulcineia Tinoco', 'RTMA25-00328', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(329, 'CMEI Profª Maria Amelia Tavares Lopes', 'RTMA25-00329', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(330, 'CMEI Profª Maria Braz Viegas', 'RTMA25-00330', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(331, 'CMEI Profª Maria Raimunda', 'RTMA25-00331', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(332, 'CMEI Profª Renata Holanda de Sgoncalves', 'RTMA25-00332', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(333, 'CMEI Profª Rita Etelvina Cassia Gmourao', 'RTMA25-00333', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(334, 'CMEI Profa Rossana da Silva Gadelha', 'RTMA25-00334', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(335, 'CMEI Profª Sofia Soeiro do Nascimento', 'RTMA25-00335', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(336, 'CMEI Profª Suely Cruz de Pinho Pompeu', 'RTMA25-00336', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(337, 'CMEI Professora Joelma Silva de Oliveira', 'RTMA25-00337', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(338, 'CMEI Raimunda Rosa Pereira de Almeida', 'RTMA25-00338', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(339, 'CMEI Raimundo Nonato de Aguiar', 'RTMA25-00339', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(340, 'CMEI Raquel de Queiroz', 'RTMA25-00340', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(341, 'CMEI Santa Izabel', 'RTMA25-00341', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(342, 'CMEI Sao Judas Tadeu', 'RTMA25-00342', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(343, 'CMEI Senador Alvaro Botelho Maia', 'RTMA25-00343', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(344, 'CMEI Tancredo Neves', 'RTMA25-00344', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(345, 'CMEI Tenente Roxana Pereira Bonessi', 'RTMA25-00345', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(346, 'CMEI Umberto Calderaro', 'RTMA25-00346', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(347, 'CMEI Violeta Branca M de Oliveira', 'RTMA25-00347', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(348, 'Col Dom Bosco', 'RTMA25-00348', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(349, 'Colegio Adventista da Alvorada', 'RTMA25-00349', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(350, 'Colegio Adventista da Cidade Nova', 'RTMA25-00350', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(351, 'Colegio Adventista de Manaus', 'RTMA25-00351', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(352, 'Colegio Adventista Paul Bernard', 'RTMA25-00352', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(353, 'Colegio Amazonense Dom Pedro II', 'RTMA25-00353', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(354, 'Colegio Arvore do Abc', 'RTMA25-00354', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(355, 'Colegio Batista Brasil Ida Nelson', 'RTMA25-00355', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(356, 'Colegio Batista Ebenezer', 'RTMA25-00356', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(357, 'Colegio Batista Inovacao', 'RTMA25-00357', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(358, 'Colegio Brasileiro Pedro Silvestre', 'RTMA25-00358', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(359, 'Colegio Cristao Doce Amor', 'RTMA25-00359', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(360, 'Colegio Dom Bosco Leste', 'RTMA25-00360', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(361, 'Colegio Educacao Integrado Kedma', 'RTMA25-00361', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(362, 'Colegio Espirita Marilia Barbosa', 'RTMA25-00362', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(363, 'Colegio Genesis Manaus', 'RTMA25-00363', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(364, 'Colegio Maria Angelim', 'RTMA25-00364', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(365, 'Colegio Militar da Policia Militar do Amazonas', 'RTMA25-00365', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(366, 'Colegio Militar de Manaus', 'RTMA25-00366', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(367, 'Colegio Nazareno', 'RTMA25-00367', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(368, 'Colegio Nossa Senhora Auxiliadora', 'RTMA25-00368', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(369, 'Colegio Palas Atena', 'RTMA25-00369', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(370, 'Colegio Preciosissimo Sangue', 'RTMA25-00370', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(371, 'Colegio Santa Doroteia', 'RTMA25-00371', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(372, 'Colegio Santo Afonso', 'RTMA25-00372', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(373, 'Colegio Sao Domenico Savio', 'RTMA25-00373', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(374, 'Connexus Ensino Fundamental e Medio Ltda', 'RTMA25-00374', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(375, 'Creche e Aparece Ed Infantil e Bercario Ltda', 'RTMA25-00375', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(376, 'Creche e Escola Pequeno Criadores', 'RTMA25-00376', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(377, 'Creche e Pre Escola Recanto de Nossa Senhora', 'RTMA25-00377', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(378, 'Creche Escola Confiare Ltda', 'RTMA25-00378', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(379, 'Creche Escola Lapis Criativo', 'RTMA25-00379', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(380, 'Creche Escola Mamae Coruja', 'RTMA25-00380', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(381, 'Creche Escola Planeta Bebe', 'RTMA25-00381', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(382, 'Creche Escola Ponta Negra', 'RTMA25-00382', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(383, 'Creche Maria da Anunciacao Noronha', 'RTMA25-00383', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(384, 'Creche Mul Magdalena Arce Daou', 'RTMA25-00384', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(385, 'Creche Mul Manuel Octavio Rodrigues Souza', 'RTMA25-00385', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(386, 'Creche Mul Maria Ferreira Bernardes', 'RTMA25-00386', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(387, 'Creche Mul Maria Luiza da Conceicao Silva', 'RTMA25-00387', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(388, 'Creche Mul Prof Dalvina do Nascimento Martins', 'RTMA25-00388', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(389, 'Creche Mul Prof Eliana de Freitas Moraes', 'RTMA25-00389', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(390, 'Creche Mul Profª Virginia Marilia Mello de Araujo', 'RTMA25-00390', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(391, 'Creche Municipal Almirante Victorio Jose Barbosa da Lomba', 'RTMA25-00391', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(392, 'Creche Municipal Ana Lopes Pereira', 'RTMA25-00392', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(393, 'Creche Municipal Caio Fabio D Araujo', 'RTMA25-00393', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(394, 'Creche Municipal Dalila Bentes Duarte', 'RTMA25-00394', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(395, 'Creche Municipal Dorothea de Souza Braga', 'RTMA25-00395', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(396, 'Creche Municipal Edith Monteiro Porto', 'RTMA25-00396', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(397, 'Creche Municipal Gabriel Correa Pedrosa', 'RTMA25-00397', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(398, 'Creche Municipal Jose de Oliveira Fernandes', 'RTMA25-00398', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(399, 'Creche Municipal Judy Cristine Cardoso Silva', 'RTMA25-00399', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(400, 'Creche Municipal Magnolia Pessoa Figueiredo', 'RTMA25-00400', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(401, 'Creche Municipal Maria Aparecida Silva Dantas', 'RTMA25-00401', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(402, 'Creche Municipal Maria do Perpetuo Socorro Trindade Psena', 'RTMA25-00402', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(403, 'Creche Municipal Neide Tomaz Avelino', 'RTMA25-00403', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(404, 'Creche Municipal Prof Elias Lima de Souza', 'RTMA25-00404', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(405, 'Creche Municipal Prof Libania Theodora Rodrigues Ferreira', 'RTMA25-00405', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25');
INSERT INTO `schools` (`id`, `name`, `code`, `city`, `state`, `active`, `created_at`, `updated_at`) VALUES
(406, 'Creche Municipal Prof Maristela Martins Reboucas', 'RTMA25-00406', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(407, 'Creche Municipal Professora Luzenir Farias Lopes', 'RTMA25-00407', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(408, 'Creche Municipal Severo Camara', 'RTMA25-00408', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(409, 'Creche Municipal Tude Moutinho da Costa', 'RTMA25-00409', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(410, 'Creche Zeze Pio de Souza', 'RTMA25-00410', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(411, 'Curso Regular de Educacao a Distancia - Cmm', 'RTMA25-00411', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(412, 'E E Professor Francisco das Chagas de Souza Albuquerque', 'RTMA25-00412', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(413, 'E M Anna Raymunda de Mattos Pereira Gadelha', 'RTMA25-00413', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(414, 'E M Luiz Jorge da Silva', 'RTMA25-00414', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(415, 'E M Magnolia Frota', 'RTMA25-00415', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(416, 'E M Mario Jorge do Couto Lopes', 'RTMA25-00416', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(417, 'E M Prof Erick Vicente de Souza', 'RTMA25-00417', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(418, 'E M Prof Fernando Timoteo da Silva', 'RTMA25-00418', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(419, 'Educandario Espirita Santo Agostinho', 'RTMA25-00419', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(420, 'EE Profª Bernardete do Socorro Trindade da Rocha', 'RTMA25-00420', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(421, 'Eeti Aurea Pinheiro Braga', 'RTMA25-00421', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(422, 'Eeti Dra Zilda Arns Neumann', 'RTMA25-00422', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(423, 'Eeti Elisa Bessa Freire', 'RTMA25-00423', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(424, 'Eeti Engenheiro Professor Sergio Alfredo Pessoa Figueiredo', 'RTMA25-00424', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(425, 'Eeti Estelita Tapajos', 'RTMA25-00425', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(426, 'Eeti Gilberto Mestrinho de Medeiros Raposo', 'RTMA25-00426', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(427, 'Eeti Joao dos Santos Braga', 'RTMA25-00427', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(428, 'Eeti Marcantonio Vilaca II', 'RTMA25-00428', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(429, 'Eeti Professor Garcitylzo do Lago e Silva', 'RTMA25-00429', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(430, 'Eeti Professora Cinthia Regia Gomes do Livramento', 'RTMA25-00430', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(431, 'Eeti Professora Lecita Fonseca Ramos', 'RTMA25-00431', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(432, 'Eeti Rafaiel Henrique Pinheiro dos Santos', 'RTMA25-00432', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(433, 'Eim Kunyata Putira', 'RTMA25-00433', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(434, 'EM Abilio Alencar', 'RTMA25-00434', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(435, 'EM Abilio Nery', 'RTMA25-00435', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(436, 'EM Alan Kardec', 'RTMA25-00436', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(437, 'EM Alberico Antunes de Oliveira', 'RTMA25-00437', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(438, 'EM Alfredo Linhares', 'RTMA25-00438', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(439, 'EM Almeron Caminha Monteiro', 'RTMA25-00439', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(440, 'EM Alternativa Padre Mauro Fancello', 'RTMA25-00440', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(441, 'EM Americo Gosztonyi', 'RTMA25-00441', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(442, 'EM Amine Daou Lindoso', 'RTMA25-00442', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(443, 'EM Ana Maria de Souza Barros', 'RTMA25-00443', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(444, 'EM Ana Mota Braga', 'RTMA25-00444', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(445, 'EM Ana Sena Rodrigues', 'RTMA25-00445', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(446, 'EM Anastacio Assuncao', 'RTMA25-00446', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(447, 'EM Anita Garibaldi', 'RTMA25-00447', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(448, 'EM Antisthenes de Oliveira Pinto', 'RTMA25-00448', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(449, 'EM Antonia Alexandrina', 'RTMA25-00449', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(450, 'EM Antonia Medeiros da Silva', 'RTMA25-00450', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(451, 'EM Antonina Borges de Sa', 'RTMA25-00451', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(452, 'EM Antonio Matias Fernandes', 'RTMA25-00452', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(453, 'EM Antonio Moraes', 'RTMA25-00453', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(454, 'EM Aracylia Oliveira da Silva Costa', 'RTMA25-00454', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(455, 'EM Aristophanes Bezerra de Castro', 'RTMA25-00455', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(456, 'EM Aristoteles Comte de Alencar', 'RTMA25-00456', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(457, 'EM Armando de Souza Mendes', 'RTMA25-00457', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(458, 'EM Arquiteta Angelica Maria Vieira da Cruz', 'RTMA25-00458', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(459, 'EM Arte e Cultura', 'RTMA25-00459', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(460, 'EM Arthur Cezar Ferreira Reis', 'RTMA25-00460', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(461, 'EM Arthur Engracio da Silva', 'RTMA25-00461', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(462, 'EM Arthur Virgilio Filho', 'RTMA25-00462', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(463, 'EM Aureo Nonato', 'RTMA25-00463', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(464, 'EM Bem-Te-VI', 'RTMA25-00464', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(465, 'EM Benjamim Matias Fernandes', 'RTMA25-00465', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(466, 'EM Biologo Adolpho Ducke', 'RTMA25-00466', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(467, 'EM Boa Esperanca', 'RTMA25-00467', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(468, 'EM Bom Jesus', 'RTMA25-00468', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(469, 'EM Canaa I', 'RTMA25-00469', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(470, 'EM Canaa II', 'RTMA25-00470', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(471, 'EM Carlos Antonio Cardoso', 'RTMA25-00471', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(472, 'EM Carlos Gomes', 'RTMA25-00472', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(473, 'EM Carlos Santos', 'RTMA25-00473', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(474, 'EM Carmem Guimaraes Hagge', 'RTMA25-00474', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(475, 'EM Carolina Perolina Raimunda Almeida', 'RTMA25-00475', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(476, 'EM Catarina Paz da Costa', 'RTMA25-00476', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(477, 'EM Cesar Augusto Bezerra Galvao', 'RTMA25-00477', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(478, 'EM Chapeuzinho de Palha', 'RTMA25-00478', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(479, 'EM Cleonice de Meneses Fernandes', 'RTMA25-00479', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(480, 'EM Comunitaria Sagrado Coracao de Jesus', 'RTMA25-00480', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(481, 'EM Coronel Jorge Teixeira de Oliveira', 'RTMA25-00481', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(482, 'EM Deputado Arthur Virgilio do Carmo Ribeiro Bisneto', 'RTMA25-00482', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(483, 'EM Deputado Federal Ulisses Guimaraes', 'RTMA25-00483', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(484, 'EM Desembargador Candido Honorio Ferreira', 'RTMA25-00484', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(485, 'EM Desembargador Felismino Francisco Soares', 'RTMA25-00485', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(486, 'EM Desembargador Oyama Ituassu', 'RTMA25-00486', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(487, 'EM Divino Espirito Santo', 'RTMA25-00487', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(488, 'EM Divino Pimenta Faleiros', 'RTMA25-00488', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(489, 'EM Djalma Passos', 'RTMA25-00489', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(490, 'EM Dom Jacson Damasceno Rodrigues', 'RTMA25-00490', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(491, 'EM Dom Milton Correa Pereira', 'RTMA25-00491', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(492, 'EM Domingos Savio', 'RTMA25-00492', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(493, 'EM Doutor Aderson Pereira Dutra', 'RTMA25-00493', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(494, 'EM Doutor Geraldo Pinheiro', 'RTMA25-00494', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(495, 'EM Doutor Joao Queiroz', 'RTMA25-00495', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(496, 'EM Doutor Olavo das Neves', 'RTMA25-00496', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(497, 'EM Doutor Paulo Pinto Nery', 'RTMA25-00497', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(498, 'EM Doutor Raymundo Nonato de Magalhaes Cordeiro', 'RTMA25-00498', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(499, 'EM Ebenezer', 'RTMA25-00499', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(500, 'EM Educ Especial Andre Vidal de Araujo', 'RTMA25-00500', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(501, 'EM Eliana Lucia Monteiro da Silva', 'RTMA25-00501', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(502, 'EM Elinea Folhadela', 'RTMA25-00502', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(503, 'EM Elvira Borges', 'RTMA25-00503', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(504, 'EM Engenheiro Antonio Nelson de Oliveira Neto', 'RTMA25-00504', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(505, 'EM Engenheiro Joao Alberto Menezes Braga', 'RTMA25-00505', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(506, 'EM Epitacio Nunes da Fonseca', 'RTMA25-00506', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(507, 'EM Erasmo Augusto de Araujo', 'RTMA25-00507', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(508, 'EM Escritor Anisio Teixeira', 'RTMA25-00508', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(509, 'EM Escritor Erasmo do Amaral Linhares', 'RTMA25-00509', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(510, 'EM Escritor Erico Verissimo', 'RTMA25-00510', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(511, 'EM Escritor Lima Barreto', 'RTMA25-00511', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(512, 'EM Escritora Nisia Floresta Brasileira Augusta', 'RTMA25-00512', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(513, 'EM Escritora Zelia Gattai', 'RTMA25-00513', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(514, 'EM Esmeralda Soares Mendes', 'RTMA25-00514', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(515, 'EM Esmeraldo Santos Bessa', 'RTMA25-00515', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(516, 'EM Ester', 'RTMA25-00516', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(517, 'EM Estrela da Manha', 'RTMA25-00517', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(518, 'EM Etelvina Pereira Braga', 'RTMA25-00518', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(519, 'EM Figueiredo Pimentel', 'RTMA25-00519', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(520, 'EM Firme na Fe', 'RTMA25-00520', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(521, 'EM Francinete Rocha Brasil', 'RTMA25-00521', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(522, 'EM Francisca Gomes Mendes', 'RTMA25-00522', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(523, 'EM Francisca Mendes', 'RTMA25-00523', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(524, 'EM Francisca Soares', 'RTMA25-00524', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(525, 'EM Francisco Coelho', 'RTMA25-00525', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(526, 'EM Francisco Diogo de Melo', 'RTMA25-00526', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(527, 'EM Francisco Guedes de Queiroz', 'RTMA25-00527', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(528, 'EM Francisco Maia de Amorim', 'RTMA25-00528', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(529, 'EM Francisco Nunes da Silva', 'RTMA25-00529', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(530, 'EM Francisco Orellana', 'RTMA25-00530', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(531, 'EM Francisco Pinheiro de Lima', 'RTMA25-00531', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(532, 'EM Frei Mario Monacelli de Grello', 'RTMA25-00532', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(533, 'EM General Aristides Barreto', 'RTMA25-00533', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(534, 'EM Gilberto Rodrigues dos Santos', 'RTMA25-00534', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(535, 'EM Governador Danilo de Matos Areosa', 'RTMA25-00535', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(536, 'EM Governador Eduardo Ribeiro', 'RTMA25-00536', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(537, 'EM Governador Gilberto Mestrinho', 'RTMA25-00537', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(538, 'EM Governador Plinio Ramos Coelho', 'RTMA25-00538', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(539, 'EM Graziela Ribeiro', 'RTMA25-00539', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(540, 'EM Guilherme Barbosa Baker', 'RTMA25-00540', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(541, 'EM Hahnemann Bacelar', 'RTMA25-00541', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(542, 'EM Helena Augusta Walcott', 'RTMA25-00542', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(543, 'EM Hemeterio Cabrinha', 'RTMA25-00543', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(544, 'EM Hiran de Lima Caminha', 'RTMA25-00544', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(545, 'EM Historiador Mario Ypiranga Monteiro', 'RTMA25-00545', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(546, 'EM Honorina de Azevedo Vasconcelos', 'RTMA25-00546', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(547, 'EM Imaculada Conceicao', 'RTMA25-00547', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(548, 'EM Inaneide Cunha Marques Costa', 'RTMA25-00548', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(549, 'EM Irma Dulce', 'RTMA25-00549', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(550, 'EM Irma Edelvira Esmeralda de Souto Cabral', 'RTMA25-00550', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(551, 'EM Irma Serafina Cinque', 'RTMA25-00551', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(552, 'EM Irma Zenir de Castro Alves', 'RTMA25-00552', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(553, 'EM Ivan Junior Saraiva de Barros', 'RTMA25-00553', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(554, 'EM Izabel Angarita', 'RTMA25-00554', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(555, 'EM Joao Alfredo', 'RTMA25-00555', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(556, 'EM Joao Aparecido Alves dos Santos', 'RTMA25-00556', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(557, 'EM Joao Chrysostomo de Oliveira', 'RTMA25-00557', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(558, 'EM Joao dos Santos Pereira Braga', 'RTMA25-00558', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(559, 'EM Joao Paulo II', 'RTMA25-00559', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(560, 'EM Joao Valente', 'RTMA25-00560', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(561, 'EM Joaquim da Silva Pinto', 'RTMA25-00561', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(562, 'EM Jorge Amado', 'RTMA25-00562', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(563, 'EM Jorge de Rezende Sobrinho', 'RTMA25-00563', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(564, 'EM Jornalista Saba Raposo', 'RTMA25-00564', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(565, 'EM Jose Augusto Roque da Cunha', 'RTMA25-00565', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(566, 'EM Jose Carlos Martins Mestrinho', 'RTMA25-00566', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(567, 'EM Jose Euclides Costa de Azevedo', 'RTMA25-00567', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(568, 'EM Jose Garcia Rodrigues', 'RTMA25-00568', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(569, 'EM Jose Marques de Almeida', 'RTMA25-00569', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(570, 'EM Jose Sobreira do Nascimento', 'RTMA25-00570', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(571, 'EM Jose Tavares de Macedo', 'RTMA25-00571', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(572, 'EM Lago e Silva', 'RTMA25-00572', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(573, 'EM Leonor Uchoa de Amorim', 'RTMA25-00573', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(574, 'EM LILI Benchimol', 'RTMA25-00574', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(575, 'EM Lirio do Vale', 'RTMA25-00575', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(576, 'EM Loris Cordovil', 'RTMA25-00576', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(577, 'EM Lucila Freitas', 'RTMA25-00577', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(578, 'EM Lucilene de Sena Guimaraes', 'RTMA25-00578', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(579, 'EM Luis Alberto Castelo', 'RTMA25-00579', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(580, 'EM Luis Freire de Oliveira', 'RTMA25-00580', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(581, 'EM Madalena dos Santos Costa', 'RTMA25-00581', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(582, 'EM Madre Tereza de Calcuta', 'RTMA25-00582', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(583, 'EM Manoel Adriano', 'RTMA25-00583', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(584, 'EM Manoel Chagas', 'RTMA25-00584', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(585, 'EM Manoel Francisco Garcia Marques', 'RTMA25-00585', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(586, 'EM Maria do Carmo Rebello de Souza', 'RTMA25-00586', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(587, 'EM Maria Fernandes', 'RTMA25-00587', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(588, 'EM Maria Ferreira da Silva', 'RTMA25-00588', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(589, 'EM Maria Lena de Souza Alcantara', 'RTMA25-00589', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(590, 'EM Maria Madalena Correa', 'RTMA25-00590', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(591, 'EM Maria Pereira Campos', 'RTMA25-00591', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(592, 'EM Maria Rufina de Almeida', 'RTMA25-00592', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(593, 'EM Mario de Andrade', 'RTMA25-00593', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(594, 'EM Mario Lago', 'RTMA25-00594', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(595, 'EM Mario Palmerio', 'RTMA25-00595', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(596, 'EM Miguel Arraes de Alencar', 'RTMA25-00596', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(597, 'EM Ministro Mario Andreazza', 'RTMA25-00597', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(598, 'EM Moacir Elias de Araujo', 'RTMA25-00598', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(599, 'EM Monsenhor Francisco da Silveira Pinto', 'RTMA25-00599', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(600, 'EM Monte Horebe', 'RTMA25-00600', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(601, 'EM Monte Sinai', 'RTMA25-00601', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(602, 'EM Nazira Chamma Daou', 'RTMA25-00602', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(603, 'EM Nestor Jose Soeiro do Nascimento', 'RTMA25-00603', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(604, 'EM Nina de Araujo Costa Lins', 'RTMA25-00604', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(605, 'EM Nossa Senhora Aparecida', 'RTMA25-00605', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(606, 'EM Nossa Senhora da Paz- Urbana', 'RTMA25-00606', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(607, 'EM Nossa Senhora das Gracas', 'RTMA25-00607', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(608, 'EM Nossa Senhora de Fatima', 'RTMA25-00608', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(609, 'EM Nossa Senhora de Nazare', 'RTMA25-00609', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(610, 'EM Nossa Senhora do Carmo', 'RTMA25-00610', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(611, 'EM Nossa Senhora do Rosario', 'RTMA25-00611', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(612, 'EM Nova Vida', 'RTMA25-00612', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(613, 'EM Olga Figueiredo', 'RTMA25-00613', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(614, 'EM Olga Gutmann Benario', 'RTMA25-00614', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(615, 'EM Osvaldo Sobreira', 'RTMA25-00615', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(616, 'EM Ouvidor Sampaio', 'RTMA25-00616', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(617, 'EM Padre Calleri', 'RTMA25-00617', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(618, 'EM Padre Joao Dvries', 'RTMA25-00618', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(619, 'EM Padre Jose de Anchieta', 'RTMA25-00619', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(620, 'EM Padre Puga', 'RTMA25-00620', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(621, 'EM Padre Raimundo Nonato Pinheiro', 'RTMA25-00621', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(622, 'EM Paula Frassinetti', 'RTMA25-00622', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(623, 'EM Paulo Freire', 'RTMA25-00623', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(624, 'EM Pedro Dias Silva', 'RTMA25-00624', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(625, 'EM Pequeno Principe', 'RTMA25-00625', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(626, 'EM Pintor Leonardo da Vinci', 'RTMA25-00626', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(627, 'EM Pintora Tarsila do Amaral', 'RTMA25-00627', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(628, 'EM Poeta Joao Cabral de Melo Neto', 'RTMA25-00628', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(629, 'EM Poeta Mario de Miranda Quintana', 'RTMA25-00629', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(630, 'EM Poetisa Cora Coralina', 'RTMA25-00630', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(631, 'EM Presidente Joao Goulart', 'RTMA25-00631', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(632, 'EM Presidente Manuel Ferraz de Campos Sales', 'RTMA25-00632', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(633, 'EM Presidente Tancredo Neves', 'RTMA25-00633', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(634, 'EM Prof Adelaide Tavares de Macedo', 'RTMA25-00634', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(635, 'EM Prof Agenor Ferreira Lima', 'RTMA25-00635', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(636, 'EM Prof Alberto Makarem', 'RTMA25-00636', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(637, 'EM Prof Alvaro Cesar de Carvalho', 'RTMA25-00637', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(638, 'EM Prof Alvaro Vale', 'RTMA25-00638', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(639, 'EM Prof Ana Cristina Aquino de Melo', 'RTMA25-00639', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(640, 'EM Prof Carlos Farias Ouro de Carvalho', 'RTMA25-00640', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(641, 'EM Prof Davison de Araujo Pereira', 'RTMA25-00641', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(642, 'EM Prof Elcy Mesquita Lima', 'RTMA25-00642', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(643, 'EM Prof Emanuel Rebelo da Cunha', 'RTMA25-00643', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(644, 'EM Prof Francisca Lima da Rocha', 'RTMA25-00644', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(645, 'EM Prof Francisca Pereira de Araujo', 'RTMA25-00645', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(646, 'EM Prof Gelcy Sena Abrantes', 'RTMA25-00646', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(647, 'EM Prof Ivomar de Lima Vieira', 'RTMA25-00647', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(648, 'EM Prof Ivone Maria Barbosa e Silva', 'RTMA25-00648', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(649, 'EM Prof Jarlece da Conceicao Zaranza', 'RTMA25-00649', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(650, 'EM Prof Joao Castro Filho', 'RTMA25-00650', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(651, 'EM Prof Joaquim Gonzaga Pinheiro', 'RTMA25-00651', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(652, 'EM Prof Jose Wandemberg Ramos Leite', 'RTMA25-00652', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(653, 'EM Prof Julio Cesar de Moraes Passos', 'RTMA25-00653', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(654, 'EM Prof Lea Alencar Antony', 'RTMA25-00654', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(655, 'EM Prof Manuel da Silva Bahia', 'RTMA25-00655', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(656, 'EM Prof Maria Jose Nunes da Luz', 'RTMA25-00656', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(657, 'EM Prof Maria Lira Pereira', 'RTMA25-00657', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(658, 'EM Prof Moises de Franca Viana', 'RTMA25-00658', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(659, 'EM Prof Neuza dos Santos Ribeiro', 'RTMA25-00659', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(660, 'EM Prof Nilton Lins', 'RTMA25-00660', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(661, 'EM Prof Noemia Santana do Nascimento da Costa', 'RTMA25-00661', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(662, 'EM Prof Paulo Cesar da Silva Nonato', 'RTMA25-00662', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(663, 'EM Prof Paulo Graca', 'RTMA25-00663', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(664, 'EM Prof Pedro Diogo dos Santos Roque', 'RTMA25-00664', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(665, 'EM Prof Percilia do Nascimento Souza', 'RTMA25-00665', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(666, 'EM Prof Raimundo Almeida Lucio', 'RTMA25-00666', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(667, 'EM Prof Raimundo Goncalves Nogueira', 'RTMA25-00667', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(668, 'EM Prof Ricardo Pereira Parente', 'RTMA25-00668', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(669, 'EM Prof Roberto da Silva Peixoto', 'RTMA25-00669', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(670, 'EM Prof Roberto dos Santos Vieira', 'RTMA25-00670', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(671, 'EM Prof Rubem da Silva Peixoto', 'RTMA25-00671', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(672, 'EM Prof Ruth Costa', 'RTMA25-00672', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(673, 'EM Prof Sebastiao Augusto Loureiro Filho', 'RTMA25-00673', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(674, 'EM Prof Sergio Augusto para Bittencourt', 'RTMA25-00674', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(675, 'EM Prof Sonia Maria da Silva Barbosa', 'RTMA25-00675', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(676, 'EM Prof Themistocles Pinheiro Gadelha', 'RTMA25-00676', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(677, 'EM Profª Alexandrina Rodrigues Barros', 'RTMA25-00677', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(678, 'EM Profª Antonia Pereira da Silva', 'RTMA25-00678', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(679, 'EM Profª Aribaldina de Lima Brito', 'RTMA25-00679', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(680, 'EM Profa Dalvina Silva de Oliveira', 'RTMA25-00680', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(681, 'EM Profª Dian Kelly do Nascimento Mota', 'RTMA25-00681', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(682, 'EM Profª Dulcenides dos Santos Dias', 'RTMA25-00682', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(683, 'EM Profª Edinir Telles Guimaraes', 'RTMA25-00683', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(684, 'EM Profª Eliana Socorro Pacheco Braga', 'RTMA25-00684', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(685, 'EM Profª Elizabeth Beltrao', 'RTMA25-00685', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(686, 'EM Profª Francisca Campos Correa', 'RTMA25-00686', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(687, 'EM Profª Francisca Pergentina da Silva', 'RTMA25-00687', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(688, 'EM Profª Genilda Martins Pereira', 'RTMA25-00688', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(689, 'EM Profª Graciele Fernandes Zany', 'RTMA25-00689', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(690, 'EM Profª Ignes de Vasconcelos Dias', 'RTMA25-00690', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(691, 'EM Profª Isabel Victoria do Carmo Ribeiro', 'RTMA25-00691', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(692, 'EM Profª Joana Vieira', 'RTMA25-00692', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(693, 'EM Profª Ligia Mesquita Fialho', 'RTMA25-00693', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(694, 'EM Profª Maria Aime Bezerra de Souza', 'RTMA25-00694', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(695, 'EM Profª Maria Auxiliadora Santos Azevedo', 'RTMA25-00695', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(696, 'EM Profa Maria das Gracas Andrade Vasconcelos', 'RTMA25-00696', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(697, 'EM Profª Maria do Socorro Azevedo de Oliveira', 'RTMA25-00697', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(698, 'EM Profª Maria Isabel Cordeiro Melgueiro', 'RTMA25-00698', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(699, 'EM Profª Maria Leide Amorim', 'RTMA25-00699', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(700, 'EM Profª Maria Raimunda Marques Brasil', 'RTMA25-00700', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(701, 'EM Profª Maria Rodrigues Tapajos', 'RTMA25-00701', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(702, 'EM Profª Marly Barbosa Garganta', 'RTMA25-00702', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(703, 'EM Profa Martinha Correa dos Santos', 'RTMA25-00703', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(704, 'EM Profª Oscarina Falcao', 'RTMA25-00704', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(705, 'EM Profª Raimunda Eneida Cerquinho da Silva', 'RTMA25-00705', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(706, 'EM Profª Raimunda Nonata Maciel', 'RTMA25-00706', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(707, 'EM Profª Raimunda Nonata Soares de Deus', 'RTMA25-00707', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(708, 'EM Profª Regina Vitoria Pires Muniz', 'RTMA25-00708', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(709, 'EM Profª Rita de Cassia Cassiano da Silva', 'RTMA25-00709', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(710, 'EM Profª Silvia Helena Costa de Oliveira Bonetti', 'RTMA25-00710', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(711, 'EM Profª Tereza Cordovil Guimaraes', 'RTMA25-00711', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(712, 'EM Profª Zenaira Bentes Monteiro Pastor', 'RTMA25-00712', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(713, 'EM Profª Zenir Pinto Pedroso', 'RTMA25-00713', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(714, 'EM Profª Zilda Iracema Melgueiro Nunes', 'RTMA25-00714', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(715, 'EM Professora Elizabeth Siqueira Ferreira', 'RTMA25-00715', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(716, 'EM Professora Miriam Sotero da Silva', 'RTMA25-00716', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(717, 'EM Professora Paula Aliomar Ribeiro Beltrao', 'RTMA25-00717', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(718, 'EM Profº Heleno Nogueira dos Santos', 'RTMA25-00718', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(719, 'EM Raimunda Barroso Ramires', 'RTMA25-00719', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(720, 'EM Raimunda Brasil', 'RTMA25-00720', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(721, 'EM Raimundo Nonato de Oliveira Gomes', 'RTMA25-00721', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(722, 'EM Raimundo Teodoro Botinelly Assumpcao', 'RTMA25-00722', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(723, 'EM Raul de Queiroz de Menezes Veiga', 'RTMA25-00723', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(724, 'EM Raul Pompeia', 'RTMA25-00724', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(725, 'EM Republica do Mexico', 'RTMA25-00725', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(726, 'EM Roberto Ruiz Hernandez', 'RTMA25-00726', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(727, 'EM Rodolpho Valle', 'RTMA25-00727', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(728, 'EM Rosa Sverner', 'RTMA25-00728', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(729, 'EM Rubens Sverner', 'RTMA25-00729', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(730, 'EM Rui Barbosa', 'RTMA25-00730', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(731, 'EM Rui Barbosa Lima', 'RTMA25-00731', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(732, 'EM Ruth Leia Oliveira dos Santos', 'RTMA25-00732', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(733, 'EM Santa Etelvina', 'RTMA25-00733', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(734, 'EM Santa Luzia', 'RTMA25-00734', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(735, 'EM Santa Rita de Cassia', 'RTMA25-00735', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(736, 'EM Santa Rosa', 'RTMA25-00736', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(737, 'EM Santa Rosa II', 'RTMA25-00737', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(738, 'EM Santo Agostinho', 'RTMA25-00738', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(739, 'EM Santo Antonio', 'RTMA25-00739', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(740, 'EM Santo Antonio -Ribeirinha', 'RTMA25-00740', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(741, 'EM Sao Benedito', 'RTMA25-00741', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(742, 'EM Sao Dimas', 'RTMA25-00742', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(743, 'EM Sao Francisco', 'RTMA25-00743', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(744, 'EM Sao Francisco das Chagas', 'RTMA25-00744', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(745, 'EM Sao Joao', 'RTMA25-00745', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(746, 'EM Sao Joao -Ribeirinha', 'RTMA25-00746', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(747, 'EM Sao Jorge', 'RTMA25-00747', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(748, 'EM Sao Jose -Rodoviaria', 'RTMA25-00748', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(749, 'EM Sao Jose do Parana da Eva', 'RTMA25-00749', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(750, 'EM Sao Jose do Taruma', 'RTMA25-00750', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(751, 'EM Sao Judas Tadeu', 'RTMA25-00751', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(752, 'EM Sao Lazaro', 'RTMA25-00752', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(753, 'EM Sao Luis', 'RTMA25-00753', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(754, 'EM Sao Luiz de Gonzaga', 'RTMA25-00754', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(755, 'EM Sao Pedro -Ribeirinha', 'RTMA25-00755', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(756, 'EM Sao Pedro-Urbana', 'RTMA25-00756', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(757, 'EM Sao Salvador', 'RTMA25-00757', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(758, 'EM Sao Sebastiao -Urbana', 'RTMA25-00758', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(759, 'EM Sao Sebastiao I', 'RTMA25-00759', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(760, 'EM Sao Sebastiao II do Tarumazinho', 'RTMA25-00760', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(761, 'EM Sao Vicente de Paula', 'RTMA25-00761', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(762, 'EM Sara Barroso Cordeiro', 'RTMA25-00762', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(763, 'EM Sebastiao Noroes', 'RTMA25-00763', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(764, 'EM Senador Alvaro Botelho Maia', 'RTMA25-00764', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(765, 'EM Senador Darcy Ribeiro', 'RTMA25-00765', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(766, 'EM Senador Fabio Pereira de Lucena Bittencourt', 'RTMA25-00766', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(767, 'EM Senador Jose Jefferson Carpinteiro Peres', 'RTMA25-00767', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(768, 'EM Sergio Alfredo Pessoa Figueiredo', 'RTMA25-00768', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(769, 'EM Silvio Romero', 'RTMA25-00769', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(770, 'EM Siria Mamed Amed Chagas', 'RTMA25-00770', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(771, 'EM Sociologo Herbert Jose de Souza', 'RTMA25-00771', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(772, 'EM Solange Nascimento', 'RTMA25-00772', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(773, 'EM Tereza Rosa Aguiar Abtibol', 'RTMA25-00773', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(774, 'EM Terezinha Moura Brasil', 'RTMA25-00774', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(775, 'EM Thales Silvestre', 'RTMA25-00775', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(776, 'EM Thomas Meireles', 'RTMA25-00776', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(777, 'EM Vicente Cruz', 'RTMA25-00777', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(778, 'EM Vicente Mendonca Junior', 'RTMA25-00778', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(779, 'EM Vila da Felicidade', 'RTMA25-00779', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(780, 'EM Villa Lobos', 'RTMA25-00780', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(781, 'EM Vinicius de Moraes', 'RTMA25-00781', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(782, 'EM Violeta de Mattos Areosa', 'RTMA25-00782', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(783, 'EM Vista Alegre', 'RTMA25-00783', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(784, 'EM Waldir Garcia', 'RTMA25-00784', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(785, 'EM Zilda Arns Neumann', 'RTMA25-00785', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(786, 'Emvicente de Paula', 'RTMA25-00786', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(787, 'Ensino Infantil Cristo Rei', 'RTMA25-00787', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(788, 'Esc Agricola Rainha dos Apostolos', 'RTMA25-00788', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(789, 'Esc de For Prof Enfer Sanitarista Fca Saavedra-Cetam', 'RTMA25-00789', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(790, 'Esc Indig Mul Aru Waimi', 'RTMA25-00790', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(791, 'Esc Indig Mul Kanata T-Ykua', 'RTMA25-00791', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(792, 'Esc Indig Mul Puranga Pisasu', 'RTMA25-00792', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(793, 'Esc Mul Pintor Candido Portinari', 'RTMA25-00793', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(794, 'Esc Mul Sao Jose', 'RTMA25-00794', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(795, 'Esc Particular Albert Sabin', 'RTMA25-00795', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(796, 'Esc Professora Josephina de Mello', 'RTMA25-00796', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(797, 'Esc Sao Jorge', 'RTMA25-00797', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(798, 'Esc0La Gaitano Antonaccio', 'RTMA25-00798', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(799, 'Escola Adventista da Liberdade', 'RTMA25-00799', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(800, 'Escola Adventista de Sao Jorge', 'RTMA25-00800', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(801, 'Escola Ame', 'RTMA25-00801', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(802, 'Escola Batista Arca de Noe', 'RTMA25-00802', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(803, 'Escola Batista Shekinah', 'RTMA25-00803', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(804, 'Escola Caminho do Saber', 'RTMA25-00804', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(805, 'Escola Celus Ltda', 'RTMA25-00805', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(806, 'Escola Contemporanea Galileia', 'RTMA25-00806', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(807, 'Escola de Educacao Basica e Profissional Fundacao Bradesco', 'RTMA25-00807', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(808, 'Escola de Educacao Infantil Piu Piu', 'RTMA25-00808', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(809, 'Escola de Educacao Profissional e Tecnologica Bernardo Ramos Cetam', 'RTMA25-00809', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(810, 'Escola do Futuro - Adcam', 'RTMA25-00810', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(811, 'Escola Ecos Ltda', 'RTMA25-00811', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(812, 'Escola Educacional Amazonida', 'RTMA25-00812', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(813, 'Escola Educacional Trilhando Letras', 'RTMA25-00813', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(814, 'Escola Espirita Allan Kardec - Eeak', 'RTMA25-00814', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(815, 'Escola Espirita Professor Ney Lobo', 'RTMA25-00815', 'Manaus', 'AM', 1, '2026-11-12 03:38:25', '2026-11-12 03:38:25'),
(816, 'Escola Est Tereza de Jesus Azevedo de Vasconcelos Dias', 'RTMA25-00816', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(817, 'Escola Estacio de Educacao Basica Manaus', 'RTMA25-00817', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(818, 'Escola Estadual 1º de Maio', 'RTMA25-00818', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(819, 'Escola Estadual Adalberto Vale', 'RTMA25-00819', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(820, 'Escola Estadual Aderson de Menezes', 'RTMA25-00820', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(821, 'Escola Estadual Agnello Bittencourt', 'RTMA25-00821', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(822, 'Escola Estadual Alfredo Campos', 'RTMA25-00822', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(823, 'Escola Estadual Alfredo Fernandes', 'RTMA25-00823', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(824, 'Escola Estadual Almirante Barroso', 'RTMA25-00824', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(825, 'Escola Estadual Almirante Ernesto Mello Baptista', 'RTMA25-00825', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(826, 'Escola Estadual Altair Severiano Nunes', 'RTMA25-00826', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(827, 'Escola Estadual Amelia Bittencourt Cardinale', 'RTMA25-00827', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(828, 'Escola Estadual Ana Neire Marques da Silva', 'RTMA25-00828', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26');
INSERT INTO `schools` (`id`, `name`, `code`, `city`, `state`, `active`, `created_at`, `updated_at`) VALUES
(829, 'Escola Estadual Angelo Ramazzotti', 'RTMA25-00829', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(830, 'Escola Estadual Antogildo Pascoal Viana', 'RTMA25-00830', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(831, 'Escola Estadual Antonio Bittencourt', 'RTMA25-00831', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(832, 'Escola Estadual Antonio da Encarnacao Filho', 'RTMA25-00832', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(833, 'Escola Estadual Antonio de Lucena Bittencourt', 'RTMA25-00833', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(834, 'Escola Estadual Antonio Nunez Jimenez', 'RTMA25-00834', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(835, 'Escola Estadual Antonio Teles de Souza', 'RTMA25-00835', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(836, 'Escola Estadual Arlindo Vieira dos Santos', 'RTMA25-00836', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(837, 'Escola Estadual Arthur Araujo', 'RTMA25-00837', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(838, 'Escola Estadual Augusto Carneiro dos Santos', 'RTMA25-00838', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(839, 'Escola Estadual Aurea Pinheiro Braga', 'RTMA25-00839', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(840, 'Escola Estadual Ayrton Senna', 'RTMA25-00840', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(841, 'Escola Estadual Balbina Mestrinho', 'RTMA25-00841', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(842, 'Escola Estadual Barao do Rio Branco', 'RTMA25-00842', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(843, 'Escola Estadual Belarmino Marreiro', 'RTMA25-00843', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(844, 'Escola Estadual Benedito Almeida', 'RTMA25-00844', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(845, 'Escola Estadual Benjamin Magalhaes Brandao', 'RTMA25-00845', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(846, 'Escola Estadual Bom Pastor', 'RTMA25-00846', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(847, 'Escola Estadual Brigadeiro Joao Camarao Telles Ribeiro', 'RTMA25-00847', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(848, 'Escola Estadual Cacilda Braule Pinto', 'RTMA25-00848', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(849, 'Escola Estadual Carvalho Leal', 'RTMA25-00849', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(850, 'Escola Estadual Cid Cabral da Silva', 'RTMA25-00850', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(851, 'Escola Estadual Conego Azevedo', 'RTMA25-00851', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(852, 'Escola Estadual Coronel Pedro Camara', 'RTMA25-00852', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(853, 'Escola Estadual D Milton Correa Pereira', 'RTMA25-00853', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(854, 'Escola Estadual de Atendimento Especifico Mayara Redman Abdel Aziz', 'RTMA25-00854', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(855, 'Escola Estadual Dep Josue Claudio de Souza', 'RTMA25-00855', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(856, 'Escola Estadual Desembargador Andre Vidal de Araujo', 'RTMA25-00856', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(857, 'Escola Estadual Diofanto Vieira Monteiro', 'RTMA25-00857', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(858, 'Escola Estadual Dom Jacson Damasceno Rodrigues', 'RTMA25-00858', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(859, 'Escola Estadual Dom Joao de Souza Lima', 'RTMA25-00859', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(860, 'Escola Estadual Dorval Porto', 'RTMA25-00860', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(861, 'Escola Estadual Dr Isaac Sverner', 'RTMA25-00861', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(862, 'Escola Estadual Dr Jose Milton Bandeira', 'RTMA25-00862', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(863, 'Escola Estadual Dra Zilda Arns Neumann', 'RTMA25-00863', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(864, 'Escola Estadual Duque de Caxias', 'RTMA25-00864', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(865, 'Escola Estadual Eliana Socorro Pacheco Braga', 'RTMA25-00865', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(866, 'Escola Estadual Elira Pinheiro', 'RTMA25-00866', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(867, 'Escola Estadual Engº Arthur Amorim', 'RTMA25-00867', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(868, 'Escola Estadual Ernesto Penafort', 'RTMA25-00868', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(869, 'Escola Estadual Ernesto Pinho Filho', 'RTMA25-00869', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(870, 'Escola Estadual Euclydes da Cunha', 'RTMA25-00870', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(871, 'Escola Estadual Farias Britto', 'RTMA25-00871', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(872, 'Escola Estadual Francelina Dantas', 'RTMA25-00872', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(873, 'Escola Estadual Francisca Botinelly Cunha e Silva', 'RTMA25-00873', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(874, 'Escola Estadual Francisca de Paula de Jesus Izabel', 'RTMA25-00874', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(875, 'Escola Estadual Frei Mario Monacelli', 'RTMA25-00875', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(876, 'Escola Estadual Frei Silvio Vagheggi', 'RTMA25-00876', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(877, 'Escola Estadual Fueth Paulo Mourao', 'RTMA25-00877', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(878, 'Escola Estadual General Sampaio', 'RTMA25-00878', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(879, 'Escola Estadual Getulio Vargas', 'RTMA25-00879', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(880, 'Escola Estadual Gilberto Mestrinho', 'RTMA25-00880', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(881, 'Escola Estadual Giovanni Figliuolo', 'RTMA25-00881', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(882, 'Escola Estadual Goncalves Dias', 'RTMA25-00882', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(883, 'Escola Estadual Governador Melo Povoas', 'RTMA25-00883', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(884, 'Escola Estadual Helena Araujo', 'RTMA25-00884', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(885, 'Escola Estadual Herbert Palhano', 'RTMA25-00885', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(886, 'Escola Estadual Hermenegildo de Campos', 'RTMA25-00886', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(887, 'Escola Estadual Homero de Miranda Leao', 'RTMA25-00887', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(888, 'Escola Estadual Humberto de Campos', 'RTMA25-00888', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(889, 'Escola Estadual Inspetora Dulcineia Varela Moura', 'RTMA25-00889', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(890, 'Escola Estadual Irma Adonai Politi', 'RTMA25-00890', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(891, 'Escola Estadual Irma Gabrielle Cogels', 'RTMA25-00891', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(892, 'Escola Estadual Isaac Benayon Sabba', 'RTMA25-00892', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(893, 'Escola Estadual Isaac Benzecry', 'RTMA25-00893', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(894, 'Escola Estadual Itacyara Nogueira Pinho', 'RTMA25-00894', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(895, 'Escola Estadual Izabel Barroncas', 'RTMA25-00895', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(896, 'Escola Estadual J G Araujo', 'RTMA25-00896', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(897, 'Escola Estadual Jairo da Silva Rocha', 'RTMA25-00897', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(898, 'Escola Estadual Joanna Rodrigues Vieira', 'RTMA25-00898', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(899, 'Escola Estadual Joao Bosco Pantoja Evangelista', 'RTMA25-00899', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(900, 'Escola Estadual Jose Bentes Monteiro', 'RTMA25-00900', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(901, 'Escola Estadual Jose Carlos Mestrinho', 'RTMA25-00901', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(902, 'Escola Estadual Josephina de Melo', 'RTMA25-00902', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(903, 'Escola Estadual Julia Bittencourt', 'RTMA25-00903', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(904, 'Escola Estadual Leopoldo Neves', 'RTMA25-00904', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(905, 'Escola Estadual Leticio de Campos Dantas', 'RTMA25-00905', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(906, 'Escola Estadual Liberalina Weill', 'RTMA25-00906', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(907, 'Escola Estadual Lucinda Felix de Azevedo', 'RTMA25-00907', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(908, 'Escola Estadual Luis de Camoes', 'RTMA25-00908', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(909, 'Escola Estadual Luizinha Nascimento', 'RTMA25-00909', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(910, 'Escola Estadual Machado de Assis', 'RTMA25-00910', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(911, 'Escola Estadual Madre Tereza de Calcuta', 'RTMA25-00911', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(912, 'Escola Estadual Major Silva Coutinho', 'RTMA25-00912', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(913, 'Escola Estadual Manoel Marcal de Araujo', 'RTMA25-00913', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(914, 'Escola Estadual Manuel Antonio de Souza', 'RTMA25-00914', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(915, 'Escola Estadual Manuel Rodrigues de Souza', 'RTMA25-00915', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(916, 'Escola Estadual Marcantonio Vilaca', 'RTMA25-00916', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(917, 'Escola Estadual Marcio Nery', 'RTMA25-00917', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(918, 'Escola Estadual Marechal Hermes', 'RTMA25-00918', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(919, 'Escola Estadual Maria Amelia do Espirito Santo', 'RTMA25-00919', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(920, 'Escola Estadual Maria da Luz Calderaro', 'RTMA25-00920', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(921, 'Escola Estadual Maria de Lourdes Rodrigues Arruda', 'RTMA25-00921', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(922, 'Escola Estadual Maria do Céu Vaz Doliveira', 'RTMA25-00922', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(923, 'Escola Estadual Maria Madalena Santana de Lima', 'RTMA25-00923', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(924, 'Escola Estadual Maria Rodrigues Tapajos', 'RTMA25-00924', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(925, 'Escola Estadual Maria Teixeira Goes', 'RTMA25-00925', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(926, 'Escola Estadual Marquez de Santa Cruz', 'RTMA25-00926', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(927, 'Escola Estadual Menino Jesus de Praga', 'RTMA25-00927', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(928, 'Escola Estadual Mestre Otilio', 'RTMA25-00928', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(929, 'Escola Estadual Milburges Araujo', 'RTMA25-00929', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(930, 'Escola Estadual Monteiro de Souza', 'RTMA25-00930', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(931, 'Escola Estadual Nª Sª da Gloria', 'RTMA25-00931', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(932, 'Escola Estadual Nathalia Uchoa', 'RTMA25-00932', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(933, 'Escola Estadual Nossa Senhora Aparecida', 'RTMA25-00933', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(934, 'Escola Estadual Nossa Senhora da Divina Providencia', 'RTMA25-00934', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(935, 'Escola Estadual Nossa Senhora das Gracas', 'RTMA25-00935', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(936, 'Escola Estadual Olavo Bilac', 'RTMA25-00936', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(937, 'Escola Estadual Olga Falcone', 'RTMA25-00937', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(938, 'Escola Estadual Osmar Pedrosa', 'RTMA25-00938', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(939, 'Escola Estadual Padre Agostinho Martin', 'RTMA25-00939', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(940, 'Escola Estadual Padre Luis Ruas', 'RTMA25-00940', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(941, 'Escola Estadual Paula Angela Frassinetti', 'RTMA25-00941', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(942, 'Escola Estadual Pe Pedro Gislandy', 'RTMA25-00942', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(943, 'Escola Estadual Pedro Silvestre', 'RTMA25-00943', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(944, 'Escola Estadual Placido Serrano', 'RTMA25-00944', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(945, 'Escola Estadual Presidente Castelo Branco', 'RTMA25-00945', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(946, 'Escola Estadual Princesa Isabel', 'RTMA25-00946', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(947, 'Escola Estadual Prof Antonio Maurity Monteiro Coelho', 'RTMA25-00947', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(948, 'Escola Estadual Prof Aristoteles Comte de Alencar', 'RTMA25-00948', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(949, 'Escola Estadual Prof Demostenes Belduque Araujo Travessa', 'RTMA25-00949', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(950, 'Escola Estadual Prof Eliana de Freitas Morais', 'RTMA25-00950', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(951, 'Escola Estadual Prof Jorge Karam Neto', 'RTMA25-00951', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(952, 'Escola Estadual Prof Jose Bernardino Lindoso', 'RTMA25-00952', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(953, 'Escola Estadual Prof Jose Ribamar da Costa', 'RTMA25-00953', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(954, 'Escola Estadual Prof Nelson Alves Ferreira', 'RTMA25-00954', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(955, 'Escola Estadual Prof Reinaldo Thompson', 'RTMA25-00955', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(956, 'Escola Estadual Profª Adelaide Tavares de Macedo', 'RTMA25-00956', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(957, 'Escola Estadual Profª Alda Barata', 'RTMA25-00957', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(958, 'Escola Estadual Profa Ana Lucia de Moraes Costa e Silva', 'RTMA25-00958', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(959, 'Escola Estadual Profª Eunice Serrano Telles de Souza', 'RTMA25-00959', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(960, 'Escola Estadual Profa Karla Patricia Barros de Azevedo', 'RTMA25-00960', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(961, 'Escola Estadual Profª Lenina Ferraro da Silva', 'RTMA25-00961', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(962, 'Escola Estadual Profa Leonilia Marinho', 'RTMA25-00962', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(963, 'Escola Estadual Profa Leonor Santiago Mourao', 'RTMA25-00963', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(964, 'Escola Estadual Profa Maria Arminda Guimaraes de Andrade', 'RTMA25-00964', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(965, 'Escola Estadual Profa Myrthes Marques Trigueiro', 'RTMA25-00965', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(966, 'Escola Estadual Profª Ondina de Paula Ribeiro', 'RTMA25-00966', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(967, 'Escola Estadual Profª Ruth Prestes Goncalves', 'RTMA25-00967', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(968, 'Escola Estadual Professor Antenor Sarmento', 'RTMA25-00968', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(969, 'Escola Estadual Professor Benicio Leao', 'RTMA25-00969', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(970, 'Escola Estadual Professor Cleomenes do Carmo Chaves', 'RTMA25-00970', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(971, 'Escola Estadual Professor Djalma da Cunha Batista', 'RTMA25-00971', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(972, 'Escola Estadual Professor Dorval Varela Moura', 'RTMA25-00972', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(973, 'Escola Estadual Professor Ernane Nascimento Simao', 'RTMA25-00973', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(974, 'Escola Estadual Professor Julio Cesar de Moraes Passos', 'RTMA25-00974', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(975, 'Escola Estadual Professor Juracy Batista Gomes', 'RTMA25-00975', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(976, 'Escola Estadual Professor Octavio Mourao', 'RTMA25-00976', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(977, 'Escola Estadual Professor Roberto dos Santos Vieira', 'RTMA25-00977', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(978, 'Escola Estadual Professor Rofran Belchior da Silva', 'RTMA25-00978', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(979, 'Escola Estadual Professor Ruy Alencar', 'RTMA25-00979', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(980, 'Escola Estadual Professor Samuel Benchimol', 'RTMA25-00980', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(981, 'Escola Estadual Professor Sebastiao Augusto Loureiro Filho', 'RTMA25-00981', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(982, 'Escola Estadual Professor Waldocke Fricke de Lyra', 'RTMA25-00982', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(983, 'Escola Estadual Professora Alice Salerno Gomes de Lima', 'RTMA25-00983', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(984, 'Escola Estadual Professora Cecilia Ferreira da Silva', 'RTMA25-00984', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(985, 'Escola Estadual Professora Diana Pinheiro', 'RTMA25-00985', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(986, 'Escola Estadual Professora Haydee Cabral Lyra', 'RTMA25-00986', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(987, 'Escola Estadual Professora Hilda de Azevedo Tribuzy', 'RTMA25-00987', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(988, 'Escola Estadual Professora Jacimar da Silva Gama', 'RTMA25-00988', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(989, 'Escola Estadual Professora Roxana Pereira Bonessi', 'RTMA25-00989', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(990, 'Escola Estadual Professora Sebastiana Braga', 'RTMA25-00990', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(991, 'Escola Estadual Professora Tereza Siqueira Tupinamba', 'RTMA25-00991', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(992, 'Escola Estadual Professora Wilma Vitoriano Geber', 'RTMA25-00992', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(993, 'Escola Estadual Profº Waldir Garcia', 'RTMA25-00993', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(994, 'Escola Estadual Raimunda Holanda de Souza', 'RTMA25-00994', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(995, 'Escola Estadual Raimundo Gomes Nogueira', 'RTMA25-00995', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(996, 'Escola Estadual Raio de Sol', 'RTMA25-00996', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(997, 'Escola Estadual Ribeiro da Cunha', 'RTMA25-00997', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(998, 'Escola Estadual Rilton Leal Filho', 'RTMA25-00998', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(999, 'Escola Estadual Roderick de Castello Branco', 'RTMA25-00999', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1000, 'Escola Estadual Rosina Ferreira da Silva', 'RTMA25-01000', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1001, 'Escola Estadual Ruy Araujo', 'RTMA25-01001', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1002, 'Escola Estadual Samsung Amazonas', 'RTMA25-01002', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1003, 'Escola Estadual Sant Ana', 'RTMA25-01003', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1004, 'Escola Estadual Santa Luzia', 'RTMA25-01004', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1005, 'Escola Estadual Santa Terezinha', 'RTMA25-01005', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1006, 'Escola Estadual Santo Antonio', 'RTMA25-01006', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1007, 'Escola Estadual Sao Luiz de Gonzaga', 'RTMA25-01007', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1008, 'Escola Estadual Sebastiao Noroes', 'RTMA25-01008', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1009, 'Escola Estadual Senador Antovila Mourao Vieira', 'RTMA25-01009', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1010, 'Escola Estadual Senador Cunha Melo', 'RTMA25-01010', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1011, 'Escola Estadual Senador Evandro das Neves Carreira', 'RTMA25-01011', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1012, 'Escola Estadual Senador Flavio da Costa Brito', 'RTMA25-01012', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1013, 'Escola Estadual Senador Jefferson Carpinteiro Peres', 'RTMA25-01013', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1014, 'Escola Estadual Senador Joao Bosco Ramos de Lima', 'RTMA25-01014', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1015, 'Escola Estadual Senador Manuel Severiano Nunes', 'RTMA25-01015', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1016, 'Escola Estadual Senador Petronio Portella', 'RTMA25-01016', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1017, 'Escola Estadual Simon Bolivar', 'RTMA25-01017', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1018, 'Escola Estadual Solon de Lucena', 'RTMA25-01018', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1019, 'Escola Estadual Ten Coronel Candido Jose Mariano', 'RTMA25-01019', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1020, 'Escola Estadual Terezinha Almeida da Silva', 'RTMA25-01020', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1021, 'Escola Estadual Thome de Medeiros Raposo', 'RTMA25-01021', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1022, 'Escola Estadual Tiradentes', 'RTMA25-01022', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1023, 'Escola Estadual Vasco Vasques', 'RTMA25-01023', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1024, 'Escola Estadual Vicente Schettini', 'RTMA25-01024', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1025, 'Escola Estadual Vicente Telles', 'RTMA25-01025', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1026, 'Escola Estadual Waldemiro Peres Lustoza', 'RTMA25-01026', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1027, 'Escola Estadual Zulmira Bittencourt', 'RTMA25-01027', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1028, 'Escola Evangelica Betel', 'RTMA25-01028', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1029, 'Escola Horizonte do Saber', 'RTMA25-01029', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1030, 'Escola Infantil Ateniese', 'RTMA25-01030', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1031, 'Escola Infantil Luz do Saber', 'RTMA25-01031', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1032, 'Escola Infantil o Pequeno Polegar', 'RTMA25-01032', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1033, 'Escola Infantil Passos para o Aprendizado', 'RTMA25-01033', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1034, 'Escola Infantil Pequeno Céu', 'RTMA25-01034', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1035, 'Escola Internacional do Amazonas Ltda', 'RTMA25-01035', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1036, 'Escola Lapis na Mao Ltda', 'RTMA25-01036', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1037, 'Escola Luminova', 'RTMA25-01037', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1038, 'Escola Mamae Margarida', 'RTMA25-01038', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1039, 'Escola Nilton Lins Japiim', 'RTMA25-01039', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1040, 'Escola Nossa Senhora da Esperanca', 'RTMA25-01040', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1041, 'Escola Rainha dos Apostolos Dois', 'RTMA25-01041', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1042, 'Escola Renascer', 'RTMA25-01042', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1043, 'Escola Santa Maria Mazzarello', 'RTMA25-01043', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1044, 'Escola SENAI Acoes Moveis e Comunitarias', 'RTMA25-01044', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1045, 'Escola SENAI Antonio Simoes', 'RTMA25-01045', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1046, 'Escola SENAI Demostenes Travessa', 'RTMA25-01046', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1047, 'Escola SENAI Waldemiro Lustoza', 'RTMA25-01047', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1048, 'Escola SESI Dr Francisco Garcia', 'RTMA25-01048', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1049, 'Escola SESI Dra Emina Barbosa Mustafa', 'RTMA25-01049', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1050, 'Escola SESI Dra Emina Barbosa Mustufa', 'RTMA25-01050', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1051, 'Escola Tecnica do Norte', 'RTMA25-01051', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1052, 'Escola Tecnologica Desembargador Paulo Feitoza-Etech', 'RTMA25-01052', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1053, 'Escolas Idaam', 'RTMA25-01053', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1054, 'Escolas Idaam', 'RTMA25-01054', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1055, 'Escolas Idaam', 'RTMA25-01055', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1056, 'Escolas Idaam', 'RTMA25-01056', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1057, 'Escolas Idaam', 'RTMA25-01057', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1058, 'Escolas Idaam', 'RTMA25-01058', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1059, 'Escolas Nilton Lins', 'RTMA25-01059', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1060, 'Escolinha Lapis de Cor', 'RTMA25-01060', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1061, 'Escolinha Maria Imaculada', 'RTMA25-01061', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1062, 'Escolinha Peixinho Dourado', 'RTMA25-01062', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1063, 'Escolinha Sonho Infantil Ltda', 'RTMA25-01063', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1064, 'Fametrotec Educacao Profissional Ltda', 'RTMA25-01064', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1065, 'Fundacao Matias Machline', 'RTMA25-01065', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1066, 'Fundacao Rede Amazonica', 'RTMA25-01066', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1067, 'Giga Instituto Educacional', 'RTMA25-01067', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1068, 'Grau Tecnico-Manaus Centro', 'RTMA25-01068', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1069, 'Ifam - Campus Manaus Centro', 'RTMA25-01069', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1070, 'Ifam - Campus Manaus Distrito Industrial', 'RTMA25-01070', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1071, 'Ifam - Campus Manaus Zona Leste', 'RTMA25-01071', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1072, 'Instituicao de Educacao Infantil Fonte do Saber', 'RTMA25-01072', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1073, 'Instituicoes Educacionais Nelly Falco de Souza - Ltda', 'RTMA25-01073', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1074, 'Instituto Adventista de Manaus', 'RTMA25-01074', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1075, 'Instituto Antonio Machado', 'RTMA25-01075', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1076, 'Instituto Aperfeicoamento e Ensino Superior do Amazonas - Centec - Centro de Ensino Tecnico', 'RTMA25-01076', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1077, 'Instituto Batista do Amazonas', 'RTMA25-01077', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1078, 'Instituto Batista Educacional Ester', 'RTMA25-01078', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1079, 'Instituto Batista Sara', 'RTMA25-01079', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1080, 'Instituto Benjamin Constant - Cetam', 'RTMA25-01080', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1081, 'Instituto Brasileiro de Educacao Ester', 'RTMA25-01081', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1082, 'Instituto de Educacao Boas Novas', 'RTMA25-01082', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1083, 'Instituto de Educacao da Crianca - Iec', 'RTMA25-01083', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1084, 'Instituto de Educacao Diamante Ltda', 'RTMA25-01084', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1085, 'Instituto de Educacao do Amazonas', 'RTMA25-01085', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1086, 'Instituto de Educacao El Shaday', 'RTMA25-01086', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1087, 'Instituto de Educacao Joias de Cristo', 'RTMA25-01087', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1088, 'Instituto de Educacao Leao de Juda', 'RTMA25-01088', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1089, 'Instituto de Educacao Plantium Tecnica Ltda', 'RTMA25-01089', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1090, 'Instituto de Educacao Prof Denizard Rivail', 'RTMA25-01090', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1091, 'Instituto de Educacao Prof Guadalupe Santos', 'RTMA25-01091', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1092, 'Instituto de Educacao Prof Marchelli de Almeida Crispim - Iemac', 'RTMA25-01092', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1093, 'Instituto Educacional Aldemir de Souza Reis', 'RTMA25-01093', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1094, 'Instituto Educacional Filhos da Promessa', 'RTMA25-01094', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1095, 'Instituto Educacional Kellen Menezes', 'RTMA25-01095', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1096, 'Instituto Educacional Renascer', 'RTMA25-01096', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1097, 'Instituto Educacional Renata Castro', 'RTMA25-01097', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1098, 'Instituto Educacional Rubens Ribeiro', 'RTMA25-01098', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1099, 'Instituto Ensino Thiago Brandao de Oliveira', 'RTMA25-01099', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1100, 'Instituto Filippo Smaldone', 'RTMA25-01100', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1101, 'Instituto Hilda Ferreira', 'RTMA25-01101', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1102, 'Instituto Ivap-Tec Cursos Tecnicos e Qualificacao Profissional', 'RTMA25-01102', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1103, 'Instituto Omega de Educacao do Amazonas', 'RTMA25-01103', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1104, 'Instituto Politecnico Denizard Rivail Ltda', 'RTMA25-01104', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1105, 'Jardim da Infancia Casa da Crianca', 'RTMA25-01105', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1106, 'Jardim da Infancia Palhoca do Popeye', 'RTMA25-01106', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1107, 'Jd da Infancia Irma Cleusa Coelho', 'RTMA25-01107', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1108, 'Lato Sensu IV', 'RTMA25-01108', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1109, 'Laviniense Ensino Integrado e CE Pingo de Gente', 'RTMA25-01109', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1110, 'Maple Bear Canadian School Manaus', 'RTMA25-01110', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1111, 'Materdei Administradora Educacional Ltda', 'RTMA25-01111', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1112, 'Pinocchio Centro Educacional Ltda', 'RTMA25-01112', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1113, 'Pousada Infantil Aconchego', 'RTMA25-01113', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1114, 'Pre-Escolar Infante Tiradentes Petropolis', 'RTMA25-01114', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1115, 'Pre-Escolar Marilia Barbosa', 'RTMA25-01115', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1116, 'Servico Nacional de Aprendizagem do Transporte - Sestsenat', 'RTMA25-01116', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1117, 'SESC Fransico Garcia Marques', 'RTMA25-01117', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1118, 'Singular Educacional', 'RTMA25-01118', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1119, 'Sociedade de Assistencia Materno Infantil Bebe Bombom Ltda', 'RTMA25-01119', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1120, 'Vida Educar', 'RTMA25-01120', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1121, 'Yupi Centro de Educacao Infantil', 'RTMA25-01121', 'Manaus', 'AM', 1, '2026-11-12 03:38:26', '2026-11-12 03:38:26'),
(1122, 'Escola Modelo Horizonte Digital', 'RTDEMO26-A', 'Manaus', 'AM', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(1123, 'Colégio Experimental Nova Aurora', 'RTDEMO26-B', 'Manaus', 'AM', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(1124, 'Centro Educacional Futuro Tech', 'RTDEMO26-C', 'Manaus', 'AM', 1, '2026-11-12 04:12:21', '2026-11-12 04:12:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `stage_progress`
--

CREATE TABLE `stage_progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `enrollment_id` bigint(20) UNSIGNED NOT NULL,
  `path_stage_id` bigint(20) UNSIGNED NOT NULL,
  `answer` text DEFAULT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `stage_progress`
--

INSERT INTO `stage_progress` (`id`, `enrollment_id`, `path_stage_id`, `answer`, `attempts`, `completed_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '0', 1, '2026-11-02 13:20:00', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(2, 1, 2, '1', 1, '2026-11-02 13:20:00', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(3, 1, 3, '0', 1, '2026-11-02 13:20:00', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(4, 1, 4, '2', 1, '2026-11-02 13:20:00', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(5, 1, 5, 'Nesta missão, proponho um projeto coletivo e acessível para melhorar a aprendizagem na escola, com testes e revisão de resultados.', 1, '2026-11-02 13:20:00', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(6, 1, 6, '0', 1, '2026-11-02 13:20:00', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(7, 2, 7, '0', 1, '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(8, 2, 8, '1', 1, '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(9, 2, 9, '2', 1, '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(10, 2, 10, '0', 1, '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(11, 2, 11, 'Nesta missão, proponho um projeto coletivo e acessível para melhorar a aprendizagem na escola, com testes e revisão de resultados.', 1, '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(12, 2, 12, '1', 1, '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(13, 3, 13, '1', 1, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(14, 3, 14, '0', 1, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(15, 3, 15, '1', 1, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(16, 3, 16, '2', 1, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(17, 3, 17, 'Nesta missão, proponho um projeto coletivo e acessível para melhorar a aprendizagem na escola, com testes e revisão de resultados.', 1, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(18, 3, 18, '0', 1, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(19, 4, 19, '0', 1, '2026-11-05 13:20:00', '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(20, 4, 20, '1', 1, '2026-11-05 13:20:00', '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(21, 4, 21, '0', 1, '2026-11-05 13:20:00', '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(22, 4, 22, '1', 1, '2026-11-05 13:20:00', '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(23, 4, 23, 'Nesta missão, proponho um projeto coletivo e acessível para melhorar a aprendizagem na escola, com testes e revisão de resultados.', 1, '2026-11-05 13:20:00', '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(24, 4, 24, '0', 1, '2026-11-05 13:20:00', '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(25, 5, 25, '0', 1, '2026-11-06 13:20:00', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(26, 5, 26, '1', 1, '2026-11-06 13:20:00', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(27, 5, 27, '0', 1, '2026-11-06 13:20:00', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(28, 5, 28, '1', 1, '2026-11-06 13:20:00', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(29, 5, 29, 'Nesta missão, proponho um projeto coletivo e acessível para melhorar a aprendizagem na escola, com testes e revisão de resultados.', 1, '2026-11-06 13:20:00', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(30, 5, 30, '0', 1, '2026-11-06 13:20:00', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(31, 6, 31, '0', 1, '2026-11-07 13:20:00', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(32, 6, 32, '0', 1, '2026-11-07 13:20:00', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(33, 6, 33, '0', 1, '2026-11-07 13:20:00', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(34, 6, 34, '0', 1, '2026-11-07 13:20:00', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(35, 6, 35, 'Nesta missão, proponho um projeto coletivo e acessível para melhorar a aprendizagem na escola, com testes e revisão de resultados.', 1, '2026-11-07 13:20:00', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(36, 6, 36, '0', 1, '2026-11-07 13:20:00', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(37, 7, 1, '0', 1, '2026-11-08 13:20:00', '2026-11-08 13:20:00', '2026-11-08 13:20:00'),
(38, 8, 7, '0', 1, '2026-11-09 13:20:00', '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(39, 8, 8, '1', 1, '2026-11-09 13:20:00', '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(40, 9, 13, '1', 1, '2026-11-02 13:20:00', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(41, 9, 14, '0', 1, '2026-11-02 13:20:00', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(42, 9, 15, '1', 1, '2026-11-02 13:20:00', '2026-11-02 13:20:00', '2026-11-02 13:20:00'),
(43, 10, 19, '0', 1, '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(44, 10, 20, '1', 1, '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(45, 10, 21, '0', 1, '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(46, 10, 22, '1', 1, '2026-11-03 13:20:00', '2026-11-03 13:20:00', '2026-11-03 13:20:00'),
(47, 11, 25, '0', 1, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(48, 11, 26, '1', 1, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(49, 11, 27, '0', 1, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(50, 11, 28, '1', 1, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(51, 11, 29, 'Nesta missão, proponho um projeto coletivo e acessível para melhorar a aprendizagem na escola, com testes e revisão de resultados.', 1, '2026-11-04 13:20:00', '2026-11-04 13:20:00', '2026-11-04 13:20:00'),
(52, 12, 31, '0', 1, '2026-11-05 13:20:00', '2026-11-05 13:20:00', '2026-11-05 13:20:00'),
(53, 13, 1, '0', 1, '2026-11-06 13:20:00', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(54, 13, 2, '1', 1, '2026-11-06 13:20:00', '2026-11-06 13:20:00', '2026-11-06 13:20:00'),
(55, 14, 7, '0', 1, '2026-11-07 13:20:00', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(56, 14, 8, '1', 1, '2026-11-07 13:20:00', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(57, 14, 9, '2', 1, '2026-11-07 13:20:00', '2026-11-07 13:20:00', '2026-11-07 13:20:00'),
(58, 15, 13, '1', 1, '2026-11-08 13:20:00', '2026-11-08 13:20:00', '2026-11-08 13:20:00'),
(59, 15, 14, '0', 1, '2026-11-08 13:20:00', '2026-11-08 13:20:00', '2026-11-08 13:20:00'),
(60, 15, 15, '1', 1, '2026-11-08 13:20:00', '2026-11-08 13:20:00', '2026-11-08 13:20:00'),
(61, 15, 16, '2', 1, '2026-11-08 13:20:00', '2026-11-08 13:20:00', '2026-11-08 13:20:00'),
(62, 16, 19, '0', 1, '2026-11-09 13:20:00', '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(63, 16, 20, '1', 1, '2026-11-09 13:20:00', '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(64, 16, 21, '0', 1, '2026-11-09 13:20:00', '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(65, 16, 22, '1', 1, '2026-11-09 13:20:00', '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(66, 16, 23, 'Nesta missão, proponho um projeto coletivo e acessível para melhorar a aprendizagem na escola, com testes e revisão de resultados.', 1, '2026-11-09 13:20:00', '2026-11-09 13:20:00', '2026-11-09 13:20:00'),
(68, 25, 13, '1', 1, '2026-11-12 03:16:01', '2026-11-12 03:16:01', '2026-11-12 03:16:01'),
(73, 25, 14, '0', 1, '2026-11-12 03:16:20', '2026-11-12 03:16:20', '2026-11-12 03:16:20'),
(75, 25, 15, '1', 1, '2026-11-12 03:16:30', '2026-11-12 03:16:30', '2026-11-12 03:16:30'),
(77, 25, 16, '2', 1, '2026-11-12 03:16:37', '2026-11-12 03:16:37', '2026-11-12 03:16:37'),
(78, 25, 17, 'asdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasdsasdasdasdasdasds', 1, '2026-11-12 03:16:50', '2026-11-12 03:16:50', '2026-11-12 03:16:50'),
(79, 25, 18, '0', 1, '2026-11-12 03:16:56', '2026-11-12 03:16:56', '2026-11-12 03:16:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_id` bigint(20) UNSIGNED DEFAULT NULL,
  `classroom_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('student','teacher','admin') NOT NULL DEFAULT 'student',
  `xp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `school_id`, `classroom_id`, `name`, `email`, `email_verified_at`, `password`, `role`, `xp`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 983, NULL, 'isaque', 'isaque@gmail.com', NULL, '$2y$12$AEkfvAu.78dK8zwYCRuER.8FNkD2W6sysZu83VE8FZ9L.8TEuA/pK', 'student', 520, 1, NULL, '2026-11-12 02:41:20', '2026-11-12 03:16:56'),
(2, NULL, NULL, 'Marina Supervisora Demo', 'admin01@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'admin', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(3, NULL, NULL, 'Roberto Gestor Demo', 'admin02@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'admin', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(4, 1122, NULL, 'Cecília Educadora Demo', 'professor01@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'teacher', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(5, 1122, NULL, 'Daniel Educador Demo', 'professor02@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'teacher', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(6, 1123, NULL, 'Luana Docente Demo', 'professor03@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'teacher', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(7, 1124, NULL, 'Tiago Tutor Demo', 'professor04@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'teacher', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(8, 1122, 1, 'Alice Martins (Demo)', 'aluno01@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 520, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(9, 1122, 1, 'Bruno Cardoso (Demo)', 'aluno02@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 520, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(10, 1122, 1, 'Clara Dias (Demo)', 'aluno03@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 520, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(11, 1122, 1, 'Diego Ferreira (Demo)', 'aluno04@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 520, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(12, 1122, 1, 'Elisa Castro (Demo)', 'aluno05@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 520, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(13, 1122, 1, 'Felipe Nunes (Demo)', 'aluno06@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 520, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(14, 1122, 2, 'Gabriela Lima (Demo)', 'aluno07@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 180, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(15, 1122, 2, 'Henrique Tavares (Demo)', 'aluno08@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 240, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(16, 1122, 2, 'Isabela Freitas (Demo)', 'aluno09@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 300, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(17, 1122, 2, 'João Pereira (Demo)', 'aluno10@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 360, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(18, 1122, 2, 'Kamila Azevedo (Demo)', 'aluno11@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 460, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(19, 1122, 2, 'Lucas Barbosa (Demo)', 'aluno12@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 180, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(20, 1123, 3, 'Mariana Duarte (Demo)', 'aluno13@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 120, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(21, 1123, 3, 'Nicolas Sales (Demo)', 'aluno14@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 180, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(22, 1123, 3, 'Olívia Monteiro (Demo)', 'aluno15@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 240, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(23, 1123, 3, 'Pedro Rocha (Demo)', 'aluno16@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 340, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(24, 1123, 3, 'Queila Farias (Demo)', 'aluno17@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(25, 1123, 3, 'Rafael Araujo (Demo)', 'aluno18@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(26, 1123, 4, 'Sofia Mendes (Demo)', 'aluno19@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(27, 1123, 4, 'Thiago Almeida (Demo)', 'aluno20@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(28, 1123, 4, 'Úrsula Teixeira (Demo)', 'aluno21@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(29, 1123, 4, 'Vinícius Oliveira (Demo)', 'aluno22@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(30, 1123, 4, 'Wesley Sousa (Demo)', 'aluno23@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(31, 1123, 4, 'Yasmin Vieira (Demo)', 'aluno24@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(32, 1124, 5, 'Ana Beatriz Costa (Demo)', 'aluno25@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(33, 1124, 5, 'Caio Santos (Demo)', 'aluno26@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(34, 1124, 5, 'Débora Lopes (Demo)', 'aluno27@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(35, 1124, 5, 'Eduardo Gomes (Demo)', 'aluno28@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(36, 1124, 5, 'Fernanda Silva (Demo)', 'aluno29@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(37, 1124, 5, 'Gustavo Carvalho (Demo)', 'aluno30@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(38, 1124, 6, 'Helena Ribeiro (Demo)', 'aluno31@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(39, 1124, 6, 'Igor Macedo (Demo)', 'aluno32@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(40, 1124, 6, 'Júlia Campos (Demo)', 'aluno33@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(41, 1124, 6, 'Kevin Fernandes (Demo)', 'aluno34@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(42, 1124, 6, 'Letícia Braga (Demo)', 'aluno35@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21'),
(43, 1124, 6, 'Miguel Souza (Demo)', 'aluno36@demo.rotateste.local', '2026-11-12 04:12:21', '$2y$12$5OZicLUr8d4SYZGvvC9CauRg.5btNsi4yQZkAH/jaA6pzGtm4JZma', 'student', 0, 1, NULL, '2026-11-12 04:12:21', '2026-11-12 04:12:21');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `career_answers`
--
ALTER TABLE `career_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_answers_question` (`career_question_id`);

--
-- Índices de tabela `career_attempts`
--
ALTER TABLE `career_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_attempt_user_status` (`user_id`,`status`),
  ADD KEY `fk_attempt_result` (`result_career_id`);

--
-- Índices de tabela `career_profiles`
--
ALTER TABLE `career_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Índices de tabela `career_questions`
--
ALTER TABLE `career_questions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `position` (`position`);

--
-- Índices de tabela `career_responses`
--
ALTER TABLE `career_responses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_answer_per_attempt` (`career_attempt_id`,`career_question_id`),
  ADD KEY `ix_responses_question` (`career_question_id`),
  ADD KEY `ix_responses_answer` (`career_answer_id`);

--
-- Índices de tabela `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `enrollment_id` (`enrollment_id`),
  ADD UNIQUE KEY `verification_code` (`verification_code`),
  ADD KEY `ix_certificate_user` (`user_id`);

--
-- Índices de tabela `classrooms`
--
ALTER TABLE `classrooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_school_class_year` (`school_id`,`name`,`school_year`);

--
-- Índices de tabela `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_enrollment` (`user_id`,`learning_path_id`),
  ADD KEY `ix_enrollment_path` (`learning_path_id`);

--
-- Índices de tabela `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_feedback` (`user_id`,`learning_path_id`),
  ADD KEY `ix_feedback_path` (`learning_path_id`);

--
-- Índices de tabela `learning_paths`
--
ALTER TABLE `learning_paths`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `ix_paths_career` (`career_profile_id`),
  ADD KEY `ix_paths_school` (`school_id`);

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices de tabela `path_stages`
--
ALTER TABLE `path_stages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_path_stage_order` (`learning_path_id`,`position`);

--
-- Índices de tabela `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Índices de tabela `stage_progress`
--
ALTER TABLE `stage_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_stage_progress` (`enrollment_id`,`path_stage_id`),
  ADD KEY `ix_progress_stage` (`path_stage_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `ix_user_school_role` (`school_id`,`role`),
  ADD KEY `fk_users_classroom` (`classroom_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `career_answers`
--
ALTER TABLE `career_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `career_attempts`
--
ALTER TABLE `career_attempts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `career_profiles`
--
ALTER TABLE `career_profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `career_questions`
--
ALTER TABLE `career_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `career_responses`
--
ALTER TABLE `career_responses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT de tabela `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `classrooms`
--
ALTER TABLE `classrooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `learning_paths`
--
ALTER TABLE `learning_paths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `path_stages`
--
ALTER TABLE `path_stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1125;

--
-- AUTO_INCREMENT de tabela `stage_progress`
--
ALTER TABLE `stage_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `career_answers`
--
ALTER TABLE `career_answers`
  ADD CONSTRAINT `fk_answers_question` FOREIGN KEY (`career_question_id`) REFERENCES `career_questions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `career_attempts`
--
ALTER TABLE `career_attempts`
  ADD CONSTRAINT `fk_attempt_result` FOREIGN KEY (`result_career_id`) REFERENCES `career_profiles` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_attempt_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `career_responses`
--
ALTER TABLE `career_responses`
  ADD CONSTRAINT `fk_response_answer` FOREIGN KEY (`career_answer_id`) REFERENCES `career_answers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_response_attempt` FOREIGN KEY (`career_attempt_id`) REFERENCES `career_attempts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_response_question` FOREIGN KEY (`career_question_id`) REFERENCES `career_questions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `fk_cert_enrollment` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_cert_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `classrooms`
--
ALTER TABLE `classrooms`
  ADD CONSTRAINT `fk_classrooms_school` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `fk_enrollment_path` FOREIGN KEY (`learning_path_id`) REFERENCES `learning_paths` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_enrollment_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `fk_feedback_path` FOREIGN KEY (`learning_path_id`) REFERENCES `learning_paths` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_feedback_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `learning_paths`
--
ALTER TABLE `learning_paths`
  ADD CONSTRAINT `fk_paths_career` FOREIGN KEY (`career_profile_id`) REFERENCES `career_profiles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_paths_school` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `path_stages`
--
ALTER TABLE `path_stages`
  ADD CONSTRAINT `fk_stages_path` FOREIGN KEY (`learning_path_id`) REFERENCES `learning_paths` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `stage_progress`
--
ALTER TABLE `stage_progress`
  ADD CONSTRAINT `fk_progress_enrollment` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_progress_stage` FOREIGN KEY (`path_stage_id`) REFERENCES `path_stages` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_classroom` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_users_school` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
