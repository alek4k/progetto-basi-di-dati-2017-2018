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
SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS Zoo;
DROP TABLE IF EXISTS Orario;
DROP TABLE IF EXISTS Biglietto;
DROP TABLE IF EXISTS Visitatore;
DROP TABLE IF EXISTS Parcheggio;
DROP TABLE IF EXISTS Dipendenti;
DROP TABLE IF EXISTS Area;
DROP TABLE IF EXISTS Gabbia;
DROP TABLE IF EXISTS Animale;
DROP TABLE IF EXISTS Merce;
DROP TABLE IF EXISTS NegozioSouvenir;

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

-- Creazione e popolamento tabella Biglietto
CREATE TABLE Biglietto (
  Id_biglietto VARCHAR(15) PRIMARY KEY,
  Tipo         VARCHAR(10)   NOT NULL,
  Prezzo       DECIMAL(5, 2) NOT NULL
);

INSERT INTO Biglietto (Id_biglietto, Tipo, Prezzo) VALUES
  ('Ri17c0NP2CvbSeR', 'Baby', 3.00),
  ('hB7zHgcbWYD4Oht', 'Ragazzo', 15.00),
  ('ToUc7S0wUu0d5xs', 'Senior', 18.00),
  ('NHZSfAKvtpsyRXH', 'Adulti', 20.00),
  ('M9YwZ5B5ZbK2OKo', 'Ragazzo', 15.00),
  ('NoPgTCJyd4isueq', 'Baby', 3.00),
  ('gAlaV138wek4mFN', 'Ragazzo', 15.00),
  ('vOPm5vqoNj2PXha', 'Senior', 18.00),
  ('AgldIAZrTbEQfuW', 'Ragazzo', 15.00),
  ('H28LwzbF2CTQgC2', 'Adulti', 20.00);

-- Creazione e popolamento tabella Visitatore
CREATE TABLE Visitatore (
  Id_visitatore VARCHAR(15),
  FOREIGN KEY (Id_visitatore) REFERENCES Biglietto (Id_biglietto)
);

INSERT INTO Visitatore (Id_visitatore) VALUES
  ('Ri17c0NP2CvbSeR'),
  ('hB7zHgcbWYD4Oht'),
  ('ToUc7S0wUu0d5xs'),
  ('NHZSfAKvtpsyRXH'),
  ('M9YwZ5B5ZbK2OKo'),
  ('NoPgTCJyd4isueq'),
  ('gAlaV138wek4mFN'),
  ('vOPm5vqoNj2PXha'),
  ('AgldIAZrTbEQfuW'),
  ('H28LwzbF2CTQgC2');

-- Creazione e popolamento tabella Parcheggio
CREATE TABLE Parcheggio (
  Id_parcheggio VARCHAR(15),
  Categoria     VARCHAR(10) NOT NULL,
  Prezzo        DECIMAL(4, 2),
  PRIMARY KEY (Id_parcheggio, Categoria)
);

INSERT INTO Parcheggio (Id_parcheggio, Categoria, Prezzo) VALUES
  ('P1', 'Motocicli', 2.00),
  ('P2', 'Automobili', 4.00),
  ('P2', 'Camper', 5.00),
  ('P3', 'Autobus', NULL),
  ('P3', 'Disabili', NULL);

-- Creazione e popolamento tabella Dipendenti
CREATE TABLE Dipendenti (
  Id_dipendente  VARCHAR(20) PRIMARY KEY,
  Descrizione    ENUM ('Direttore', 'Keeper', 'Veterinario', 'Cassiere', 'Mascotte', 'Ricercatore') NOT NULL,
  Nome           VARCHAR(30)                                                                        NOT NULL,
  Cognome        VARCHAR(30)                                                                        NOT NULL,
  DataAssunzione DATE,
  Salario        DECIMAL(6, 2) UNSIGNED
);

INSERT INTO Dipendenti (Id_dipendente, Descrizione, Nome, Cognome, DataAssunzione, Salario) VALUES
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
  Id_gabbia      VARCHAR(2) PRIMARY KEY,
  Id_area        INTEGER(2)  NOT NULL,
  Id_animale     VARCHAR(10) NOT NULL,
  Giorno_pulizia VARCHAR(10) NOT NULL,
  FOREIGN KEY (Id_area) REFERENCES Area (Id_area)
);

INSERT INTO Gabbia (Id_gabbia, Id_area, Giorno_pulizia) VALUES
  (1, 4, 'Lunedì'),
  (2, 4, 'Lunedì'),
  (3, 4, 'Lunedì'),
  (4, 4, 'Lunedì'),
  (5, 4, 'Lunedì'),
  (6, 5, 'Martedì'),
  (7, 5, 'Martedì'),
  (8, 5, 'Martedì'),
  (9, 5, 'Martedì'),
  (10, 6, 'Mercoledì'),
  (11, 6, 'Mercoledì'),
  (12, 6, 'Mercoledì'),
  (13, 6, 'Mercoledì'),
  (14, 7, 'Giovedì'),
  (15, 7, 'Giovedì'),
  (16, 1, 'Giovedì'),
  (17, 1, 'Giovedì'),
  (18, 1, 'Giovedì'),
  (19, 1, 'Giovedì'),
  (20, 8, 'Venerdì'),
  (21, 8, 'Venerdì'),
  (22, 8, 'Venerdì'),
  (23, 2, 'Venerdì'),
  (24, 2, 'Venerdì'),
  (25, 2, 'Venerdì'),
  (26, 3, 'Sabato'),
  (27, 3, 'Sabato'),
  (28, 3, 'Sabato'),
  (29, 3, 'Sabato'),
  (30, 9, 'Sabato');

-- Creazione e popolamento tabella Animale
CREATE TABLE Animale (
  Id_animale       VARCHAR(10) PRIMARY KEY,
  Id_gabbia        VARCHAR(15) NOT NULL,
  Nome_comune      VARCHAR(40) NOT NULL,
  Nome_scientifico VARCHAR(40) NOT NULL,
  Classe           VARCHAR(20) NOT NULL,
  Ordine           VARCHAR(20) NOT NULL,
  Famiglia         VARCHAR(20) NOT NULL,
  Sesso            VARCHAR(1)  NOT NULL,
  Eta              INTEGER(3)  NOT NULL,
  Data_arrivo      DATE,
  Data_nascita     DATE,
  FOREIGN KEY (Id_gabbia) REFERENCES Gabbia (Id_gabbia)
);

INSERT INTO Animale (Id_animale, Id_gabbia, Nome_comune, Nome_scientifico, Classe, Ordine, Famiglia, Sesso, Eta, Data_arrivo, Data_nascita)
VALUES
  ('HdTiQWoA9W', 1, 'Ghepardo', 'Acinonyx jubatus', 'Mammiferi ', 'Carnivori', 'Felidi', 'M', 10, '2009-01-04', NULL),
  ('MHJsAQyjgG', 2, 'Leone', 'Panthera Leo', 'Mammiferi', 'Carnivori', 'Felidi', 'F', 8, '2013-04-18', NULL),
  ('WbLcpsGLaf', 3, 'Suricata', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'F', 6, '2013-03-06', NULL),
  ('eDTtjdNin5', 3, 'Suricata', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'M', 7, '2014-01-06', NULL),
  ('kX5i77fSzA', 3, 'Suricata', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'F', 4, NULL, '2014-08-14'),
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

-- Creazione e popolamento tabella NegozioSouvenir
CREATE TABLE NegozioSouvenir (
  Id_merce VARCHAR(10) NOT NULL,
  Quantita INTEGER(3),
  FOREIGN KEY (Id_merce) REFERENCES Merce (Id_merce)
);

INSERT INTO NegozioSouvenir (Id_merce, Quantita) VALUES
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