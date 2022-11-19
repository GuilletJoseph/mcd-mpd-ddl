-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 19 nov. 2022 à 21:16
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
-- Base de données : ` institut_etudes`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonne`
--

CREATE TABLE `abonne` (
  `ID` int(11) NOT NULL,
  `ID_CLIENT` int(11) NOT NULL,
  `ID_REVUE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `adresse_postale`
--

CREATE TABLE `adresse_postale` (
  `ID` int(11) NOT NULL,
  `NUMERO_RUE` int(11) NOT NULL,
  `NOM_RUE` varchar(50) NOT NULL,
  `CODE_POSTAL` int(11) NOT NULL,
  `VILLE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `cat_socioprofessionnelle`
--

CREATE TABLE `cat_socioprofessionnelle` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `ID` int(11) NOT NULL,
  `ADRESSE ELECTONIQUE` varchar(50) NOT NULL,
  `ID_ADRESSE_POSTALE` int(11) NOT NULL,
  `NUMERO_FIXE` int(25) NOT NULL,
  `NUMERO_PORTABLE` int(25) NOT NULL,
  `ID_GENRE` int(11) NOT NULL,
  `NB_ENFANTS` int(11) NOT NULL,
  `DATE_NAISSANCE` int(11) NOT NULL,
  `ID_STATUS_PROF` int(11) NOT NULL,
  `ID_PROFESSION` int(11) NOT NULL,
  `ID_CAT_SOCIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `ID` int(11) NOT NULL,
  `GENRE` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `hors_abonne`
--

CREATE TABLE `hors_abonne` (
  `ID_CLIENT` int(11) NOT NULL,
  `ID_REVUE` int(11) NOT NULL,
  `FREUQENCE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `journal`
--

CREATE TABLE `journal` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `ID_THEME` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `profession`
--

CREATE TABLE `profession` (
  `ID` int(11) NOT NULL,
  `NOM` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `revue`
--

CREATE TABLE `revue` (
  `ID` int(11) NOT NULL,
  `TITRE` int(11) NOT NULL,
  `PERIODICITE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `status_professionel`
--

CREATE TABLE `status_professionel` (
  `ID` int(11) NOT NULL,
  `STATUS` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE `theme` (
  `ID` int(11) NOT NULL,
  `NOM` int(11) NOT NULL,
  `ID_REVUE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonne`
--
ALTER TABLE `abonne`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_CLIENT` (`ID_CLIENT`),
  ADD KEY `ID_REVUE` (`ID_REVUE`);

--
-- Index pour la table `adresse_postale`
--
ALTER TABLE `adresse_postale`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `cat_socioprofessionnelle`
--
ALTER TABLE `cat_socioprofessionnelle`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_ADRESSE_POSTALE` (`ID_ADRESSE_POSTALE`),
  ADD KEY `ID_CAT_SOCIO` (`ID_CAT_SOCIO`),
  ADD KEY `ID_GENRE` (`ID_GENRE`),
  ADD KEY `ID_PROFESSION` (`ID_PROFESSION`),
  ADD KEY `ID_STATUS_PROF` (`ID_STATUS_PROF`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `hors_abonne`
--
ALTER TABLE `hors_abonne`
  ADD KEY `ID_CLIENT` (`ID_CLIENT`),
  ADD KEY `ID_REVUE` (`ID_REVUE`);

--
-- Index pour la table `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_THEME` (`ID_THEME`);

--
-- Index pour la table `profession`
--
ALTER TABLE `profession`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `revue`
--
ALTER TABLE `revue`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `status_professionel`
--
ALTER TABLE `status_professionel`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_REVUE` (`ID_REVUE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonne`
--
ALTER TABLE `abonne`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `adresse_postale`
--
ALTER TABLE `adresse_postale`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cat_socioprofessionnelle`
--
ALTER TABLE `cat_socioprofessionnelle`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `journal`
--
ALTER TABLE `journal`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `profession`
--
ALTER TABLE `profession`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `revue`
--
ALTER TABLE `revue`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `status_professionel`
--
ALTER TABLE `status_professionel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `theme`
--
ALTER TABLE `theme`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `abonne`
--
ALTER TABLE `abonne`
  ADD CONSTRAINT `abonne_ibfk_1` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID`),
  ADD CONSTRAINT `abonne_ibfk_2` FOREIGN KEY (`ID_REVUE`) REFERENCES `revue` (`ID`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`ID_ADRESSE_POSTALE`) REFERENCES `adresse_postale` (`ID`),
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`ID_CAT_SOCIO`) REFERENCES `cat_socioprofessionnelle` (`ID`),
  ADD CONSTRAINT `client_ibfk_3` FOREIGN KEY (`ID_GENRE`) REFERENCES `genre` (`ID`),
  ADD CONSTRAINT `client_ibfk_4` FOREIGN KEY (`ID_PROFESSION`) REFERENCES `profession` (`ID`),
  ADD CONSTRAINT `client_ibfk_5` FOREIGN KEY (`ID_STATUS_PROF`) REFERENCES `status_professionel` (`ID`);

--
-- Contraintes pour la table `hors_abonne`
--
ALTER TABLE `hors_abonne`
  ADD CONSTRAINT `hors_abonne_ibfk_1` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID`),
  ADD CONSTRAINT `hors_abonne_ibfk_2` FOREIGN KEY (`ID_REVUE`) REFERENCES `revue` (`ID`);

--
-- Contraintes pour la table `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`ID_THEME`) REFERENCES `theme` (`ID`);

--
-- Contraintes pour la table `theme`
--
ALTER TABLE `theme`
  ADD CONSTRAINT `theme_ibfk_1` FOREIGN KEY (`ID_REVUE`) REFERENCES `revue` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
