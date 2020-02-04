-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mar. 04 fév. 2020 à 13:49
-- Version du serveur :  10.3.21-MariaDB
-- Version de PHP :  7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `MPTicket`
--

-- --------------------------------------------------------

--
-- Structure de la table `T_Categories`
--

CREATE TABLE `T_Categories` (
  `id_categorie` int(16) NOT NULL COMMENT 'id de la table Catégorie',
  `fk_categorie` int(16) DEFAULT NULL COMMENT 'Catégorie parant - Clé étrangère de la table Catégorie',
  `Categorie` varchar(30) NOT NULL COMMENT 'Nom de la catégorie',
  `Description_categorie` varchar(254) NOT NULL COMMENT 'Description de la catégorie'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_Commentaires`
--

CREATE TABLE `T_Commentaires` (
  `id_commentaire` int(32) NOT NULL COMMENT 'id de la table Commentaire',
  `fk_id_ticket` varchar(15) NOT NULL COMMENT 'Commentaire pour le ticket - Clé étrangère de la table ticket',
  `fk_id_utilisateur` int(16) NOT NULL COMMENT 'Qui a créer le commentaire - Clé étrangère de la table Utilisateur',
  `Commentaire` text NOT NULL COMMENT 'Commentaire'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_Departements`
--

CREATE TABLE `T_Departements` (
  `id_departement` int(16) NOT NULL COMMENT 'Id et N° de département',
  `Departement` varchar(30) NOT NULL COMMENT 'Nom du département'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_Documents`
--

CREATE TABLE `T_Documents` (
  `id_document` int(16) NOT NULL COMMENT 'Id de la table Document',
  `fk_id_ticket` varchar(15) NOT NULL COMMENT 'Document pour le ticket - Clé étrangère de la table ticket',
  `fk_id_utilisateur` int(16) NOT NULL COMMENT 'Utilisateur ayant déposé le Document - Clé étrangère de la table Utilisateur',
  `Lien_document` varchar(254) NOT NULL COMMENT 'Lien de où se trouve le document'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_Droits`
--

CREATE TABLE `T_Droits` (
  `id_droit` int(8) NOT NULL COMMENT 'Id de la table Droits',
  `Niveau_droit` varchar(30) NOT NULL COMMENT 'Niveau de droit (Lecture, Modification, Control Total)',
  `Description_droit` text NOT NULL COMMENT 'Description du droit'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_Droits`
--

INSERT INTO `T_Droits` (`id_droit`, `Niveau_droit`, `Description_droit`) VALUES
(1, 'Lecture', 'Droit de lecture :\r\nPermet de consulter les tickets'),
(2, 'Modification', 'Droit de Modification :\r\nPermet de consulter, modifier et supprimer les tickets'),
(3, 'Controle Total', 'Droit Controle Total :\r\nPermet de consulter, modifier,supprimer et de modifier les droits sur les tickets');

-- --------------------------------------------------------

--
-- Structure de la table `T_Impacts`
--

CREATE TABLE `T_Impacts` (
  `id_impact` int(8) NOT NULL COMMENT 'Id de la table impact',
  `Impact` varchar(30) NOT NULL COMMENT 'Niveau d''impact',
  `Description_impact` varchar(254) NOT NULL COMMENT 'Description de l''impact'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_Impacts`
--

INSERT INTO `T_Impacts` (`id_impact`, `Impact`, `Description_impact`) VALUES
(1, 'Bas', 'Niveau Bas :\r\nLe problème impacte une seule personne'),
(2, 'Moyen', 'Niveau Moyen :\r\nLe problème impacte entre 2 à 10 personnes'),
(3, 'Haut', 'Niveau Haut :\r\nLe problème impacte plus que 10 personnes');

-- --------------------------------------------------------

--
-- Structure de la table `T_Priorites`
--

CREATE TABLE `T_Priorites` (
  `id_priorite` int(8) NOT NULL COMMENT 'id de la table priorités',
  `Priorite` varchar(30) NOT NULL COMMENT 'Niveau de priorité',
  `Description_priorite` varchar(254) NOT NULL COMMENT 'Description de la priorité'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_Priorites`
--

INSERT INTO `T_Priorites` (`id_priorite`, `Priorite`, `Description_priorite`) VALUES
(1, 'Basse', 'Priorité Basse :\r\nDemande non-urgente'),
(2, 'Moyenne', 'Priorité Moyenne :\r\nOutils non-productifs pour personne non-cadre'),
(3, 'Haute', 'Priorité Haute :\r\nOutils de production pour une personne non-cardre OU Outils non-productifs pour un cadre'),
(4, 'Critique', 'Priorité Critique :\r\nCadre ayant un problème avec un outil productif');

-- --------------------------------------------------------

--
-- Structure de la table `T_Status`
--

CREATE TABLE `T_Status` (
  `id_status` int(8) NOT NULL COMMENT 'Id de la table Status',
  `Status` varchar(30) NOT NULL COMMENT 'Nom du status',
  `Description_status` varchar(254) NOT NULL COMMENT 'Description du status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `T_Status`
--

INSERT INTO `T_Status` (`id_status`, `Status`, `Description_status`) VALUES
(1, 'Ouvert', 'Le ticket est en cours de traitement'),
(2, 'Clôturé automatiquement ', 'Le ticket a été clôturer automatiquement'),
(3, 'Clôture forcée', 'La clôture du ticket a été forcée'),
(4, 'Annulé', 'Le ticket a été annulé'),
(5, 'Résolu', 'Le ticket a été résolu'),
(6, 'Suspendu', 'Le ticket est suspendu');

-- --------------------------------------------------------

--
-- Structure de la table `T_Tickets`
--

CREATE TABLE `T_Tickets` (
  `id_ticket` varchar(15) NOT NULL COMMENT 'id de la table Ticket - Format (YYYYMMDD_XXX)',
  `fk_id_utilisateur_demandeur` int(16) NOT NULL COMMENT '(Demandeur - Créer par) Clé étrangère de la table Utilisateur',
  `fk_id_utilisateur_beneficiere` int(16) NOT NULL COMMENT '(Bénéficière - Créer pour) Clé étrangère de la table Utilisateur',
  `fk_id_utilisateur_depanneur` int(16) DEFAULT NULL COMMENT '(Dépanneur) Clé étrangère de la table Utilisateur',
  `fk_id_status` int(4) NOT NULL COMMENT 'Status du ticket - Ouvert, Fermé, Résolu - Clé étrangère de la table Status',
  `fk_id_impact` int(4) NOT NULL COMMENT 'Impacte du ticket - Nombre de personne affectée - Clé étrangère de la table Impacte',
  `fk_id_priorite` int(4) NOT NULL COMMENT 'Priorité du ticket - 1,2,3 - Clé étrangère de la table Priorité',
  `fk_id_categorie` int(12) NOT NULL COMMENT 'Catégorie du ticket - Clé étrangère de la table Catégorie',
  `Date_ouverture` datetime NOT NULL COMMENT 'Date d''ouverture du ticket',
  `Date_fermeture` datetime DEFAULT NULL COMMENT 'Date fermeture ticket',
  `IP` varchar(15) NOT NULL COMMENT 'IP de la machine ayant fait le ticket',
  `Nom_machine_creation` varchar(30) NOT NULL COMMENT 'Nom de la machine ayant fait le ticket (PC-190043)',
  `Nom_machine_probleme` varchar(30) NOT NULL COMMENT 'Nom de la machine ayant le probème (PC-190043)',
  `Description_ticket` text NOT NULL COMMENT 'Description du ticket fait par l''utilisateur',
  `Résolution` text DEFAULT NULL COMMENT 'Résolution du ticket fait par le dépanneur'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `T_Utilisateurs`
--

CREATE TABLE `T_Utilisateurs` (
  `id_utilisateur` int(16) NOT NULL COMMENT 'Id de la table Utilisateur',
  `fk_departement` int(16) NOT NULL COMMENT 'Clé étrangère de la table Dépatement',
  `fk_droit` int(8) NOT NULL COMMENT 'Clé étrangère de la table Droits',
  `Login` varchar(30) DEFAULT NULL COMMENT 'Login de l''utilisateur',
  `Password` varchar(64) DEFAULT NULL COMMENT 'Mot de passe de l''utilisateur (salt-pwd + SHA-256)',
  `Nom` varchar(30) NOT NULL COMMENT 'Nom de l''utilisateur',
  `Prenom` varchar(30) NOT NULL COMMENT 'Prénom de l''utilisateur',
  `Numero_Fix` varchar(14) NOT NULL COMMENT 'Numéro du téléphone Fix de l''utilisateur format (0041aabbbccdd)',
  `Numero_Mob` varchar(14) DEFAULT NULL COMMENT 'Numéro du mobile de l''utilisateur format (0041aabbbccdd)',
  `E-Mail` varchar(254) NOT NULL COMMENT 'E-Mail de l''utilisateur'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `T_Categories`
--
ALTER TABLE `T_Categories`
  ADD PRIMARY KEY (`id_categorie`),
  ADD KEY `fk_categorie` (`fk_categorie`);

--
-- Index pour la table `T_Commentaires`
--
ALTER TABLE `T_Commentaires`
  ADD PRIMARY KEY (`id_commentaire`),
  ADD KEY `fk_id_ticket` (`fk_id_ticket`,`fk_id_utilisateur`),
  ADD KEY `T_Commentaires_ibfk_utilisateur` (`fk_id_utilisateur`);

--
-- Index pour la table `T_Departements`
--
ALTER TABLE `T_Departements`
  ADD PRIMARY KEY (`id_departement`);

--
-- Index pour la table `T_Documents`
--
ALTER TABLE `T_Documents`
  ADD PRIMARY KEY (`id_document`),
  ADD KEY `fk_id_ticket` (`fk_id_ticket`,`fk_id_utilisateur`),
  ADD KEY `T_Documents_ibfk_Utilisateur` (`fk_id_utilisateur`);

--
-- Index pour la table `T_Droits`
--
ALTER TABLE `T_Droits`
  ADD PRIMARY KEY (`id_droit`);

--
-- Index pour la table `T_Impacts`
--
ALTER TABLE `T_Impacts`
  ADD PRIMARY KEY (`id_impact`);

--
-- Index pour la table `T_Priorites`
--
ALTER TABLE `T_Priorites`
  ADD PRIMARY KEY (`id_priorite`);

--
-- Index pour la table `T_Status`
--
ALTER TABLE `T_Status`
  ADD PRIMARY KEY (`id_status`);

--
-- Index pour la table `T_Tickets`
--
ALTER TABLE `T_Tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `fk_id_utilisateur_demandeur` (`fk_id_utilisateur_demandeur`),
  ADD KEY `fk_id_utilisateur_beneficiere` (`fk_id_utilisateur_beneficiere`,`fk_id_utilisateur_depanneur`,`fk_id_status`,`fk_id_impact`,`fk_id_priorite`,`fk_id_categorie`),
  ADD KEY `T_Tickets_ibfk_depanneur` (`fk_id_utilisateur_depanneur`),
  ADD KEY `T_Tickets_ibfk_status` (`fk_id_status`),
  ADD KEY `T_Tickets_ibfk_impact` (`fk_id_impact`),
  ADD KEY `T_Tickets_ibfk_priorite` (`fk_id_priorite`),
  ADD KEY `T_Tickets_ibfk_categorie` (`fk_id_categorie`);

--
-- Index pour la table `T_Utilisateurs`
--
ALTER TABLE `T_Utilisateurs`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `fk_departement` (`fk_departement`,`fk_droit`),
  ADD KEY `T_Utilisateurs_ibfk_droit` (`fk_droit`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `T_Categories`
--
ALTER TABLE `T_Categories`
  MODIFY `id_categorie` int(16) NOT NULL AUTO_INCREMENT COMMENT 'id de la table Catégorie';

--
-- AUTO_INCREMENT pour la table `T_Commentaires`
--
ALTER TABLE `T_Commentaires`
  MODIFY `id_commentaire` int(32) NOT NULL AUTO_INCREMENT COMMENT 'id de la table Commentaire';

--
-- AUTO_INCREMENT pour la table `T_Documents`
--
ALTER TABLE `T_Documents`
  MODIFY `id_document` int(16) NOT NULL AUTO_INCREMENT COMMENT 'Id de la table Document';

--
-- AUTO_INCREMENT pour la table `T_Droits`
--
ALTER TABLE `T_Droits`
  MODIFY `id_droit` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Id de la table Droits', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `T_Impacts`
--
ALTER TABLE `T_Impacts`
  MODIFY `id_impact` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Id de la table impact', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `T_Priorites`
--
ALTER TABLE `T_Priorites`
  MODIFY `id_priorite` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id de la table priorités', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `T_Status`
--
ALTER TABLE `T_Status`
  MODIFY `id_status` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Id de la table Status', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `T_Utilisateurs`
--
ALTER TABLE `T_Utilisateurs`
  MODIFY `id_utilisateur` int(16) NOT NULL AUTO_INCREMENT COMMENT 'Id de la table Utilisateur';

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `T_Categories`
--
ALTER TABLE `T_Categories`
  ADD CONSTRAINT `T_Categories_ibfk_1` FOREIGN KEY (`fk_categorie`) REFERENCES `T_Categories` (`id_categorie`);

--
-- Contraintes pour la table `T_Commentaires`
--
ALTER TABLE `T_Commentaires`
  ADD CONSTRAINT `T_Commentaires_ibfk_ticket` FOREIGN KEY (`fk_id_ticket`) REFERENCES `T_Tickets` (`id_ticket`),
  ADD CONSTRAINT `T_Commentaires_ibfk_utilisateur` FOREIGN KEY (`fk_id_utilisateur`) REFERENCES `T_Utilisateurs` (`id_utilisateur`);

--
-- Contraintes pour la table `T_Documents`
--
ALTER TABLE `T_Documents`
  ADD CONSTRAINT `T_Documents_ibfk_Ticket` FOREIGN KEY (`fk_id_ticket`) REFERENCES `T_Tickets` (`id_ticket`),
  ADD CONSTRAINT `T_Documents_ibfk_Utilisateur` FOREIGN KEY (`fk_id_utilisateur`) REFERENCES `T_Utilisateurs` (`id_utilisateur`);

--
-- Contraintes pour la table `T_Tickets`
--
ALTER TABLE `T_Tickets`
  ADD CONSTRAINT `T_Tickets_ibfk_beneficiaire` FOREIGN KEY (`fk_id_utilisateur_beneficiere`) REFERENCES `T_Utilisateurs` (`id_utilisateur`),
  ADD CONSTRAINT `T_Tickets_ibfk_categorie` FOREIGN KEY (`fk_id_categorie`) REFERENCES `T_Categories` (`id_categorie`),
  ADD CONSTRAINT `T_Tickets_ibfk_demandeur` FOREIGN KEY (`fk_id_utilisateur_demandeur`) REFERENCES `T_Utilisateurs` (`id_utilisateur`),
  ADD CONSTRAINT `T_Tickets_ibfk_depanneur` FOREIGN KEY (`fk_id_utilisateur_depanneur`) REFERENCES `T_Utilisateurs` (`id_utilisateur`),
  ADD CONSTRAINT `T_Tickets_ibfk_impact` FOREIGN KEY (`fk_id_impact`) REFERENCES `T_Impacts` (`id_impact`),
  ADD CONSTRAINT `T_Tickets_ibfk_priorite` FOREIGN KEY (`fk_id_priorite`) REFERENCES `T_Priorites` (`id_priorite`),
  ADD CONSTRAINT `T_Tickets_ibfk_status` FOREIGN KEY (`fk_id_status`) REFERENCES `T_Status` (`id_status`);

--
-- Contraintes pour la table `T_Utilisateurs`
--
ALTER TABLE `T_Utilisateurs`
  ADD CONSTRAINT `T_Utilisateurs_ibfk_departement` FOREIGN KEY (`fk_departement`) REFERENCES `T_Departements` (`id_departement`),
  ADD CONSTRAINT `T_Utilisateurs_ibfk_droit` FOREIGN KEY (`fk_droit`) REFERENCES `T_Droits` (`id_droit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
