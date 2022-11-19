-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 16 nov. 2022 à 22:21
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `materiel_informatique`
--

-- --------------------------------------------------------

--
-- Structure de la table `contrat_maintenence`
--

CREATE TABLE `contrat_maintenence` (
  `ID` int(11) NOT NULL,
  `NUMERO` int(11) NOT NULL,
  `MONTANT` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `PRENOM` varchar(50) NOT NULL,
  `MATRICULE` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `employe_materile`
--

CREATE TABLE `employe_materile` (
  `ID_EMPLOYE` int(11) NOT NULL,
  `ID_MATERIEL` int(11) NOT NULL,
  `NB_HEURES` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE `materiel` (
  `ID` int(11) NOT NULL,
  `NUM_INVENTAIRE` int(11) NOT NULL,
  `DESIGNATION` varchar(150) NOT NULL,
  `DATE_ACHAT` date NOT NULL,
  `PRIX_ACHAT` decimal(10,0) NOT NULL,
  `ID_CONTRAT_MAINTENENCE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `contrat_maintenence`
--
ALTER TABLE `contrat_maintenence`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `MATRICUL` (`MATRICULE`);

--
-- Index pour la table `employe_materile`
--
ALTER TABLE `employe_materile`
  ADD KEY `ID_EMPLOYE` (`ID_EMPLOYE`),
  ADD KEY `ID_MATERIEL` (`ID_MATERIEL`);

--
-- Index pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NUM_INVENTAIRE` (`NUM_INVENTAIRE`),
  ADD KEY `ID_CONTRAT_MAINTENENCE` (`ID_CONTRAT_MAINTENENCE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `contrat_maintenence`
--
ALTER TABLE `contrat_maintenence`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `materiel`
--
ALTER TABLE `materiel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `employe_materile`
--
ALTER TABLE `employe_materile`
  ADD CONSTRAINT `employe_materile_ibfk_1` FOREIGN KEY (`ID_EMPLOYE`) REFERENCES `employe` (`ID`),
  ADD CONSTRAINT `employe_materile_ibfk_2` FOREIGN KEY (`ID_MATERIEL`) REFERENCES `materiel` (`ID`);

--
-- Contraintes pour la table `materiel`
--
ALTER TABLE `materiel`
  ADD CONSTRAINT `materiel_ibfk_1` FOREIGN KEY (`ID_CONTRAT_MAINTENENCE`) REFERENCES `contrat_maintenence` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
