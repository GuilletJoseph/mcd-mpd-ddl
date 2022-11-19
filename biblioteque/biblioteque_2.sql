-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 19 nov. 2022 à 17:00
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
-- Base de données : `biblioteque_2`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonne`
--

CREATE TABLE `abonne` (
  `ID` int(11) NOT NULL,
  `NUMERO` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `PRENOM` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE `auteur` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL,
  `PRENOM` varchar(50) NOT NULL,
  `DATE_NAISSANCE` date NOT NULL,
  `DATE_DECES` date NOT NULL,
  `NATIONALITE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `date_achat`
--

CREATE TABLE `date_achat` (
  `ID` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

CREATE TABLE `editeur` (
  `ID` int(11) NOT NULL,
  `NOM` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE `emprunt` (
  `ID` int(11) NOT NULL,
  `DATE_EMPRUNT` int(11) NOT NULL,
  `DATE_RETOUR` int(11) NOT NULL,
  `ID_ABONNE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE `genre` (
  `ID` int(11) NOT NULL,
  `GENRE` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `ID` int(11) NOT NULL,
  `CODE_ART` int(11) NOT NULL,
  `TITRE` varchar(50) NOT NULL,
  `NB_PAGES` int(11) NOT NULL,
  `DATE_EDITION` date NOT NULL,
  `ID_EDITEUR` int(11) NOT NULL,
  `ID_GENRE` int(11) NOT NULL,
  `QUANTITE` int(11) NOT NULL,
  `ID_DATE_ACHAT` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `livre_auteur`
--

CREATE TABLE `livre_auteur` (
  `ID_LIVRE` int(11) NOT NULL,
  `ID_AUTEUR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `livre_emprunt`
--

CREATE TABLE `livre_emprunt` (
  `ID_EMPRUNT` int(11) NOT NULL,
  `ID_LIVRE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonne`
--
ALTER TABLE `abonne`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `date_achat`
--
ALTER TABLE `date_achat`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `editeur`
--
ALTER TABLE `editeur`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_ABONNE` (`ID_ABONNE`);

--
-- Index pour la table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_DATE_ACHAT` (`ID_DATE_ACHAT`),
  ADD KEY `ID_GENRE` (`ID_GENRE`),
  ADD KEY `ID_EDITEUR` (`ID_EDITEUR`);

--
-- Index pour la table `livre_auteur`
--
ALTER TABLE `livre_auteur`
  ADD KEY `ID_AUTEUR` (`ID_AUTEUR`),
  ADD KEY `ID_LIVRE` (`ID_LIVRE`);

--
-- Index pour la table `livre_emprunt`
--
ALTER TABLE `livre_emprunt`
  ADD KEY `ID_EMPRUNT` (`ID_EMPRUNT`),
  ADD KEY `ID_LIVRE` (`ID_LIVRE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonne`
--
ALTER TABLE `abonne`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auteur`
--
ALTER TABLE `auteur`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `date_achat`
--
ALTER TABLE `date_achat`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `editeur`
--
ALTER TABLE `editeur`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `emprunt`
--
ALTER TABLE `emprunt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `genre`
--
ALTER TABLE `genre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `emprunt_ibfk_1` FOREIGN KEY (`ID_ABONNE`) REFERENCES `abonne` (`ID`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`ID_DATE_ACHAT`) REFERENCES `date_achat` (`ID`),
  ADD CONSTRAINT `livre_ibfk_2` FOREIGN KEY (`ID_GENRE`) REFERENCES `genre` (`ID`),
  ADD CONSTRAINT `livre_ibfk_3` FOREIGN KEY (`ID_EDITEUR`) REFERENCES `editeur` (`ID`);

--
-- Contraintes pour la table `livre_auteur`
--
ALTER TABLE `livre_auteur`
  ADD CONSTRAINT `livre_auteur_ibfk_1` FOREIGN KEY (`ID_AUTEUR`) REFERENCES `auteur` (`ID`),
  ADD CONSTRAINT `livre_auteur_ibfk_2` FOREIGN KEY (`ID_LIVRE`) REFERENCES `livre` (`ID`);

--
-- Contraintes pour la table `livre_emprunt`
--
ALTER TABLE `livre_emprunt`
  ADD CONSTRAINT `livre_emprunt_ibfk_1` FOREIGN KEY (`ID_EMPRUNT`) REFERENCES `emprunt` (`ID`),
  ADD CONSTRAINT `livre_emprunt_ibfk_2` FOREIGN KEY (`ID_LIVRE`) REFERENCES `livre` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
