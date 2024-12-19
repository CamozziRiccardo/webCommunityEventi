-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Dic 19, 2024 alle 08:20
-- Versione del server: 8.0.32
-- Versione PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_interfacciatmdb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `wce_artista`
--

CREATE TABLE `wce_artista` (
  `ID_artista` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `genere` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `descrizione` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wce_categoria`
--

CREATE TABLE `wce_categoria` (
  `ID_categoria` int NOT NULL,
  `nome_cat` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wce_commentano`
--

CREATE TABLE `wce_commentano` (
  `ID_user` int NOT NULL,
  `ID_comm` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wce_commento`
--

CREATE TABLE `wce_commento` (
  `ID_comm` int NOT NULL,
  `testo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `data` date NOT NULL,
  `voto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wce_esibizione`
--

CREATE TABLE `wce_esibizione` (
  `ID_evento` int NOT NULL,
  `ID_artista` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wce_eventi`
--

CREATE TABLE `wce_eventi` (
  `ID_evento` int NOT NULL,
  `ID_categoria` int NOT NULL,
  `ID_luogo` int NOT NULL,
  `titolo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wce_interessi`
--

CREATE TABLE `wce_interessi` (
  `ID_user` int NOT NULL,
  `ID_categoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wce_luogo`
--

CREATE TABLE `wce_luogo` (
  `ID_luogo` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `indirizzo` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `città` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wce_partecipazione`
--

CREATE TABLE `wce_partecipazione` (
  `ID_utente` int NOT NULL,
  `ID_evento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `wce_utenti`
--

CREATE TABLE `wce_utenti` (
  `ID_user` int NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `cognome` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `newsletter` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `wce_artista`
--
ALTER TABLE `wce_artista`
  ADD PRIMARY KEY (`ID_artista`);

--
-- Indici per le tabelle `wce_categoria`
--
ALTER TABLE `wce_categoria`
  ADD PRIMARY KEY (`ID_categoria`);

--
-- Indici per le tabelle `wce_commentano`
--
ALTER TABLE `wce_commentano`
  ADD PRIMARY KEY (`ID_user`,`ID_comm`),
  ADD KEY `ibfk_commento` (`ID_comm`);

--
-- Indici per le tabelle `wce_commento`
--
ALTER TABLE `wce_commento`
  ADD PRIMARY KEY (`ID_comm`);

--
-- Indici per le tabelle `wce_esibizione`
--
ALTER TABLE `wce_esibizione`
  ADD PRIMARY KEY (`ID_evento`,`ID_artista`),
  ADD KEY `ibfk_artista` (`ID_artista`);

--
-- Indici per le tabelle `wce_eventi`
--
ALTER TABLE `wce_eventi`
  ADD PRIMARY KEY (`ID_evento`),
  ADD KEY `ibfk_luogo` (`ID_luogo`),
  ADD KEY `ibfk_cat` (`ID_categoria`);

--
-- Indici per le tabelle `wce_interessi`
--
ALTER TABLE `wce_interessi`
  ADD PRIMARY KEY (`ID_user`,`ID_categoria`),
  ADD KEY `ibfk_cat2` (`ID_categoria`);

--
-- Indici per le tabelle `wce_luogo`
--
ALTER TABLE `wce_luogo`
  ADD PRIMARY KEY (`ID_luogo`);

--
-- Indici per le tabelle `wce_partecipazione`
--
ALTER TABLE `wce_partecipazione`
  ADD PRIMARY KEY (`ID_utente`,`ID_evento`),
  ADD KEY `ibfk_evento2` (`ID_evento`);

--
-- Indici per le tabelle `wce_utenti`
--
ALTER TABLE `wce_utenti`
  ADD PRIMARY KEY (`ID_user`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `wce_artista`
--
ALTER TABLE `wce_artista`
  MODIFY `ID_artista` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `wce_categoria`
--
ALTER TABLE `wce_categoria`
  MODIFY `ID_categoria` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `wce_commento`
--
ALTER TABLE `wce_commento`
  MODIFY `ID_comm` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `wce_eventi`
--
ALTER TABLE `wce_eventi`
  MODIFY `ID_evento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `wce_luogo`
--
ALTER TABLE `wce_luogo`
  MODIFY `ID_luogo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `wce_utenti`
--
ALTER TABLE `wce_utenti`
  MODIFY `ID_user` int NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `wce_commentano`
--
ALTER TABLE `wce_commentano`
  ADD CONSTRAINT `ibfk_commento` FOREIGN KEY (`ID_comm`) REFERENCES `wce_commento` (`ID_comm`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ibfk_utente2` FOREIGN KEY (`ID_user`) REFERENCES `wce_utenti` (`ID_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `wce_commento`
--
ALTER TABLE `wce_commento`
  ADD CONSTRAINT `ibfk_comm` FOREIGN KEY (`ID_comm`) REFERENCES `wce_eventi` (`ID_evento`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `wce_esibizione`
--
ALTER TABLE `wce_esibizione`
  ADD CONSTRAINT `ibfk_artista` FOREIGN KEY (`ID_artista`) REFERENCES `wce_artista` (`ID_artista`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ibfk_evento` FOREIGN KEY (`ID_evento`) REFERENCES `wce_eventi` (`ID_evento`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `wce_eventi`
--
ALTER TABLE `wce_eventi`
  ADD CONSTRAINT `ibfk_cat` FOREIGN KEY (`ID_categoria`) REFERENCES `wce_categoria` (`ID_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ibfk_created_by_user` FOREIGN KEY (`ID_evento`) REFERENCES `wce_utenti` (`ID_user`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ibfk_luogo` FOREIGN KEY (`ID_luogo`) REFERENCES `wce_luogo` (`ID_luogo`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `wce_interessi`
--
ALTER TABLE `wce_interessi`
  ADD CONSTRAINT `ibfk_cat2` FOREIGN KEY (`ID_categoria`) REFERENCES `wce_categoria` (`ID_categoria`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ibfk_utente3` FOREIGN KEY (`ID_user`) REFERENCES `wce_utenti` (`ID_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limiti per la tabella `wce_partecipazione`
--
ALTER TABLE `wce_partecipazione`
  ADD CONSTRAINT `ibfk_evento2` FOREIGN KEY (`ID_evento`) REFERENCES `wce_eventi` (`ID_evento`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ibfk_utente` FOREIGN KEY (`ID_utente`) REFERENCES `wce_utenti` (`ID_user`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
