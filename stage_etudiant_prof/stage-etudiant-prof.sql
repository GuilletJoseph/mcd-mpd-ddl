-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 20 nov. 2022 à 18:11
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
-- Base de données : `stage-etudiant-prof`
--

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE `classe` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `ID` int(11) NOT NULL,
  `ID_PERSONNE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `ID` int(11) NOT NULL,
  `SIRET` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `ID` int(11) NOT NULL,
  `NUMERO` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `PRENOM` varchar(50) NOT NULL,
  `ID_CLASSE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `professeur`
--

CREATE TABLE `professeur` (
  `ID` int(11) NOT NULL,
  `ID_PERSONNE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `rapport`
--

CREATE TABLE `rapport` (
  `ID` int(11) NOT NULL,
  `TITRE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `stage`
--

CREATE TABLE `stage` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `DATE_DEBUT` date NOT NULL,
  `DATE_FIN` date NOT NULL,
  `ID_RAPPORT` int(11) NOT NULL,
  `ID_ENTREPRISE` int(11) NOT NULL,
  `ID_PROFESSEUR` int(11) NOT NULL,
  `ID_ELEVE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PERSONNE` (`ID_PERSONNE`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CLASSE` (`ID_CLASSE`);

--
-- Index pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_PERSONNE` (`ID_PERSONNE`);

--
-- Index pour la table `rapport`
--
ALTER TABLE `rapport`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RAPPORT` (`ID_RAPPORT`),
  ADD KEY `ENTREPRISE` (`ID_ENTREPRISE`),
  ADD KEY `ID_PROFESSEUR` (`ID_PROFESSEUR`),
  ADD KEY `ID_ELEVE` (`ID_ELEVE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `classe`
--
ALTER TABLE `classe`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `eleve`
--
ALTER TABLE `eleve`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `entreprise`
--
ALTER TABLE `entreprise`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `professeur`
--
ALTER TABLE `professeur`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `rapport`
--
ALTER TABLE `rapport`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `stage`
--
ALTER TABLE `stage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD CONSTRAINT `eleve_ibfk_1` FOREIGN KEY (`ID_PERSONNE`) REFERENCES `personne` (`ID`);

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `CLASSE` FOREIGN KEY (`ID_CLASSE`) REFERENCES `classe` (`ID`);

--
-- Contraintes pour la table `professeur`
--
ALTER TABLE `professeur`
  ADD CONSTRAINT `professeur_ibfk_1` FOREIGN KEY (`ID_PERSONNE`) REFERENCES `personne` (`ID`);

--
-- Contraintes pour la table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `ENTREPRISE` FOREIGN KEY (`ID_ENTREPRISE`) REFERENCES `entreprise` (`ID`),
  ADD CONSTRAINT `RAPPORT` FOREIGN KEY (`ID_RAPPORT`) REFERENCES `rapport` (`ID`),
  ADD CONSTRAINT `stage_ibfk_1` FOREIGN KEY (`ID_PROFESSEUR`) REFERENCES `professeur` (`ID`),
  ADD CONSTRAINT `stage_ibfk_2` FOREIGN KEY (`ID_ELEVE`) REFERENCES `eleve` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
