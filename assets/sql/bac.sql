-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 15 Novembre 2016 à 16:51
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bac`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `nom_categorie`) VALUES
(1, 'rap'),
(2, 'rock'),
(3, 'electro'),
(4, 'reggea');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE `commentaires` (
  `id_commentaire` int(11) NOT NULL,
  `desc_commentaire` varchar(20000) NOT NULL,
  `date_commentaire` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commentaires`
--

INSERT INTO `commentaires` (`id_commentaire`, `desc_commentaire`, `date_commentaire`) VALUES
(7, 'rgbilgrblkjbklhtjiln', '2016-11-15 16:34:02'),
(5, 'dfg', '2016-11-15 16:29:11'),
(6, 'le fromage', '2016-11-15 16:31:10');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id_role` int(11) NOT NULL,
  `nom_role` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `roles`
--

INSERT INTO `roles` (`id_role`, `nom_role`) VALUES
(1, 'admin'),
(2, 'membre');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `motDePasse` varchar(255) NOT NULL,
  `avatar_user` varchar(255) NOT NULL,
  `roles_id_role` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id_user`, `nom`, `prenom`, `email`, `motDePasse`, `avatar_user`, `roles_id_role`) VALUES
(1, 'fetet', 'kevin', 'fetetkevin@gmail.com', 'insectile22', 'bob.gif', 1),
(32, 'a', 'a', 'a@a.com', 'a', 'coincoin.jpg', 2),
(29, 'z', 'z', 'z@z.com', 'z', '', 2),
(30, 'ayy', 'renÃ©', 'coeze@gfth', 'oui', '', 2);

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

CREATE TABLE `videos` (
  `id_video` int(11) NOT NULL,
  `videos_id_role` int(11) DEFAULT NULL,
  `categories_id_categorie` int(11) DEFAULT NULL,
  `url_video` varchar(255) NOT NULL,
  `vignette_video` varchar(255) NOT NULL,
  `titre_video` varchar(255) NOT NULL,
  `desc_video` varchar(2000) NOT NULL,
  `categorie_video` varchar(255) NOT NULL,
  `date_video` date DEFAULT NULL,
  `etat_video` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `videos`
--

INSERT INTO `videos` (`id_video`, `videos_id_role`, `categories_id_categorie`, `url_video`, `vignette_video`, `titre_video`, `desc_video`, `categorie_video`, `date_video`, `etat_video`) VALUES
(12, NULL, NULL, 'oFRbZJXjWIA', 'hqdefault4.jpg', 'Bob Marley Jammin', 'Ooh, yeah! All right!\nWe\'re jammin\':\nI wanna jam it wid you.\nWe\'re jammin\', jammin\',\nAnd I hope you like jammin\', too.\n\nAin\'t no rules, ain\'t no vow, we can do it anyhow:\nI\'n\'I will see you through,\n\'Cos everyday we pay the price with a little sacrifice,\nJammin\' till the jam is through.\n\nWe\'re jammin\' -\nTo think that jammin\' was a thing of the past;\nWe\'re jammin\',\nAnd I hope this jam is gonna last.\n\nNo bullet can stop us now, we neither beg nor we won\'t bow;\nNeither can be bought nor sold.\nWe all defend the right; Jah - Jah children must unite:\nYour life is worth much more than gold.\n\nWe\'re jammin\' (jammin\', jammin\', jammin\')\nAnd we\'re jammin\' in the name of the Lord;\nWe\'re jammin\' (jammin\', jammin\', jammin\'),\nWe\'re jammin\' right straight from Yah.\n\nYeh! Holy Mount Zion;\nHoly Mount Zion:\nJah sitteth in Mount Zion\nAnd rules all creation.\n\nYeah, we\'re - we\'re jammin\' (wotcha-wa),\nWotcha-wa-wa-wa, we\'re jammin\' (wotcha-wa),\nSee, I wanna jam it wid you\nWe\'re jammin\' (jammin\', jammin\', jammin\')\nI\'m jammed: I hope you\'re jammin\', too.\n\nJam\'s about my pride and truth I cannot hide\nTo keep you satisfied.\nTrue love that now exist is the love I can\'t resist,\nSo jam by my side.\n\nWe\'re Jammin\' (jammin\', jammin\', jammin\'), yeah-eah-eah!\nI wanna jam it wid you.\nWe\'re jammin\', we\'re jammin\', we\'re jammin\', we\'re jammin\',\nWe\'re jammin\', we\'re jammin\', we\'re jammin\', we\'re jammin\';\nHope you like jammin\', too.\nWe\'re jammin\', we\'re jammin\' (jammin\'),\nWe\'re jammin\', we\'re jammin\' (jammin\').\nI wanna (I wanna jam it wid you) - I wanna -\nI wanna jam wid you now.\nJammin\', jammin\' (hope you like jammin\' too).\nEh-eh! I hope you like jammin\', I hope you like jammin\',\n\'Cause (I wanna jam it wid you). I wanna ... wid you.\nI like - I hope you - I hope you like jammin\', too.\nI wanna jam it;\nI wanna jam it.', '4', '2016-11-15', 'publie'),
(9, NULL, NULL, 'pSImoEnc8fQ', 'hqdefault.jpg', 'Nixo - N', 'Disponible sur iTunes:\nhttp://apple.co/1WNP3ki\nSuivez Nixo sur sa page Facebook et son Snapchat!\nFb : http://bit.ly/1UHvU1R Snap : Nix Sow\nRéalisé par Iross et Dioday\nhttp://www.facebook.com/NuitBlanchePr...\n\nProd by D.i.n BEATS\nhttps://www.facebook.com/DinBeats31242od by D.i.n BEATShttps://www.facebook.com/DinBeats31242', '1', '2016-11-15', 'publie'),
(10, NULL, NULL, 'LoheCz4t2xc', 'hqdefault2.jpg', 'System Of A Down - Hypnotize ', 'Why don\'t you ask the kids at Tiananmen square?\nWas Fashion the reason why they were there?\n\nThey disguise it, Hypnotize it\nTelevision made you buy it\n\nI\'m just sitting in my car and waiting for my...\n\nShe\'s scared that I will take her away from there\nHer dreams that her country left with no one there\n\nMezmerize the simple minded\nPropaganda leaves us blinded', '2', '2016-11-15', 'publie'),
(11, NULL, NULL, 'hBduDuYXJHI', 'hqdefault3.jpg', 'salut c\'est cool', 'Tu peux gagner des points dans l\'espace et le temps. Figure en géométrie Figure, en littérature Figure, en anatomie Figure, en peinture Figure, personnage célèbre Figure, dans un jeu de cartes Figures de skateboard. Figures de jonglerie. Figure de note. Figure de silence.', '3', '2016-11-15', 'publie');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id_commentaire`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD KEY `id_role` (`id_role`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id_user_3` (`id_user`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `nom` (`nom`),
  ADD KEY `prenom` (`prenom`),
  ADD KEY `email` (`email`),
  ADD KEY `motDePasse` (`motDePasse`),
  ADD KEY `roles_id_role` (`roles_id_role`),
  ADD KEY `id_user_2` (`id_user`),
  ADD KEY `roles_id_role_2` (`roles_id_role`);

--
-- Index pour la table `videos`
--
ALTER TABLE `videos`
  ADD UNIQUE KEY `id_video_2` (`id_video`),
  ADD KEY `id_video` (`id_video`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id_commentaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT pour la table `videos`
--
ALTER TABLE `videos`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
