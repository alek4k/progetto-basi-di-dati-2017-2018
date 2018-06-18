/*
  ***************************************************
  *  PROGETTO BASI DI DATI "TropicalZoo"            *
  ***************************************************
  *  Anno 2017-2018                                 *
  *  Università degli Studi di Padova               *
  *  Laurea in Informatica                          *
  ***************************************************
  *  Alessandro Lovo                                *
  *  Amedeo Meggiolaro                              *
  ***************************************************
 */

-- Rimozione tabelle (se presenti)
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS Zoo;
DROP TABLE IF EXISTS Orario;
DROP TABLE IF EXISTS Biglietto;
DROP TABLE IF EXISTS Tipologia_biglietto;
DROP TABLE IF EXISTS Parcheggio;
DROP TABLE IF EXISTS Dipendente;
DROP TABLE IF EXISTS Area;
DROP TABLE IF EXISTS Gabbia;
DROP TABLE IF EXISTS Animale;
DROP TABLE IF EXISTS Controllo_medico;
DROP TABLE IF EXISTS Merce;
DROP TABLE IF EXISTS Negozio_souvenir;

DELIMITER ;

-- Creazione e popolamento tabella Zoo
CREATE TABLE Zoo (
  Telefono INTEGER(10) NOT NULL,
  Email    VARCHAR(40) NOT NULL,
  Citta    VARCHAR(40) NOT NULL,
  Via      VARCHAR(50) NOT NULL,
  CAP      INTEGER(10) NOT NULL
);

INSERT INTO Zoo (Telefono, Email, Citta, Via, CAP) VALUES
  (0498844217, 'info@tropicalzoo.it', 'Napoli', 'Via Giovanni Brombeis 10', '80135');

-- Creazione e popolamento tabella Orario
CREATE TABLE Orario (
  Giorno   VARCHAR(10) NOT NULL,
  Apertura TIME,
  Chiusura TIME
);

INSERT INTO Orario (Giorno, Apertura, Chiusura) VALUES
  ('Lunedì', '9:00', '18:00'),
  ('Martedì', '9:00', '18:00'),
  ('Mercoledì', '9:00', '18:00'),
  ('Giovedì', '9:00', '18:00'),
  ('Venerdì', '9:00', '18:00'),
  ('Sabato', '9:00', '18:00'),
  ('Domenica', '9:00', '19:00');

-- Creazione e popolamento tabella Tipologia_biglietto
CREATE TABLE Tipologia_biglietto (
  Nome   VARCHAR(10) PRIMARY KEY,
  Prezzo DECIMAL(5, 2) NOT NULL,
  Eta_min INTEGER(2) NOT NULL,
  Eta_max INTEGER(2)
);

INSERT INTO Tipologia_biglietto (Nome, Prezzo, Eta_min, Eta_max) VALUES
  ('Baby', 3.00, 0, 5),
  ('Ragazzo', 15.00, 6, 12),
  ('Adulto', 20.00, 13, 64),
  ('Senior', 18.00, 65, NULL);

-- Creazione e popolamento tabella Biglietto
CREATE TABLE Biglietto (
  Id_biglietto VARCHAR(15) PRIMARY KEY,
  Tipologia    VARCHAR(10) NOT NULL,
  Giorno       DATE        NOT NULL,
  FOREIGN KEY (Tipologia) REFERENCES Tipologia_biglietto (Nome)
);

INSERT INTO Biglietto (Id_biglietto, Tipologia, Giorno) VALUES
  ('Ri17c0NP2CvbSeR', 'Baby', '2018-06-01'),
  ('hB7zH gcbWYD4Oht', 'Ragazzo', '2018-06-01'),
  ('ToUc7S0wUu0d5xs', 'Senior', '2018-06-01'),
  ('NHZSfAKvtpsyRXH', 'Adulto', '2018-06-01'),
  ('M9YwZ5B5ZbK2OKo', 'Ragazzo', '2018-06-01'),
  ('NoPgTCJyd4isueq', 'Baby', '2018-06-01'),
  ('gAlaV138wek4mFN', 'Ragazzo', '2018-06-01'),
  ('vOPm5vqoNj2PXha', 'Senior', '2018-06-01'),
  ('AgldIAZrTbEQfuW', 'Ragazzo', '2018-06-01'),
  ('H28LwzbF2CTQgC2', 'Adulto', '2018-06-01');

-- Creazione e popolamento tabella Dipendente
CREATE TABLE Dipendente (
  Id_dipendente   VARCHAR(20) PRIMARY KEY,
  Impiego         ENUM ('Direttore', 'Keeper', 'Veterinario', 'Cassiere', 'Mascotte', 'Ricercatore') NOT NULL,
  Nome            VARCHAR(30)                                                                        NOT NULL,
  Cognome         VARCHAR(30)                                                                        NOT NULL,
  Data_assunzione DATE,
  Salario         DECIMAL(6, 2) UNSIGNED
);

INSERT INTO Dipendente (Id_dipendente, Impiego, Nome, Cognome, Data_assunzione, Salario) VALUES
  ('oN95g4zNlVdHpdPU6TWa', 'Direttore', 'Mario', 'Lamborghini', NULL, 4000),
  ('CmqYEkmd0qZyc1fnbt7X', 'Keeper', 'Concetta', 'Leone', '2017-07-21', 2200),
  ('s2zeyv1pnEkcyMTNmthD', 'Keeper', 'Pasquale', 'Esposito', '2009-05-27', 2200),
  ('6bXDGejOWzjxryqbIPTT', 'Keeper', 'Domenico', 'De Luca', '2013-10-25', 2200),
  ('rhIjZPX4sw4znAChyCYR', 'Keeper', 'Rosa', 'Caruso', '2016-12-23', 2200),
  ('Trcz73OHLQdTPjfucGb1', 'Veterinario', 'Raffaele', 'Perrotta', '2007-05-09', 2500),
  ('LxwhzFFLQ8wPdQgAW80o', 'Veterinario', 'Vincenzo', 'Scala', '2008-05-28', 2500),
  ('QjQMaljH5PthhdL2z970', 'Veterinario', 'Giuseppe', 'Garofalo', '2016-01-11', 2500),
  ('GCKiomh1fRVz8fPacomX', 'Cassiere', 'Michele', 'Cozzolino', '2017-02-02', 1400),
  ('QMXo7PWOVHMkDPj5FCyL', 'Cassiere', 'Ciro', 'De Angelis', '2008-02-15', 1400),
  ('k8uHwzVFKOgbN7vOGuO8', 'Cassiere', 'Anna', 'Grimaldi', '2012-09-06', 1400),
  ('dFOhOyxEYpHFFVspe2DK', 'Mascotte', 'Antonio', 'Orlando', '2011-03-01', 1100),
  ('eJeeLcw4SXKFjVHv18VR', 'Ricercatore', 'Luigi', 'Barbieri', NULL, NULL),
  ('qCQ4nSmRGuvQ6YHq79BU', 'Ricercatore', 'Aurelio', 'Cosentino', NULL, NULL);

-- Creazione e popolamento tabella Area
CREATE TABLE Area (
  Id_area INTEGER(2) PRIMARY KEY,
  Nome    ENUM ('Europa', 'Madagascar', 'Oceania', 'Africa', 'Asia', 'America', 'Borealia', 'Rettilario', 'Amazzonia') NOT NULL
);

INSERT INTO Area (Id_area, Nome) VALUES
  (1, 'Europa'),
  (2, 'Madagascar'),
  (3, 'Oceania'),
  (4, 'Africa'),
  (5, 'Asia'),
  (6, 'America'),
  (7, 'Borealia'),
  (8, 'Rettilario'),
  (9, 'Amazzonia');

-- Creazione e popolamento tabella Gabbia
CREATE TABLE Gabbia (
  Id_gabbia      INTEGER(2) PRIMARY KEY,
  Id_area        INTEGER(2)  NOT NULL,
  Giorno_pulizia VARCHAR(10) NOT NULL,
  Capienza       INTEGER(2)  NOT NULL,
  FOREIGN KEY (Id_area) REFERENCES Area (Id_area)
);

INSERT INTO Gabbia (Id_gabbia, Id_area, Giorno_pulizia, Capienza) VALUES
  (1, 4, 'Lunedì', 6),
  (2, 4, 'Lunedì', 8),
  (3, 4, 'Lunedì', 6),
  (4, 4, 'Lunedì', 6),
  (5, 4, 'Lunedì', 4),
  (6, 5, 'Martedì', 10),
  (7, 5, 'Martedì', 10),
  (8, 5, 'Martedì', 10),
  (9, 5, 'Martedì', 6),
  (10, 6, 'Mercoledì', 6),
  (11, 6, 'Mercoledì', 6),
  (12, 6, 'Mercoledì', 8),
  (13, 6, 'Mercoledì', 8),
  (14, 7, 'Giovedì', 8),
  (15, 7, 'Giovedì', 5),
  (16, 1, 'Giovedì', 5),
  (17, 1, 'Giovedì', 6),
  (18, 1, 'Giovedì', 10),
  (19, 1, 'Giovedì', 8),
  (20, 8, 'Venerdì', 8),
  (21, 8, 'Venerdì', 6),
  (22, 8, 'Venerdì', 10),
  (23, 2, 'Venerdì', 10),
  (24, 2, 'Venerdì', 8),
  (25, 2, 'Venerdì', 6),
  (26, 3, 'Sabato', 6),
  (27, 3, 'Sabato', 7),
  (28, 3, 'Sabato', 9),
  (29, 3, 'Sabato', 9),
  (30, 9, 'Sabato', 7);

-- Creazione e popolamento tabella Animale
CREATE TABLE Animale (
  Id_animale   VARCHAR(10) PRIMARY KEY,
  Id_gabbia    INTEGER(2)  NOT NULL,
  Nome_comune  VARCHAR(40) NOT NULL,
  Specie       VARCHAR(40) NOT NULL,
  Classe       VARCHAR(20) NOT NULL,
  Ordine       VARCHAR(20) NOT NULL,
  Famiglia     VARCHAR(20) NOT NULL,
  Sesso        VARCHAR(1)  NOT NULL,
  Eta          INTEGER(3)  NOT NULL,
  Data_arrivo  DATE,
  Data_nascita DATE,
  FOREIGN KEY (Id_gabbia) REFERENCES Gabbia (Id_gabbia)
);

INSERT INTO Animale (Id_animale, Id_gabbia, Nome_comune, Specie, Classe, Ordine, Famiglia, Sesso, Eta, Data_arrivo, Data_nascita)
VALUES
  ('HdTiQWoA9W', 1, 'Ghepardo', 'Acinonyx jubatus', 'Mammiferi ', 'Carnivori', 'Felidi', 'M', 10, '2009-01-04', NULL),
  ('MHJsAQyjgG', 2, 'Leone', 'Panthera Leo', 'Mammiferi', 'Carnivori', 'Felidi', 'F', 8, '2013-04-18', NULL),
  ('WbLcpsGLaf', 3, 'Suricato', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'F', 6, '2013-03-06', NULL),
  ('eDTtjdNin5', 3, 'Suricato', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'M', 7, '2014-01-06', NULL),
  ('kX5i77fSzA', 3, 'Suricato', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'F', 4, NULL, '2014-08-14'),
  ('HPIXIo1wks', 3, 'Suricato', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'M', 4, NULL, '2014-08-14'),
  ('MIcfKnp4jw', 4, 'Sitatunga', 'Tragelaphus spekii', 'Mammiferi', 'Cetartiodattili', 'Bovidi', 'F', 7, '2015-09-24', NULL),
  ('SFSUCvPTVr', 5, 'Ippopotamo', 'Hippopotamus amphibius', 'Mammiferi', 'Cetartiodattili', 'Ippopotamidi', 'M', 25, '2008-10-07', NULL),
  ('84Y5MnUCTq', 6, 'Avvoltoio reale indiano', 'Sarcogyps calvus', 'Uccelli', 'Falconiformi', 'Accipitridi', 'F', 8, '2013-07-02', NULL),
  ('2ctKyYVXlI', 7, 'Cicogna nera', 'Ciconia nigra', 'Uccelli', 'Ciconiformi', 'Ciconidi', 'M', 3, '2016-09-18', NULL),
  ('hpMwkJvIve', 8, 'Tigre siberiana', 'Panthera tigris altaica', 'Mammiferi', 'Carnivori', 'Felidi', 'M', 5, '2016-12-27', NULL),
  ('Q7m2kWM8Sd', 9, 'Panda minore', 'Ailurus fulgens', 'Mammiferi', 'Carnivori', 'Ailuridi', 'M', 5, '2015-11-21', NULL),
  ('bxvED46kas', 9, 'Panda minore', 'Ailurus fulgens', 'Mammiferi', 'Carnivori', 'Ailuridi', 'F', 6, '2014-03-13', NULL),
  ('3PJZtjcCJt', 9, 'Panda minore', 'Ailurus fulgens', 'Mammiferi', 'Carnivori', 'Ailuridi', 'F', 1, NULL, '2017-09-28'),
  ('irO3Vltmml', 10, 'Tamarino imperatore', 'Saguinus imperator', 'Mammiferi', 'Primati', 'Callitricidi', 'M', 5, '2014-04-22', NULL),
  ('jtFscxRO5t', 11, 'Bradipo bidattilo', 'Choloepus didactylus', 'Mammiferi', 'Pelosi', 'Megalonichidi', 'F', 9, '2014-06-04', NULL),
  ('TbcP2i3xmO', 12, 'Ocelot', 'Leopardus pardalis', 'Mammiferi', 'Carnivori', 'Felidi', 'M', 7, '2014-09-29', NULL),
  ('jBFcSqp3BX', 12, 'Ocelot', 'Leopardus pardalis', 'Mammiferi', 'Carnivori', 'Felidi', 'F', 7, '2014-09-29', NULL),
  ('PH8ZfieJDX', 12, 'Ocelot', 'Leopardus pardalis', 'Mammiferi', 'Carnivori', 'Felidi', 'M', 3, NULL, '2015-05-21'),
  ('vV3FcbzsLg', 13, 'Saki dalla faccia bianca', 'Pithecia pithecia', 'Mammiferi', 'Primati', 'Pitecidi', 'F', 5, '2016-04-28', NULL),
  ('R753WCRVgU', 14, 'Gufo delle nevi', 'Bubo scandiaca', 'Uccelli', 'Strigiformi', 'Strigidi', 'F', 8, '2011-08-16', NULL),
  ('F3qhgwfr10', 15, 'Renna', 'Rangifer tarandus', 'Mammiferi', 'Cetartiodattili', 'Cervidi', 'M', 14, '2008-07-08', NULL),
  ('GzXDREfWga', 16, 'Fenicottero rosa', 'Phoenicopterus roseus', 'Uccelli', 'Fenicotteriformi', 'Fenicotteridi', 'M', 4, '2015-04-20', NULL),
  ('I3VA0OxptO', 17, 'Lupo', 'Canis lupus', 'Mammiferi', 'Carnivori', 'Canidi', 'M', 9, '2011-01-24', NULL),
  ('DclNtLzG7e', 18, 'Ibis eremita', 'Geronticus eremita', 'Uccelli', 'Ciconiformi', 'Treskionitidi', 'F', 5, '2015-04-20', NULL),
  ('0sOzX0NdSz', 19, 'Bisonte europeo', 'Bison bonasus', 'Mammiferi', 'Cetartiodattili', 'Bovidi', 'F', 12, '2016-12-26', NULL),
  ('AJbJGeeEDR', 20, 'Gerrosauro maggiore', 'Gerrhosaurus major', 'Rettili', 'Squamati', 'Gerrhosauridae', 'M', 1, '2018-01-29', NULL),
  ('rs7Fq26XFs', 21, 'Pitone reale', 'Phyton regius', 'Rettili', 'Squamati', 'Phytonidae', 'F', 10, '2010-08-06', NULL),
  ('Gkr0sTJObZ', 22, 'Anaconda giallo', 'Rangifer tarandus', 'Rettili', 'Squamati', 'Boidi', 'M', 12, '2008-07-08', NULL),
  ('5Jv2qjqfCw', 23, 'Lemure catta', 'Lemur catta', 'Mammiferi', 'Primati', 'Lemuridi', 'M', 6, '2013-10-21', NULL),
  ('dRa5fddNaf', 24, 'Vasa Maggiore', 'Cryptoprocta ferox', 'Uccelli', 'Psittaciformi', 'Psittacidi', 'F', 5, '2014-08-06', NULL),
  ('BfK4NUmdHs', 25, 'Fossa', 'Rangifer tarandus', 'Mammiferi', 'Carnivori', 'Eupleridi', 'M', 4, '2016-08-25', NULL),
  ('cJNP4BnoRo', 26, 'Wallaby dal collo rosso', 'Macropus rufogriseus', 'Mammiferi', 'Diprotodonti', 'Macropodidi', 'F',
    8, '2017-01-16', NULL),
  ('axqHPe6ocq', 27, 'Emù', 'Dromaius novaehollandiae', 'Uccelli', 'Struzioniformi', 'Dromaidi', 'F', 5, '2014-07-08',
    NULL),
  ('UNjwm0Wygt', 28, 'Gru antigone', 'Grus antigone', 'Uccelli', 'Gruiformi', 'Gruidi', 'F', 3, '2018-02-27', NULL),
  ('l81E5IQy3x', 29, 'Casuario', 'Casuarius casuarius', 'Uccelli', 'Struzioniformi', 'Casuaridi', 'M', 3, '2017-01-16',
    NULL),
  ('ZEmxJIAKi2', 30, 'Ara ali verdi', 'Ara chloropterus', 'Uccelli', 'Psittaciformi', 'Psittacidi', 'M', 5,
    '2014-01-10', NULL),
  ('BajCeOxfQK', 30, 'Ara ali verdi', 'Ara chloropterus', 'Uccelli', 'Psittaciformi', 'Psittacidi', 'F', 4,
    '2015-08-20', NULL),
  ('J3O8iLozhO', 30, 'Ara ali verdi', 'Ara chloropterus', 'Uccelli', 'Psittaciformi', 'Psittacidi', 'M', 2, NULL,
    '2016-07-27');

-- Creazione e popolamento tabella Controllo_medico
CREATE TABLE Controllo_medico (
  Id_animale     VARCHAR(10)   NOT NULL,
  Id_veterinario VARCHAR(20)   NOT NULL,
  Giorno         DATE          NOT NULL,
  Peso           DECIMAL(5, 2) NOT NULL,
  Malattia       INTEGER       NOT NULL,
  FOREIGN KEY (Id_animale) REFERENCES Animale (Id_animale),
  FOREIGN KEY (Id_veterinario) REFERENCES Dipendente (Id_dipendente),
  PRIMARY KEY (Id_animale, Giorno, Id_veterinario)
);

INSERT INTO Controllo_medico (Id_animale, Id_veterinario, Giorno, Peso, Malattia) VALUES
  ('WbLcpsGLaf', 'Trcz73OHLQdTPjfucGb1', '2018-06-04', 1, 1),
  ('eDTtjdNin5', 'Trcz73OHLQdTPjfucGb1', '2018-06-04', 0.6, 0),
  ('kX5i77fSzA', 'Trcz73OHLQdTPjfucGb1', '2018-06-05', 0.8, 0),
  ('HPIXIo1wks', 'Trcz73OHLQdTPjfucGb1', '2018-06-05', 1, 0),
  ('HdTiQWoA9W', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-07', 46, 0),
  ('MHJsAQyjgG', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-08', 150, 0),
  ('MHJsAQyjgG', 'LxwhzFFLQ8wPdQgAW80o', '2018-03-20', 145, 0),
  ('MHJsAQyjgG', 'LxwhzFFLQ8wPdQgAW80o', '2018-02-15', 143, 0),
  ('MHJsAQyjgG', 'LxwhzFFLQ8wPdQgAW80o', '2018-02-05', 143, 1),
  ('MHJsAQyjgG', 'LxwhzFFLQ8wPdQgAW80o', '2017-12-18', 140, 0),
  ('MIcfKnp4jw', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-09', 76, 0),
  ('SFSUCvPTVr', 'QjQMaljH5PthhdL2z970', '2018-05-18', 1600, 0),
  ('84Y5MnUCTq', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-18', 7, 0),
  ('2ctKyYVXlI', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-19', 3, 0),
  ('hpMwkJvIve', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-20', 200, 0),
  ('Q7m2kWM8Sd', 'Trcz73OHLQdTPjfucGb1', '2018-04-20', 5, 0),
  ('bxvED46kas', 'Trcz73OHLQdTPjfucGb1', '2018-04-21', 6, 0),
  ('3PJZtjcCJt', 'Trcz73OHLQdTPjfucGb1', '2018-04-22', 4, 0),
  ('irO3Vltmml', 'Trcz73OHLQdTPjfucGb1', '2018-04-23', 0.5, 0),
  ('jtFscxRO5t', 'QjQMaljH5PthhdL2z970', '2018-04-24', 4, 0),
  ('TbcP2i3xmO', 'QjQMaljH5PthhdL2z970', '2018-04-25', 10, 0),
  ('jBFcSqp3BX', 'QjQMaljH5PthhdL2z970', '2018-04-26', 12, 0),
  ('PH8ZfieJDX', 'Trcz73OHLQdTPjfucGb1', '2018-05-25', 11, 0),
  ('vV3FcbzsLg', 'Trcz73OHLQdTPjfucGb1', '2018-05-26', 3, 0),
  ('R753WCRVgU', 'LxwhzFFLQ8wPdQgAW80o', '2018-05-26', 2, 0),
  ('F3qhgwfr10', 'Trcz73OHLQdTPjfucGb1', '2018-03-09', 120, 0),
  ('GzXDREfWga', 'Trcz73OHLQdTPjfucGb1', '2018-03-10', 3, 0),
  ('I3VA0OxptO', 'QjQMaljH5PthhdL2z970', '2018-03-10', 50, 0),
  ('DclNtLzG7e', 'Trcz73OHLQdTPjfucGb1', '2018-03-12', 1.2, 0),
  ('0sOzX0NdSz', 'Trcz73OHLQdTPjfucGb1', '2018-03-13', 600, 1),
  ('AJbJGeeEDR', 'LxwhzFFLQ8wPdQgAW80o', '2018-03-12', 0.3, 0),
  ('rs7Fq26XFs', 'Trcz73OHLQdTPjfucGb1', '2018-03-22', 4, 0),
  ('Gkr0sTJObZ', 'Trcz73OHLQdTPjfucGb1', '2018-03-23', 30, 0),
  ('5Jv2qjqfCw', 'Trcz73OHLQdTPjfucGb1', '2018-03-24', 2, 0),
  ('dRa5fddNaf', 'QjQMaljH5PthhdL2z970', '2018-02-27', 0.5, 0),
  ('BfK4NUmdHs', 'LxwhzFFLQ8wPdQgAW80o', '2018-02-26', 8, 0),
  ('cJNP4BnoRo', 'LxwhzFFLQ8wPdQgAW80o', '2018-03-01', 15, 0),
  ('axqHPe6ocq', 'LxwhzFFLQ8wPdQgAW80o', '2018-03-02', 37, 0),
  ('UNjwm0Wygt', 'LxwhzFFLQ8wPdQgAW80o', '2018-03-03', 5, 0),
  ('l81E5IQy3x', 'Trcz73OHLQdTPjfucGb1', '2018-06-01', 30, 0),
  ('ZEmxJIAKi2', 'QjQMaljH5PthhdL2z970', '2018-06-05', 1, 1),
  ('BajCeOxfQK', 'QjQMaljH5PthhdL2z970', '2018-06-05', 0.8, 0),
  ('J3O8iLozhO', 'QjQMaljH5PthhdL2z970', '2018-06-05', 0.6, 0);

-- Creazione e popolamento tabella Merce
CREATE TABLE Merce (
  Id_merce VARCHAR(10) PRIMARY KEY,
  Prezzo   DECIMAL(4, 2) NOT NULL,
  Tipo     VARCHAR(20)   NOT NULL
);

INSERT INTO Merce (Id_merce, Prezzo, Tipo) VALUES
  ('YTp4J4jhrd', 7, 'poster'),
  ('uQQMbQ67VE', 10, 'poster'),
  ('bG9S9RPgFb', 15, 'poster'),
  ('J4XsbIpinC', 20, 'poster'),
  ('0MrCMks8T9', 25, 'poster'),
  ('J4DzcwrMdW', 20, 'felpa'),
  ('mKrzcSvTWk', 15, 'maglietta'),
  ('hOgorqUmUs', 15, 'maglietta'),
  ('0W6w2Vn25l', 5, 'berretto'),
  ('TLzQym7YuH', 8, 'berretto'),
  ('ucnzo5hWst', 15.50, 'libro'),
  ('i5JbdlAqGO', 1.50, 'matita'),
  ('578JFaG5eI', 2.50, 'penna');

-- Creazione e popolamento tabella Negozio_souvenir
CREATE TABLE Negozio_souvenir (
  Id_merce VARCHAR(10) NOT NULL,
  Quantita INTEGER(3),
  FOREIGN KEY (Id_merce) REFERENCES Merce (Id_merce)
);

INSERT INTO Negozio_souvenir (Id_merce, Quantita) VALUES
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