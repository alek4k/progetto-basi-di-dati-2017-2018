DROP TABLE IF EXISTS Zoo;
DROP TABLE IF EXISTS Orario;
DROP TABLE IF EXISTS Visitatore;
DROP TABLE IF EXISTS Biglietto;
DROP TABLE IF EXISTS Parcheggio;
DROP TABLE IF EXISTS TipoDipendenti;
DROP TABLE IF EXISTS Dipendenti;
DROP TABLE IF EXISTS Area;
DROP TABLE IF EXISTS Gabbia;
DROP TABLE IF EXISTS Animale;
DROP TABLE IF EXISTS NegozioSouvenir;
DROP TABLE IF EXISTS Merce;

CREATE TABLE Zoo(
Telefono INTEGER(10) NOT NULL,
Email VARCHAR(40) NOT NULL,
Citta VARCHAR(40) NOT NULL,
Via VARCHAR(50) NOT NULL,
CAP INTEGER(10) NOT NULL
);

INSERT INTO Zoo (Telefono, Email, Citta, Via, CAP) VALUES
(0498844217, 'info@tropicalzoo.it', 'Napoli', 'Via Giovanni Brombeis 10', '80135');

CREATE TABLE Orario(
Giorno VARCHAR(10) NOT NULL,
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

CREATE TABLE Visitatore(
Id_visitatore VARCHAR(15),
FOREIGN KEY (Id_visitatore) REFERENCES Biglietto(Id_biglietto)
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

CREATE TABLE Biglietto(
Id_biglietto VARCHAR(15) PRIMARY KEY,
Tipo VARCHAR(10) NOT NULL,
Prezzo DECIMAL(3,2) NOT NULL
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

CREATE TABLE Parcheggio(
Id_parcheggio VARCHAR(15),
Categoria VARCHAR(10) NOT NULL,
Prezzo DECIMAL(2,2),
PRIMARY KEY (Id_parcheggio, Categoria)
);

INSERT INTO Parcheggio (Id_parcheggio, Categoria, Prezzo) VALUES
('P1', 'Motocicli', 2.00),
('P2', 'Automobili', 4.00),
('P2', 'Camper', 5.00),
('P3', 'Autobus', NULL),
('P3', 'Disabili', NULL);

CREATE TABLE TipoDipendenti(
Id_dipendente VARCHAR(20) PRIMARY KEY,
Descrizione ENUM('Direttore', 'Keeper', 'Veterinario', 'Cassiere', 'Mascotte', 'Ricercatore') NOT NULL
);

INSERT INTO TipoDipendenti (Id_dipendente, Descrizione) VALUES
('oN95g4zNlVdHpdPU6TWa', 'Direttore'),
('CmqYEkmd0qZyc1fnbt7X', 'Keeper'),
('s2zeyv1pnEkcyMTNmthD', 'Keeper'),
('6bXDGejOWzjxryqbIPTT', 'Keeper'),
('rhIjZPX4sw4znAChyCYR', 'Keeper'),
('Trcz73OHLQdTPjfucGb1', 'Veterinario'),
('LxwhzFFLQ8wPdQgAW80o', 'Veterinario'),
('QjQMaljH5PthhdL2z970', 'Veterinario'),
('GCKiomh1fRVz8fPacomX', 'Cassiere'),
('QMXo7PWOVHMkDPj5FCyL', 'Cassiere'),
('k8uHwzVFKOgbN7vOGuO8', 'Cassiere'),
('dFOhOyxEYpHFFVspe2DK', 'Mascotte'),
('eJeeLcw4SXKFjVHv18VR', 'Ricercatore'),
('qCQ4nSmRGuvQ6YHq79BU', 'Ricercatore');

CREATE TABLE Dipendenti(
Id_dipendente VARCHAR(20) PRIMARY KEY,
Nome VARCHAR(30) NOT NULL,
Cognome VARCHAR(30) NOT NULL,
DataAssunzione DATE,
Salario DECIMAL(4,2) UNSIGNED,
FOREIGN KEY(Id_dipendente) REFERENCES TipoDipendenti(Id_dipendente)
);

INSERT INTO Dipendenti (Id_dipendente, Nome, Cognome, DataAssunzione, Salario) VALUES
('oN95g4zNlVdHpdPU6TWa', 'Mario', 'Lamborghini', NULL, 4000),
('CmqYEkmd0qZyc1fnbt7X', 'Concetta', 'Leone', '2017-07-21', 2200),
('s2zeyv1pnEkcyMTNmthD', 'Pasquale', 'Esposito', '2009-05-27', 2200),
('6bXDGejOWzjxryqbIPTT', 'Domenico', 'De Luca', '2013-10-25', 2200),
('rhIjZPX4sw4znAChyCYR', 'Rosa', 'Caruso', '2016-12-23', 2200),
('Trcz73OHLQdTPjfucGb1', 'Raffaele', 'Perrotta', '2007-05-09', 2500),
('LxwhzFFLQ8wPdQgAW80o', 'Vincenzo', 'Scala', '2008-05-28', 2500),
('QjQMaljH5PthhdL2z970', 'Giuseppe', 'Garofalo', '2016-01-11', 2500),
('GCKiomh1fRVz8fPacomX', 'Michele', 'Cozzolino', '2017-02-02', 1400),
('QMXo7PWOVHMkDPj5FCyL', 'Ciro', 'De Angelis', '2008-02-15', 1400),
('k8uHwzVFKOgbN7vOGuO8', 'Anna', 'Grimaldi', '2012-09-06', 1400),
('dFOhOyxEYpHFFVspe2DK', 'Antonio', 'Orlando', '2011-03-01', 1100),
('eJeeLcw4SXKFjVHv18VR', 'Luigi', 'Barbieri', NULL, NULL),
('qCQ4nSmRGuvQ6YHq79BU', 'Aurelio', 'Cosentino', NULL, NULL);

CREATE TABLE Area(
Id_area INTEGER(2) PRIMARY KEY,
Nome ENUM('Europa', 'Madagascar', 'Oceania', 'Africa', 'Asia', 'America', 'Borealia', 'Rettilario', 'Amazzonia', 'Chelonia', 'Extinction Park') NOT NULL
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

CREATE TABLE Gabbia(
Id_gabbia VARCHAR(15) PRIMARY KEY,
Id_area INTEGER(2) NOT NULL,
Id_animale VARCHAR(10) NOT NULL,
Giorno_pulizia DATE NOT NULL,
FOREIGN KEY (Id_area) REFERENCES Area(Id_area),
FOREIGN KEY (Id_animale) REFERENCES Animale(Id_animale)
);

CREATE TABLE Animale(
Id_animale VARCHAR(10) PRIMARY KEY,
Id_area VARCHAR(15) NOT NULL,
Id_gabbia VARCHAR(15) NOT NULL,
Nome_comune VARCHAR(40) NOT NULL,
Nome_scientifico VARCHAR(40) NOT NULL,
Classe VARCHAR(20) NOT NULL,
Ordine VARCHAR(20) NOT NULL,
Famiglia VARCHAR(20) NOT NULL,
Sesso VARCHAR(1) NOT NULL,
Eta INTEGER(3) NOT NULL,
Data_arrivo DATE,
Data_nascita DATE,
FOREIGN KEY (Id_gabbia) REFERENCES Gabbia(Id_gabbia),
FOREIGN KEY (Id_area) REFERENCES Area(Id_area)
);

INSERT INTO Animale (Id_animale, Id_area, Id_gabbia, Nome_comune, Nome_scientifico, Classe, Ordine, Famiglia, Sesso, Eta, Data_arrivo, Data_nascita) VALUES
  ('HdTiQWoA9W', 4, NULL, 'Ghepardo', 'Acinonyx jubatus', 'Mammiferi ', 'Carnivori', 'Felidi', 'M', 10, '2009-01-04', NULL),
  ('MHJsAQyjgG', 4, NULL, 'Leone', 'Panthera Leo', 'Mammiferi', 'Carnivori', 'Felidi', 'F', 8, '2013-04-18', NULL),
  ('kX5i77fSzA', 4, NULL, 'Suricata', 'Suricata suricatta', 'Mammiferi', 'Carnivori', 'Erpestidi', 'F', 6, NULL, '2012-08-14'),
  ('MIcfKnp4jw', 4, NULL, 'Sitatunga', 'Tragelaphus spekii', 'Mammiferi', 'Cetartiodattili', 'Bovidi', 'F', 7, '2015-09-24', NULL),
  ('SFSUCvPTVr', 4, NULL, 'Ippopotamo', 'Hippopotamus amphibius', 'Mammiferi', 'Cetartiodattili', 'Ippopotamidi', 'M', 25, '2008-10-07', NULL),
  ('84Y5MnUCTq', 5, NULL, 'Avvoltoio reale indiano', 'Sarcogyps calvus', 'Uccelli', 'Falconiformi', 'Accipitridi', 'F', 8, '2013-07-02', NULL),
  ('2ctKyYVXlI', 5, NULL, 'Cicogna nera', 'Ciconia nigra', 'Uccelli', 'Ciconiformi', 'Ciconidi', 'M', 3, '2016-09-18', NULL),
  ('hpMwkJvIve', 5, NULL, 'Tigre siberiana', 'Panthera tigris altaica', 'Mammiferi', 'Carnivori', 'Felidi', 'M', 5, '2016-12-27', NULL),
  ('3PJZtjcCJt', 5, NULL, 'Panda minore', 'Ailurus fulgens', 'Mammiferi', 'Carnivori', 'Ailuridi', 'F', 3, NULL, '2015-09-28'),
  ('irO3Vltmml', 6, NULL, 'Tamarino imperatore', 'Saguinus imperator', 'Mammiferi', 'Primati', 'Callitricidi', 'M', 5, '2014-04-22', NULL),
  ('jtFscxRO5t', 6, NULL, 'Bradipo bidattilo', 'Choloepus didactylus', 'Mammiferi', 'Pelosi', 'Megalonichidi', 'F', 9, '2014-06-04', NULL),
  ('PH8ZfieJDX', 6, NULL, 'Ocelot', 'Leopardus pardalis', 'Mammiferi', 'Carnivori', 'Felidi', 'M', 3, NULL, '2015-05-21'),
  ('vV3FcbzsLg', 6, NULL, 'Saki dalla faccia bianca', 'Pithecia pithecia', 'Mammiferi', 'Primati', 'Pitecidi', 'F', 5, '2016-04-28', NULL),
  ('R753WCRVgU', 7, NULL, 'Gufo delle nevi', 'Bubo scandiaca', 'Uccelli', 'Strigiformi', 'Strigidi', 'F', 8, '2011-08-16', NULL),
  ('F3qhgwfr10', 7, NULL, 'Renna', 'Rangifer tarandus', 'Mammiferi', 'Cetartiodattili', 'Cervidi', 'M', 14, '2008-07-08', NULL),
  ('GzXDREfWga', 1, NULL, 'Fenicottero rosa', 'Phoenicopterus roseus', 'Uccelli', 'Fenicotteriformi', 'Fenicotteridi', 'M', 4, '2015-04-20', NULL),
  ('I3VA0OxptO', 1, NULL, 'Lupo', 'Canis lupus', 'Mammiferi', 'Carnivori', 'Canidi', 'M', 9, '2011-01-24', NULL),
  ('DclNtLzG7e', 1, NULL, 'Ibis eremita', 'Geronticus eremita', 'Uccelli', 'Ciconiformi', 'Treskionitidi', 'F', 5, '2015-04-20', NULL),
  ('0sOzX0NdSz', 1, NULL, 'Bisonte europeo', 'Bison bonasus', 'Mammiferi', 'Cetartiodattili', 'Bovidi', 'F', 12, '2016-12-26', NULL),
  ('AJbJGeeEDR', 8, NULL, 'Gerrosauro maggiore', 'Gerrhosaurus major', 'Rettili', 'Squamati', 'Gerrhosauridae', 'M', 1, NULL, '2018-01-29'),
  ('rs7Fq26XFs', 8, NULL, 'Pitone reale', 'Phyton regius', 'Rettili', 'Squamati', 'Phytonidae', 'F', 10, '2010-08-06', NULL),
  ('Gkr0sTJObZ', 8, NULL, 'Anaconda giallo', 'Rangifer tarandus', 'Rettili', 'Squamati', 'Boidi', 'M', 12, '2008-07-08', NULL),
  ('5Jv2qjqfCw', 2, NULL, 'Lemure catta', 'Lemur catta', 'Mammiferi', 'Primati', 'Lemuridi', 'M', 6, '2013-10-21', NULL),
  ('dRa5fddNaf', 2, NULL, 'Vasa Maggiore', 'Cryptoprocta ferox', 'Uccelli', 'Psittaciformi', 'Psittacidi', 'F', 5, '2014-08-06', NULL),
  ('BfK4NUmdHs', 2, NULL, 'Fossa', 'Rangifer tarandus', 'Mammiferi', 'Carnivori', 'Eupleridi', 'M', 4, '2016-08-25', NULL),
  ('cJNP4BnoRo', 3, NULL, 'Wallaby dal collo rosso', 'Macropus rufogriseus', 'Mammiferi', 'Diprotodonti', 'Macropodidi', 'F', 8, '2017-01-16', NULL),
  ('axqHPe6ocq', 3, NULL, 'Emù', 'Dromaius novaehollandiae', 'Uccelli', 'Struzioniformi', 'Dromaidi', 'F', 5, '2014-07-08', NULL),
  ('UNjwm0Wygt', 3, NULL, 'Gru antigone', 'Grus antigone', 'Uccelli', 'Gruiformi', 'Gruidi', 'F', 3, '2018-02-27', NULL),
  ('l81E5IQy3x', 3, NULL, 'Casuario', 'Casuarius casuarius', 'Uccelli', 'Struzioniformi', 'Casuaridi', 'M', 3, '2017-01-16', NULL),
  ('J3O8iLozhO', 9, NULL, 'Ara ali verdi', 'Ara chloropterus', 'Uccelli', 'Psittaciformi', 'Psittacidi', 'M', 2, NULL, '2016-07-27');

CREATE TABLE NegozioSouvenir(
Id_merce VARCHAR(10) NOT NULL,
Quantita INTEGER (3),
FOREIGN KEY (Id_merce) REFERENCES Merce(Id_merce)
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

CREATE TABLE Merce (
Id_merce VARCHAR(10) PRIMARY KEY,
Prezzo DECIMAL(2,2) NOT NULL,
Tipo VARCHAR (20) NOT NULL
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