-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Serveur: sqletud.univ-mlv.fr
-- Généré le : Ven 12 Avril 2013 à 15:44
-- Version du serveur: 5.1.66
-- Version de PHP: 5.3.3-7+squeeze15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `eloyatho_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `Adresse`
--

CREATE TABLE IF NOT EXISTS `Adresse` (
  `idAdresse` int(11) NOT NULL AUTO_INCREMENT,
  `rue` varchar(255) NOT NULL,
  `CP` varchar(10) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `pays` varchar(100) NOT NULL,
  PRIMARY KEY (`idAdresse`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `Adresse`
--

INSERT INTO `Adresse` (`idAdresse`, `rue`, `CP`, `ville`, `pays`) VALUES
(1, '42 rue Edouard Henriot', '77420', 'Champs sur Marne', 'France'),
(2, 'Etxoinia', '64220', 'Gamarthe', 'Pays Basque');

-- --------------------------------------------------------

--
-- Structure de la table `FraisLivraison`
--

CREATE TABLE IF NOT EXISTS `FraisLivraison` (
  `idFraisLivraison` int(11) NOT NULL AUTO_INCREMENT,
  `poidsMax` float NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`idFraisLivraison`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `FraisLivraison`
--

INSERT INTO `FraisLivraison` (`idFraisLivraison`, `poidsMax`, `prix`) VALUES
(1, 20, 16),
(2, 40, 25);

-- --------------------------------------------------------

--
-- Structure de la table `HistoriqueCommande`
--

CREATE TABLE IF NOT EXISTS `HistoriqueCommande` (
  `idHistorique` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `poidsTotalHistorique` float NOT NULL,
  `prixProduitsHistorique` float NOT NULL,
  `prixLivraisonHistorique` float NOT NULL,
  `idAdresseLivraison` int(11) NOT NULL,
  `idAdresseFacturation` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  PRIMARY KEY (`idHistorique`),
  UNIQUE KEY `idAdresseLivraison` (`idAdresseLivraison`),
  KEY `idUtilisateur` (`idUtilisateur`),
  KEY `idAdresseFacturation` (`idAdresseFacturation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contenu de la table `HistoriqueCommande`
--


-- --------------------------------------------------------

--
-- Structure de la table `InclureHistorique`
--

CREATE TABLE IF NOT EXISTS `InclureHistorique` (
  `quantiteHistorique` int(11) NOT NULL,
  `idHistorique` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  PRIMARY KEY (`quantiteHistorique`,`idHistorique`,`idProduit`),
  KEY `idHistorique` (`idHistorique`),
  KEY `idProduit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `InclureHistorique`
--


-- --------------------------------------------------------

--
-- Structure de la table `InclurePanier`
--

CREATE TABLE IF NOT EXISTS `InclurePanier` (
  `quantitePanier` int(11) NOT NULL,
  `idPanier` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  PRIMARY KEY (`quantitePanier`,`idPanier`,`idProduit`),
  KEY `idPanier` (`idPanier`),
  KEY `idProduit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `InclurePanier`
--

INSERT INTO `InclurePanier` (`quantitePanier`, `idPanier`, `idProduit`) VALUES
(1, 2, 1),
(1, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Panier`
--

CREATE TABLE IF NOT EXISTS `Panier` (
  `idPanier` int(11) NOT NULL AUTO_INCREMENT,
  `prixTotalPanier` float NOT NULL,
  `prixProduitsPanier` float NOT NULL,
  `prixLivraisonPanier` float NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  PRIMARY KEY (`idPanier`),
  KEY `idUtilisateur` (`idUtilisateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `Panier`
--

INSERT INTO `Panier` (`idPanier`, `prixTotalPanier`, `prixProduitsPanier`, `prixLivraisonPanier`, `idUtilisateur`) VALUES
(2, 28, 12, 16, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Posseder`
--

CREATE TABLE IF NOT EXISTS `Posseder` (
  `idUtilisateur` int(11) NOT NULL,
  `idAdresse` int(11) NOT NULL,
  PRIMARY KEY (`idUtilisateur`,`idAdresse`),
  KEY `idUtilisateur` (`idUtilisateur`),
  KEY `idAdresse` (`idAdresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `Posseder`
--


-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE IF NOT EXISTS `Produit` (
  `idProduit` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `nomAnglais` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `descriptionAnglais` varchar(255) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `prix` float NOT NULL,
  `quantiteStock` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `typeAnglais` varchar(100) NOT NULL,
  `poids` float NOT NULL,
  PRIMARY KEY (`idProduit`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `Produit`
--

INSERT INTO `Produit` (`idProduit`, `nom`, `nomAnglais`, `description`, `descriptionAnglais`, `photo`, `prix`, `quantiteStock`, `type`, `typeAnglais`, `poids`) VALUES
(1, 'saucisson de montagne', 'sausage mountain', 'super saucisson', 'super sausage', 'images/saucissonMontagne.jpg', 6, 30, 'nature', 'nature', 0.25),
(2, 'saucisson au fromage', 'cheese sausage', 'super saucisson', 'super sausage', 'images/saucissonFromage.jpg', 6, 30, 'fromage', 'cheese', 0.25);

-- --------------------------------------------------------

--
-- Structure de la table `Promotion`
--

CREATE TABLE IF NOT EXISTS `Promotion` (
  `idPromotion` int(11) NOT NULL AUTO_INCREMENT,
  `pourcentage` float NOT NULL,
  `code` varchar(50) NOT NULL,
  PRIMARY KEY (`idPromotion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `Promotion`
--

INSERT INTO `Promotion` (`idPromotion`, `pourcentage`, `code`) VALUES
(1, 20, 'prom20'),
(2, 50, 'prom50');

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE IF NOT EXISTS `Utilisateur` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `numTel` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `mdp` varchar(50) NOT NULL,
  `admin` int(11) NOT NULL,
  PRIMARY KEY (`idUtilisateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`idUtilisateur`, `nom`, `prenom`, `numTel`, `mail`, `pseudo`, `mdp`, `admin`) VALUES
(1, 'Loyatho', 'Elena', '0612547896', 'elena.loyatho@yahoo.fr', 'admin', 'admin', 1),
(2, 'Loyatho', 'Elena', '0354789512', 'elena.loyatho@gmail.com', 'elena', 'elena', 0);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `HistoriqueCommande`
--
ALTER TABLE `HistoriqueCommande`
  ADD CONSTRAINT `HistoriqueCommande_ibfk_3` FOREIGN KEY (`idAdresseFacturation`) REFERENCES `Adresse` (`idAdresse`),
  ADD CONSTRAINT `HistoriqueCommande_ibfk_1` FOREIGN KEY (`idAdresseLivraison`) REFERENCES `Adresse` (`idAdresse`),
  ADD CONSTRAINT `HistoriqueCommande_ibfk_2` FOREIGN KEY (`idUtilisateur`) REFERENCES `Utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `InclureHistorique`
--
ALTER TABLE `InclureHistorique`
  ADD CONSTRAINT `InclureHistorique_ibfk_2` FOREIGN KEY (`idProduit`) REFERENCES `Produit` (`idProduit`),
  ADD CONSTRAINT `InclureHistorique_ibfk_1` FOREIGN KEY (`idHistorique`) REFERENCES `HistoriqueCommande` (`idHistorique`);

--
-- Contraintes pour la table `InclurePanier`
--
ALTER TABLE `InclurePanier`
  ADD CONSTRAINT `InclurePanier_ibfk_2` FOREIGN KEY (`idProduit`) REFERENCES `Produit` (`idProduit`),
  ADD CONSTRAINT `InclurePanier_ibfk_1` FOREIGN KEY (`idPanier`) REFERENCES `Panier` (`idPanier`);

--
-- Contraintes pour la table `Panier`
--
ALTER TABLE `Panier`
  ADD CONSTRAINT `Panier_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `Utilisateur` (`idUtilisateur`);

--
-- Contraintes pour la table `Posseder`
--
ALTER TABLE `Posseder`
  ADD CONSTRAINT `Posseder_ibfk_2` FOREIGN KEY (`idAdresse`) REFERENCES `Adresse` (`idAdresse`),
  ADD CONSTRAINT `Posseder_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `Utilisateur` (`idUtilisateur`);
