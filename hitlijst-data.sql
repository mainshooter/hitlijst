-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 24 mrt 2017 om 09:56
-- Serverversie: 10.1.21-MariaDB
-- PHP-versie: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hitlijst`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Artiest`
--

CREATE TABLE `Artiest` (
  `idArtiest` int(11) NOT NULL,
  `Artiestnaam` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `Artiest`
--

INSERT INTO `Artiest` (`idArtiest`, `Artiestnaam`) VALUES
(1, 'Ed Sheeran'),
(2, 'Kygo'),
(3, 'Selena Gomez'),
(4, 'Martin Garrix'),
(5, 'Dua Lipa');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Hitlijst`
--

CREATE TABLE `Hitlijst` (
  `idHitlijst` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `Hitlijst`
--

INSERT INTO `Hitlijst` (`idHitlijst`, `name`) VALUES
(1, 'top-40');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Hitlijstrelease`
--

CREATE TABLE `Hitlijstrelease` (
  `idHitlijstrelease` int(11) NOT NULL,
  `publicatiedatum` date DEFAULT NULL,
  `week` int(11) DEFAULT NULL,
  `jaar` year(4) DEFAULT NULL,
  `Hitlijst_idHitlijst` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `Hitlijstrelease`
--

INSERT INTO `Hitlijstrelease` (`idHitlijstrelease`, `publicatiedatum`, `week`, `jaar`, `Hitlijst_idHitlijst`) VALUES
(1, '2017-03-24', 12, 2017, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Hitlijstrelease_has_HitItem`
--

CREATE TABLE `Hitlijstrelease_has_HitItem` (
  `Hitlijstrelease_idHitlijstrelease` int(11) NOT NULL,
  `Hitlijstrelease_has_HitItem_id` int(11) NOT NULL,
  `positie` int(11) DEFAULT NULL,
  `Lied_idLied` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `Hitlijstrelease_has_HitItem`
--

INSERT INTO `Hitlijstrelease_has_HitItem` (`Hitlijstrelease_idHitlijstrelease`, `Hitlijstrelease_has_HitItem_id`, `positie`, `Lied_idLied`) VALUES
(1, 1, 1, 1),
(1, 2, 2, 2),
(1, 3, 3, 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Lied`
--

CREATE TABLE `Lied` (
  `idLied` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `releasedate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `Lied`
--

INSERT INTO `Lied` (`idLied`, `title`, `releasedate`) VALUES
(1, 'Shape of you', '2017-01-06'),
(2, 'It Ain\'t Me', '2017-02-16'),
(3, 'Scared to be lonely', '2017-01-17');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Lied_has_Artiest`
--

CREATE TABLE `Lied_has_Artiest` (
  `Lied_idLied` int(11) NOT NULL,
  `Artiest_idArtiest` int(11) NOT NULL,
  `Lied_has_Artiest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `Lied_has_Artiest`
--

INSERT INTO `Lied_has_Artiest` (`Lied_idLied`, `Artiest_idArtiest`, `Lied_has_Artiest_id`) VALUES
(1, 1, 1),
(1, 1, 2),
(2, 2, 3),
(2, 3, 4),
(3, 4, 5),
(3, 5, 6);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `Artiest`
--
ALTER TABLE `Artiest`
  ADD PRIMARY KEY (`idArtiest`);

--
-- Indexen voor tabel `Hitlijst`
--
ALTER TABLE `Hitlijst`
  ADD PRIMARY KEY (`idHitlijst`);

--
-- Indexen voor tabel `Hitlijstrelease`
--
ALTER TABLE `Hitlijstrelease`
  ADD PRIMARY KEY (`idHitlijstrelease`),
  ADD KEY `fk_Hitlijstrelease_Hitlijst1_idx` (`Hitlijst_idHitlijst`);

--
-- Indexen voor tabel `Hitlijstrelease_has_HitItem`
--
ALTER TABLE `Hitlijstrelease_has_HitItem`
  ADD PRIMARY KEY (`Hitlijstrelease_has_HitItem_id`),
  ADD KEY `fk_Hitlijstrelease_has_HitItem_Hitlijstrelease1_idx` (`Hitlijstrelease_idHitlijstrelease`),
  ADD KEY `fk_Hitlijstrelease_has_HitItem_Lied1_idx` (`Lied_idLied`);

--
-- Indexen voor tabel `Lied`
--
ALTER TABLE `Lied`
  ADD PRIMARY KEY (`idLied`);

--
-- Indexen voor tabel `Lied_has_Artiest`
--
ALTER TABLE `Lied_has_Artiest`
  ADD PRIMARY KEY (`Lied_has_Artiest_id`),
  ADD KEY `fk_Lied_has_Artiest_Artiest1_idx` (`Artiest_idArtiest`),
  ADD KEY `fk_Lied_has_Artiest_Lied1_idx` (`Lied_idLied`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `Artiest`
--
ALTER TABLE `Artiest`
  MODIFY `idArtiest` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT voor een tabel `Hitlijst`
--
ALTER TABLE `Hitlijst`
  MODIFY `idHitlijst` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `Hitlijstrelease`
--
ALTER TABLE `Hitlijstrelease`
  MODIFY `idHitlijstrelease` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT voor een tabel `Hitlijstrelease_has_HitItem`
--
ALTER TABLE `Hitlijstrelease_has_HitItem`
  MODIFY `Hitlijstrelease_has_HitItem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT voor een tabel `Lied`
--
ALTER TABLE `Lied`
  MODIFY `idLied` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT voor een tabel `Lied_has_Artiest`
--
ALTER TABLE `Lied_has_Artiest`
  MODIFY `Lied_has_Artiest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `Hitlijstrelease`
--
ALTER TABLE `Hitlijstrelease`
  ADD CONSTRAINT `fk_Hitlijstrelease_Hitlijst1` FOREIGN KEY (`Hitlijst_idHitlijst`) REFERENCES `Hitlijst` (`idHitlijst`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `Hitlijstrelease_has_HitItem`
--
ALTER TABLE `Hitlijstrelease_has_HitItem`
  ADD CONSTRAINT `fk_Hitlijstrelease_has_HitItem_Hitlijstrelease1` FOREIGN KEY (`Hitlijstrelease_idHitlijstrelease`) REFERENCES `Hitlijstrelease` (`idHitlijstrelease`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Hitlijstrelease_has_HitItem_Lied1` FOREIGN KEY (`Lied_idLied`) REFERENCES `Lied` (`idLied`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `Lied_has_Artiest`
--
ALTER TABLE `Lied_has_Artiest`
  ADD CONSTRAINT `fk_Lied_has_Artiest_Artiest1` FOREIGN KEY (`Artiest_idArtiest`) REFERENCES `Artiest` (`idArtiest`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Lied_has_Artiest_Lied1` FOREIGN KEY (`Lied_idLied`) REFERENCES `Lied` (`idLied`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
