-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Giu 18, 2018 alle 14:40
-- Versione del server: 10.0.34-MariaDB-0ubuntu0.16.04.1
-- Versione PHP: 7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alovo-ES`
--

DELIMITER $$
--
-- Procedure
--
CREATE DEFINER=`alovo`@`localhost` PROCEDURE `DeleteLog` (IN `anno` INT(4) UNSIGNED)  MODIFIES SQL DATA
BEGIN
DELETE FROM Biglietto WHERE YEAR(Giorno) = anno;
DELETE FROM ControlloMedico WHERE YEAR(Giorno) = anno;
END$$

CREATE DEFINER=`alovo`@`localhost` PROCEDURE `Scorte` (IN `scorta` INT(3) UNSIGNED)  SELECT NegozioSouvenir.Id_merce, Prezzo, Tipo, Quantita as Rimanenti FROM NegozioSouvenir, Merce WHERE NegozioSouvenir.Id_merce = Merce.Id_merce AND Quantita < scorta$$

--
-- Funzioni
--
CREATE DEFINER=`alovo`@`localhost` FUNCTION `ControlliEseguiti` (`inizio` DATE, `fine` DATE, `veterinario` VARCHAR(20)) RETURNS INT(10) UNSIGNED NO SQL
BEGIN
DECLARE n_controlli INTEGER;
SELECT COUNT(*) INTO n_controlli FROM ControlloMedico WHERE Id_veterinario = veterinario AND Giorno BETWEEN inizio AND fine;
RETURN n_controlli;
END$$

CREATE DEFINER=`alovo`@`localhost` FUNCTION `Malattia` (`animale` VARCHAR(10)) RETURNS INT(11) BEGIN
DECLARE malattia INTEGER;
SELECT c1.Malattia INTO malattia FROM ControlloMedico AS c1 JOIN(
    SELECT MAX(Data) AS MaxCheckData, Id_animale
    FROM ControlloMedico
    WHERE Id_animale = animale
) AS c2
ON c1.Id_animale = c2.Id_animale
AND c1.Data = c2.MaxCheckData;
RETURN malattia;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struttura della tabella `Animale`
--

CREATE TABLE `Animale` (
  `Id_animale` varchar(10) NOT NULL,
  `Id_gabbia` int(2) NOT NULL,
  `Nome_comune` varchar(40) NOT NULL,
  `Nome_scientifico` varchar(40) NOT NULL,
  `Classe` varchar(20) NOT NULL,
  `Ordine` varchar(20) NOT NULL,
  `Famiglia` varchar(20) NOT NULL,
  `Sesso` varchar(1) NOT NULL,
  `Eta` int(3) NOT NULL,
  `Data_arrivo` date DEFAULT NULL,
  `Data_nascita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Animale`
--

INSERT INTO `Animale` (`Id_animale`, `Id_gabbia`, `Nome_comune`, `Nome_scientifico`, `Classe`, `Ordine`, `Famiglia`, `Sesso`, `Eta`, `Data_arrivo`, `Data_nascita`) VALUES
('0sOzX0NdSz', 19, 'Bisonte europeo', 'Bison bonasus', 'Mammiferi', 'Cetartiodattili', 'Bovidi', 'F', 12, '2016-12-26', NULL),
('2ctKyYVXlI', 7, 'Cicogna nera', 'Ciconia nigra', 'Uccelli', 'Ciconiformi', 'Ciconidi', 'M', 3, '2016-09-18', NULL),
('3PJZtjcCJt', 9, 'Panda minore', 'Ailurus fulgens', 'Mammiferi', 'Carnivori', 'Ailuridi', 'F', 1, NULL, '2017-09-28'),
('5Jv2qjqfCw', 23, 'Lemure catta', 'Lemur catta', 'Mammiferi', 'Primati', 'Lemuridi', 'M', 6, '2013-10-21', NULL),
('84Y5MnUCTq', 6, 'Avvoltoio reale indiano', 'Sarcogyps calvus', 'Uccelli', 'Falconiformi', 'Accipitridi', 'F', 8, '2013-07-02', NULL),
('AJbJGeeEDR', 20, 'Gerrosauro maggiore', 'Gerrhosaurus major', 'Rettili', 'Squamati', 'Gerrhosauridae', 'M', 1, '2018-01-29', NULL),
('axqHPe6ocq', 27, 'Emù', 'Dromaius novaehollandiae', 'Uccelli', 'Struzioniformi', 'Dromaidi', 'F', 5, '2014-07-08', NULL),
('BajCeOxfQK', 30, 'Ara ali verdi', 'Ara chloropterus', 'Uccelli', 'Psittaciformi', 'Psittacidi', 'F', 4, '2015-08-20', NULL),
('BfK4NUmdHs', 25, 'Fossa', 'Rangifer tarandus', 'Mammiferi', 'Carnivori', 'Eupleridi', 'M', 4, '2016-08-25', NULL),
('bxvED46kas', 9, 'Panda minore', 'Ailurus fulgens', 'Mammiferi', 'Carnivori', 'Ailuridi', 'F', 6, '2014-03-13', NULL),
('cJNP4BnoRo', 26, 'Wallaby dal collo rosso', 'Macropus rufogriseus', 'Mammiferi', 'Diprotodonti', 'Macropodidi', 'F', 8, '2017-01-16', NULL),
('DclNtLzG7e', 18, 'Ibis eremita', 'Geronticus eremita', 'Uccelli', 'Ciconiformi', 'Treskionitidi', 'F', 5, '2015-04-20', NULL),
('dRa5fddNaf', 24, 'Vasa Maggiore', 'Cryptoprocta ferox', 'Uccelli', 'Psittaciformi', 'Psittacidi', 'F', 5, '2014-08-06', NULL),
('eDTtjdNin5', 3, 'Suricato', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'M', 7, '2014-01-06', NULL),
('F3qhgwfr10', 15, 'Renna', 'Rangifer tarandus', 'Mammiferi', 'Cetartiodattili', 'Cervidi', 'M', 14, '2008-07-08', NULL),
('Gkr0sTJObZ', 22, 'Anaconda giallo', 'Rangifer tarandus', 'Rettili', 'Squamati', 'Boidi', 'M', 12, '2008-07-08', NULL),
('GzXDREfWga', 16, 'Fenicottero rosa', 'Phoenicopterus roseus', 'Uccelli', 'Fenicotteriformi', 'Fenicotteridi', 'M', 4, '2015-04-20', NULL),
('HdTiQWoA9W', 1, 'Ghepardo', 'Acinonyx jubatus', 'Mammiferi ', 'Carnivori', 'Felidi', 'M', 10, '2009-01-04', NULL),
('HPIXIo1wks', 3, 'Suricato', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'M', 4, NULL, '2014-08-14'),
('hpMwkJvIve', 8, 'Tigre siberiana', 'Panthera tigris altaica', 'Mammiferi', 'Carnivori', 'Felidi', 'M', 5, '2016-12-27', NULL),
('I3VA0OxptO', 17, 'Lupo', 'Canis lupus', 'Mammiferi', 'Carnivori', 'Canidi', 'M', 9, '2011-01-24', NULL),
('irO3Vltmml', 10, 'Tamarino imperatore', 'Saguinus imperator', 'Mammiferi', 'Primati', 'Callitricidi', 'M', 5, '2014-04-22', NULL),
('J3O8iLozhO', 30, 'Ara ali verdi', 'Ara chloropterus', 'Uccelli', 'Psittaciformi', 'Psittacidi', 'M', 2, NULL, '2016-07-27'),
('jBFcSqp3BX', 12, 'Ocelot', 'Leopardus pardalis', 'Mammiferi', 'Carnivori', 'Felidi', 'F', 7, '2014-09-29', NULL),
('jtFscxRO5t', 11, 'Bradipo bidattilo', 'Choloepus didactylus', 'Mammiferi', 'Pelosi', 'Megalonichidi', 'F', 9, '2014-06-04', NULL),
('kX5i77fSzA', 3, 'Suricato', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'F', 4, NULL, '2014-08-14'),
('l81E5IQy3x', 29, 'Casuario', 'Casuarius casuarius', 'Uccelli', 'Struzioniformi', 'Casuaridi', 'M', 3, '2017-01-16', NULL),
('MHJsAQyjgG', 2, 'Leone', 'Panthera Leo', 'Mammiferi', 'Carnivori', 'Felidi', 'F', 8, '2013-04-18', NULL),
('MIcfKnp4jw', 4, 'Sitatunga', 'Tragelaphus spekii', 'Mammiferi', 'Cetartiodattili', 'Bovidi', 'F', 7, '2015-09-24', NULL),
('PH8ZfieJDX', 12, 'Ocelot', 'Leopardus pardalis', 'Mammiferi', 'Carnivori', 'Felidi', 'M', 3, NULL, '2015-05-21'),
('Q7m2kWM8Sd', 9, 'Panda minore', 'Ailurus fulgens', 'Mammiferi', 'Carnivori', 'Ailuridi', 'M', 5, '2015-11-21', NULL),
('R753WCRVgU', 14, 'Gufo delle nevi', 'Bubo scandiaca', 'Uccelli', 'Strigiformi', 'Strigidi', 'F', 8, '2011-08-16', NULL),
('rs7Fq26XFs', 21, 'Pitone reale', 'Phyton regius', 'Rettili', 'Squamati', 'Phytonidae', 'F', 10, '2010-08-06', NULL),
('SFSUCvPTVr', 5, 'Ippopotamo', 'Hippopotamus amphibius', 'Mammiferi', 'Cetartiodattili', 'Ippopotamidi', 'M', 25, '2008-10-07', NULL),
('TbcP2i3xmO', 12, 'Ocelot', 'Leopardus pardalis', 'Mammiferi', 'Carnivori', 'Felidi', 'M', 7, '2014-09-29', NULL),
('UNjwm0Wygt', 28, 'Gru antigone', 'Grus antigone', 'Uccelli', 'Gruiformi', 'Gruidi', 'F', 3, '2018-02-27', NULL),
('vV3FcbzsLg', 13, 'Saki dalla faccia bianca', 'Pithecia pithecia', 'Mammiferi', 'Primati', 'Pitecidi', 'F', 5, '2016-04-28', NULL),
('WbLcpsGLaf', 3, 'Suricato', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'F', 6, '2013-03-06', NULL),
('ZEmxJIAKi2', 30, 'Ara ali verdi', 'Ara chloropterus', 'Uccelli', 'Psittaciformi', 'Psittacidi', 'M', 5, '2014-01-10', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `Area`
--

CREATE TABLE `Area` (
  `Id_area` int(2) NOT NULL,
  `Nome` enum('Europa','Madagascar','Oceania','Africa','Asia','America','Borealia','Rettilario','Amazzonia') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Area`
--

INSERT INTO `Area` (`Id_area`, `Nome`) VALUES
(1, 'Europa'),
(2, 'Madagascar'),
(3, 'Oceania'),
(4, 'Africa'),
(5, 'Asia'),
(6, 'America'),
(7, 'Borealia'),
(8, 'Rettilario'),
(9, 'Amazzonia');

-- --------------------------------------------------------

--
-- Struttura della tabella `Biglietto`
--

CREATE TABLE `Biglietto` (
  `Id_biglietto` varchar(15) NOT NULL,
  `Tipo` varchar(10) NOT NULL,
  `Prezzo` decimal(5,2) NOT NULL,
  `Giorno` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Biglietto`
--

INSERT INTO `Biglietto` (`Id_biglietto`, `Tipo`, `Prezzo`, `Giorno`) VALUES
('gAlaV138wek4mFN', 'Ragazzo', '15.00', '2018-06-01'),
('H28LwzbF2CTQgC2', 'Adulti', '20.00', '2018-06-01'),
('hB7zHgcbWYD4Oht', 'Ragazzo', '15.00', '2018-06-01'),
('M9YwZ5B5ZbK2OKo', 'Ragazzo', '15.00', '2018-06-01'),
('NHZSfAKvtpsyRXH', 'Adulti', '20.00', '2018-06-01'),
('NoPgTCJyd4isueq', 'Baby', '3.00', '2018-06-01'),
('Ri17c0NP2CvbSeR', 'Baby', '3.00', '2018-06-01'),
('ToUc7S0wUu0d5xs', 'Senior', '18.00', '2018-06-01'),
('vOPm5vqoNj2PXha', 'Senior', '18.00', '2018-06-01');

-- --------------------------------------------------------

--
-- Struttura della tabella `ControlloMedico`
--

CREATE TABLE `ControlloMedico` (
  `Id_animale` varchar(10) NOT NULL,
  `Id_veterinario` varchar(20) NOT NULL,
  `Giorno` date NOT NULL,
  `Peso` decimal(5,2) NOT NULL,
  `Malattia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `ControlloMedico`
--

INSERT INTO `ControlloMedico` (`Id_animale`, `Id_veterinario`, `Giorno`, `Peso`, `Malattia`) VALUES
('0sOzX0NdSz', 'Trcz73OHLQdTPjfucGb1', '2018-03-13', '10.00', 1),
('2ctKyYVXlI', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-19', '10.00', 0),
('3PJZtjcCJt', 'Trcz73OHLQdTPjfucGb1', '2018-04-22', '10.00', 0),
('5Jv2qjqfCw', 'Trcz73OHLQdTPjfucGb1', '2018-03-24', '10.00', 0),
('84Y5MnUCTq', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-18', '10.00', 0),
('AJbJGeeEDR', 'LxwhzFFLQ8wPdQgAW80o', '2018-03-12', '10.00', 0),
('axqHPe6ocq', 'LxwhzFFLQ8wPdQgAW80o', '2018-03-02', '10.00', 0),
('BajCeOxfQK', 'QjQMaljH5PthhdL2z970', '2018-06-05', '10.00', 0),
('BfK4NUmdHs', 'LxwhzFFLQ8wPdQgAW80o', '2018-02-26', '10.00', 0),
('bxvED46kas', 'Trcz73OHLQdTPjfucGb1', '2018-04-21', '10.00', 0),
('cJNP4BnoRo', 'LxwhzFFLQ8wPdQgAW80o', '2018-03-01', '10.00', 0),
('DclNtLzG7e', 'Trcz73OHLQdTPjfucGb1', '2018-03-12', '10.00', 0),
('dRa5fddNaf', 'QjQMaljH5PthhdL2z970', '2018-02-27', '10.00', 0),
('eDTtjdNin5', 'Trcz73OHLQdTPjfucGb1', '2018-06-04', '10.00', 0),
('F3qhgwfr10', 'Trcz73OHLQdTPjfucGb1', '2018-03-09', '10.00', 0),
('Gkr0sTJObZ', 'Trcz73OHLQdTPjfucGb1', '2018-03-23', '10.00', 0),
('GzXDREfWga', 'Trcz73OHLQdTPjfucGb1', '2018-03-10', '10.00', 0),
('HdTiQWoA9W', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-07', '10.00', 0),
('HPIXIo1wks', 'Trcz73OHLQdTPjfucGb1', '2018-06-05', '10.00', 0),
('hpMwkJvIve', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-20', '10.00', 0),
('I3VA0OxptO', 'QjQMaljH5PthhdL2z970', '2018-03-10', '10.00', 0),
('irO3Vltmml', 'Trcz73OHLQdTPjfucGb1', '2018-04-23', '10.00', 0),
('J3O8iLozhO', 'QjQMaljH5PthhdL2z970', '2018-06-05', '10.00', 0),
('jBFcSqp3BX', 'QjQMaljH5PthhdL2z970', '2018-04-26', '10.00', 0),
('jtFscxRO5t', 'QjQMaljH5PthhdL2z970', '2018-04-24', '10.00', 0),
('kX5i77fSzA', 'Trcz73OHLQdTPjfucGb1', '2018-06-05', '10.00', 0),
('l81E5IQy3x', 'Trcz73OHLQdTPjfucGb1', '2018-06-01', '10.00', 0),
('MHJsAQyjgG', 'LxwhzFFLQ8wPdQgAW80o', '2018-02-15', '10.00', 0),
('MHJsAQyjgG', 'LxwhzFFLQ8wPdQgAW80o', '2018-03-20', '10.00', 0),
('MHJsAQyjgG', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-08', '10.00', 0),
('MIcfKnp4jw', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-09', '10.00', 0),
('PH8ZfieJDX', 'Trcz73OHLQdTPjfucGb1', '2018-05-25', '10.00', 0),
('Q7m2kWM8Sd', 'Trcz73OHLQdTPjfucGb1', '2018-04-20', '10.00', 0),
('R753WCRVgU', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-26', '10.00', 0),
('rs7Fq26XFs', 'Trcz73OHLQdTPjfucGb1', '2018-03-22', '10.00', 0),
('SFSUCvPTVr', 'QjQMaljH5PthhdL2z970', '2018-05-18', '10.00', 0),
('TbcP2i3xmO', 'QjQMaljH5PthhdL2z970', '2018-04-25', '10.00', 0),
('UNjwm0Wygt', 'LxwhzFFLQ8wPdQgAW80o', '2018-03-03', '10.00', 0),
('vV3FcbzsLg', 'Trcz73OHLQdTPjfucGb1', '2018-05-26', '10.00', 0),
('WbLcpsGLaf', 'Trcz73OHLQdTPjfucGb1', '2018-06-04', '10.00', 1),
('ZEmxJIAKi2', 'QjQMaljH5PthhdL2z970', '2018-06-05', '10.00', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Dipendenti`
--

CREATE TABLE `Dipendenti` (
  `Id_dipendente` varchar(20) NOT NULL,
  `Descrizione` enum('Direttore','Keeper','Veterinario','Cassiere','Mascotte','Ricercatore') NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `Cognome` varchar(30) NOT NULL,
  `Data_assunzione` date DEFAULT NULL,
  `Salario` decimal(6,2) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Dipendenti`
--

INSERT INTO `Dipendenti` (`Id_dipendente`, `Descrizione`, `Nome`, `Cognome`, `Data_assunzione`, `Salario`) VALUES
('6bXDGejOWzjxryqbIPTT', 'Keeper', 'Domenico', 'De Luca', '2013-10-25', '2200.00'),
('CmqYEkmd0qZyc1fnbt7X', 'Keeper', 'Concetta', 'Leone', '2017-07-21', '2200.00'),
('dFOhOyxEYpHFFVspe2DK', 'Mascotte', 'Antonio', 'Orlando', '2011-03-01', '1100.00'),
('eJeeLcw4SXKFjVHv18VR', 'Ricercatore', 'Luigi', 'Barbieri', NULL, NULL),
('GCKiomh1fRVz8fPacomX', 'Cassiere', 'Michele', 'Cozzolino', '2017-02-02', '1400.00'),
('k8uHwzVFKOgbN7vOGuO8', 'Cassiere', 'Anna', 'Grimaldi', '2012-09-06', '1400.00'),
('LxwhzFFLQ8wPdQgAW80o', 'Veterinario', 'Vincenzo', 'Scala', '2008-05-28', '2500.00'),
('oN95g4zNlVdHpdPU6TWa', 'Direttore', 'Mario', 'Lamborghini', NULL, '4000.00'),
('qCQ4nSmRGuvQ6YHq79BU', 'Ricercatore', 'Aurelio', 'Cosentino', NULL, NULL),
('QjQMaljH5PthhdL2z970', 'Veterinario', 'Giuseppe', 'Garofalo', '2016-01-11', '2500.00'),
('QMXo7PWOVHMkDPj5FCyL', 'Cassiere', 'Ciro', 'De Angelis', '2008-02-15', '1400.00'),
('rhIjZPX4sw4znAChyCYR', 'Keeper', 'Rosa', 'Caruso', '2016-12-23', '2200.00'),
('s2zeyv1pnEkcyMTNmthD', 'Keeper', 'Pasquale', 'Esposito', '2009-05-27', '2200.00'),
('Trcz73OHLQdTPjfucGb1', 'Veterinario', 'Raffaele', 'Perrotta', '2007-05-09', '2500.00');

-- --------------------------------------------------------

--
-- Struttura della tabella `Gabbia`
--

CREATE TABLE `Gabbia` (
  `Id_gabbia` int(2) NOT NULL,
  `Id_area` int(2) NOT NULL,
  `Id_animale` varchar(10) NOT NULL,
  `Giorno_pulizia` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Gabbia`
--

INSERT INTO `Gabbia` (`Id_gabbia`, `Id_area`, `Id_animale`, `Giorno_pulizia`) VALUES
(1, 4, '', 'Lunedì'),
(2, 4, '', 'Lunedì'),
(3, 4, '', 'Lunedì'),
(4, 4, '', 'Lunedì'),
(5, 4, '', 'Lunedì'),
(6, 5, '', 'Martedì'),
(7, 5, '', 'Martedì'),
(8, 5, '', 'Martedì'),
(9, 5, '', 'Martedì'),
(10, 6, '', 'Mercoledì'),
(11, 6, '', 'Mercoledì'),
(12, 6, '', 'Mercoledì'),
(13, 6, '', 'Mercoledì'),
(14, 7, '', 'Giovedì'),
(15, 7, '', 'Giovedì'),
(16, 1, '', 'Giovedì'),
(17, 1, '', 'Giovedì'),
(18, 1, '', 'Giovedì'),
(19, 1, '', 'Giovedì'),
(20, 8, '', 'Venerdì'),
(21, 8, '', 'Venerdì'),
(22, 8, '', 'Venerdì'),
(23, 2, '', 'Venerdì'),
(24, 2, '', 'Venerdì'),
(25, 2, '', 'Venerdì'),
(26, 3, '', 'Sabato'),
(27, 3, '', 'Sabato'),
(28, 3, '', 'Sabato'),
(29, 3, '', 'Sabato'),
(30, 9, '', 'Sabato');

-- --------------------------------------------------------

--
-- Struttura della tabella `Merce`
--

CREATE TABLE `Merce` (
  `Id_merce` varchar(10) NOT NULL,
  `Prezzo` decimal(4,2) NOT NULL,
  `Tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Merce`
--

INSERT INTO `Merce` (`Id_merce`, `Prezzo`, `Tipo`) VALUES
('0MrCMks8T9', '25.00', 'poster'),
('0W6w2Vn25l', '5.00', 'berretto'),
('578JFaG5eI', '2.50', 'penna'),
('bG9S9RPgFb', '15.00', 'poster'),
('hOgorqUmUs', '15.00', 'maglietta'),
('i5JbdlAqGO', '1.50', 'matita'),
('J4DzcwrMdW', '20.00', 'felpa'),
('J4XsbIpinC', '20.00', 'poster'),
('mKrzcSvTWk', '15.00', 'maglietta'),
('TLzQym7YuH', '8.00', 'berretto'),
('ucnzo5hWst', '15.50', 'libro'),
('uQQMbQ67VE', '10.00', 'poster'),
('YTp4J4jhrd', '7.00', 'poster');

-- --------------------------------------------------------

--
-- Struttura della tabella `NegozioSouvenir`
--

CREATE TABLE `NegozioSouvenir` (
  `Id_merce` varchar(10) NOT NULL,
  `Quantita` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `NegozioSouvenir`
--

INSERT INTO `NegozioSouvenir` (`Id_merce`, `Quantita`) VALUES
('YTp4J4jhrd', 52),
('uQQMbQ67VE', 28),
('bG9S9RPgFb', 37),
('J4XsbIpinC', 68),
('0MrCMks8T9', NULL),
('J4DzcwrMdW', 20),
('mKrzcSvTWk', 31),
('hOgorqUmUs', 24),
('0W6w2Vn25l', 40),
('TLzQym7YuH', 45),
('ucnzo5hWst', 114),
('i5JbdlAqGO', 200),
('578JFaG5eI', 160);

-- --------------------------------------------------------

--
-- Struttura della tabella `Orario`
--

CREATE TABLE `Orario` (
  `Giorno` varchar(10) NOT NULL,
  `Apertura` time DEFAULT NULL,
  `Chiusura` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Orario`
--

INSERT INTO `Orario` (`Giorno`, `Apertura`, `Chiusura`) VALUES
('Lunedì', '09:00:00', '18:00:00'),
('Martedì', '09:00:00', '18:00:00'),
('Mercoledì', '09:00:00', '18:00:00'),
('Giovedì', '09:00:00', '18:00:00'),
('Venerdì', '09:00:00', '18:00:00'),
('Sabato', '09:00:00', '18:00:00'),
('Domenica', '09:00:00', '19:00:00');

-- --------------------------------------------------------

--
-- Struttura della tabella `Zoo`
--

CREATE TABLE `Zoo` (
  `Telefono` int(10) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Citta` varchar(40) NOT NULL,
  `Via` varchar(50) NOT NULL,
  `CAP` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `Zoo`
--

INSERT INTO `Zoo` (`Telefono`, `Email`, `Citta`, `Via`, `CAP`) VALUES
(498844217, 'info@tropicalzoo.it', 'Napoli', 'Via Giovanni Brombeis 10', 80135);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Animale`
--
ALTER TABLE `Animale`
  ADD PRIMARY KEY (`Id_animale`),
  ADD KEY `Id_gabbia` (`Id_gabbia`);

--
-- Indici per le tabelle `Area`
--
ALTER TABLE `Area`
  ADD PRIMARY KEY (`Id_area`);

--
-- Indici per le tabelle `Biglietto`
--
ALTER TABLE `Biglietto`
  ADD PRIMARY KEY (`Id_biglietto`);

--
-- Indici per le tabelle `ControlloMedico`
--
ALTER TABLE `ControlloMedico`
  ADD PRIMARY KEY (`Id_animale`,`Giorno`),
  ADD KEY `Id_veterinario` (`Id_veterinario`);

--
-- Indici per le tabelle `Dipendenti`
--
ALTER TABLE `Dipendenti`
  ADD PRIMARY KEY (`Id_dipendente`);

--
-- Indici per le tabelle `Gabbia`
--
ALTER TABLE `Gabbia`
  ADD PRIMARY KEY (`Id_gabbia`),
  ADD KEY `Id_area` (`Id_area`);

--
-- Indici per le tabelle `Merce`
--
ALTER TABLE `Merce`
  ADD PRIMARY KEY (`Id_merce`);

--
-- Indici per le tabelle `NegozioSouvenir`
--
ALTER TABLE `NegozioSouvenir`
  ADD KEY `Id_merce` (`Id_merce`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Animale`
--
ALTER TABLE `Animale`
  ADD CONSTRAINT `Animale_ibfk_1` FOREIGN KEY (`Id_gabbia`) REFERENCES `Gabbia` (`Id_gabbia`);

--
-- Limiti per la tabella `ControlloMedico`
--
ALTER TABLE `ControlloMedico`
  ADD CONSTRAINT `ControlloMedico_ibfk_1` FOREIGN KEY (`Id_animale`) REFERENCES `Animale` (`Id_animale`),
  ADD CONSTRAINT `ControlloMedico_ibfk_2` FOREIGN KEY (`Id_veterinario`) REFERENCES `Dipendenti` (`Id_dipendente`);

--
-- Limiti per la tabella `Gabbia`
--
ALTER TABLE `Gabbia`
  ADD CONSTRAINT `Gabbia_ibfk_1` FOREIGN KEY (`Id_area`) REFERENCES `Area` (`Id_area`);

--
-- Limiti per la tabella `NegozioSouvenir`
--
ALTER TABLE `NegozioSouvenir`
  ADD CONSTRAINT `NegozioSouvenir_ibfk_1` FOREIGN KEY (`Id_merce`) REFERENCES `Merce` (`Id_merce`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
