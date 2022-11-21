-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 19 nov. 2022 à 21:47
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
-- Base de données : `fabrication`
--

-- --------------------------------------------------------

--
-- Structure de la table `continent`
--

CREATE TABLE `continent` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `distribution`
--

CREATE TABLE `distribution` (
  `ID_PRODUIT` int(11) NOT NULL,
  `ID_PAYS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `enterprise`
--

CREATE TABLE `enterprise` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `CORDONNES` varchar(100) NOT NULL,
  `ID_PAYS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `ID_CONTINENT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `ID` int(11) NOT NULL,
  `NUMERO` int(11) NOT NULL,
  `DESIGNATION` varchar(50) NOT NULL,
  `ID_PAYS_FABRICATION` int(10) NOT NULL,
  `ID_ENTREPRISE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `continent`
--
ALTER TABLE `continent`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `distribution`
--
ALTER TABLE `distribution`
  ADD KEY `ID_PRODUIT` (`ID_PRODUIT`),
  ADD KEY `ID_PAYS` (`ID_PAYS`);

--
-- Index pour la table `enterprise`
--
ALTER TABLE `enterprise`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PAYS` (`ID_PAYS`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_CONT` (`ID_CONTINENT`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `NUMERO` (`NUMERO`),
  ADD KEY `PAYS_FAB` (`ID_PAYS_FABRICATION`),
  ADD KEY `ID_ENTREPRISE` (`ID_ENTREPRISE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `continent`
--
ALTER TABLE `continent`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `enterprise`
--
ALTER TABLE `enterprise`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `distribution`
--
ALTER TABLE `distribution`
  ADD CONSTRAINT `ID_PAYS` FOREIGN KEY (`ID_PAYS`) REFERENCES `pays` (`ID`),
  ADD CONSTRAINT `ID_PRODUIT` FOREIGN KEY (`ID_PRODUIT`) REFERENCES `produit` (`ID`);

--
-- Contraintes pour la table `enterprise`
--
ALTER TABLE `enterprise`
  ADD CONSTRAINT `enterprise_ibfk_1` FOREIGN KEY (`ID_PAYS`) REFERENCES `pays` (`ID`);

--
-- Contraintes pour la table `pays`
--
ALTER TABLE `pays`
  ADD CONSTRAINT `ID_CONT` FOREIGN KEY (`ID_CONTINENT`) REFERENCES `continent` (`ID`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `ID_ENTREPRISE` FOREIGN KEY (`ID_ENTREPRISE`) REFERENCES `enterprise` (`ID`),
  ADD CONSTRAINT `PAYS_FAB` FOREIGN KEY (`ID_PAYS_FABRICATION`) REFERENCES `pays` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
