DROP TABLE IF EXISTS Zoo;
CREATE TABLE Zoo(
Telefono INTEGER(10) NOT NULL,
Email VARCHAR(40) NOT NULL,
Citta VARCHAR(40) NOT NULL,
Via VARCHAR(50) NOT NULL,
CAP INTEGER(10) NOT NULL
);

DROP TABLE IF EXISTS Orario;
CREATE TABLE Orario(
Giorno VARCHAR(10) NOT NULL,
Apertura TIME,
Chiusura TIME,
Inizio_periodo_chiusura DATE NOT NULL,
Fine_periodo_chiusura DATE NOT NULL
);

DROP TABLE IF EXISTS Visitatore;
CREATE TABLE Visitatore(
Id_visitatore VARCHAR(15),
FOREIGN KEY (Id_visitatore) REFERENCES Biglietto(Id_biglietto)
);

DROP TABLE IF EXISTS Biglietto;
CREATE TABLE Biglietto(
Id_biglietto VARCHAR(15) PRIMARY KEY,
Tipo VARCHAR(10) NOT NULL,
Prezzo DECIMAL(3,2) NOT NULL
);

DROP TABLE IF EXISTS Parcheggio;
CREATE TABLE Parcheggio(
Id_parcheggio VARCHAR(15) PRIMARY KEY,
Categoria VARCHAR(10) NOT NULL,
Prezzo DECIMAL(3,2) NOT NULL
);


DROP TABLE IF EXISTS TipoDipendenti;
CREATE TABLE TipoDipendenti(
Id_dipendente INTEGER PRIMARY KEY,
Descrizione ENUM('Direttore', 'Keeper', 'Veterinario', 'Cassiere', 'Mascotte', 'Ricercatore') NOT NULL
);

DROP TABLE IF EXISTS Dipendenti;
CREATE TABLE Dipendenti(
Id_dipendente VARCHAR(20) PRIMARY KEY,
Nome VARCHAR(30) NOT NULL,
Cognome VARCHAR(30) NOT NULL,
Citta VARCHAR(50), 
DataAssunzione DATE NOT NULL,
Salario DECIMAL(4,2) UNSIGNED NOT NULL,
Tipologia INTEGER,
FOREIGN KEY(Tipologia) REFERENCES TipoDipendenti(Id_dipendente)
);

DROP TABLE IF EXISTS Area;
CREATE TABLE Area(
Id_area VARCHAR(15) PRIMARY KEY,
Nome ENUM('Europa', 'Madagascar', 'Oceania', 'Africa', 'Asia', 'America', 'Borealia', 'Rettilario', 'Amazzonia', 'Chelonia', 'Extinction Park') NOT NULL,
Numero_gabbie INTEGER(2) NOT NULL,
Id_gabbia VARCHAR(15) NOT NULL,
FOREIGN KEY (Id_gabbia) REFERENCES Gabbia(Id_gabbia)
);

DROP TABLE IF EXISTS Gabbia;
CREATE TABLE Gabbia(
Id_gabbia VARCHAR(15) PRIMARY KEY,
Id_animale VARCHAR(15) NOT NULL,
Giorno_pulizia DATE NOT NULL,
FOREIGN KEY (Id_animale) REFERENCES Animale(Id_animale)
);

DROP TABLE IF EXISTS Animale;
CREATE TABLE Animale(
Id_animale VARCHAR(15) PRIMARY KEY,
Id_area VARCHAR(15) NOT NULL,
Id_gabbia VARCHAR(15) NOT NULL,
Genere VARCHAR(30) NOT NULL,
Specie VARCHAR(40) NOT NULL,
Sesso VARCHAR(1) NOT NULL,
Eta INTEGER(3) NOT NULL,
Origine VARCHAR(30) NOT NULL,
Data_arrivo DATE,
Data_nascita DATE,
FOREIGN KEY (Id_gabbia) REFERENCES Gabbia(Id_gabbia),
FOREIGN KEY (Id_area) REFERENCES Area(Id_area)
);

DROP TABLE IF EXISTS NegozioSouvenir;
CREATE TABLE NegozioSouvenir(
Id_dipendente VARCHAR(15) NOT NULL,
Id_merce VARCHAR(15) NOT NULL,
FOREIGN KEY (Id_merce) REFERENCES Merce(Id_merce)
);

DROP TABLE IF EXISTS Merce;
CREATE TABLE Merce(
Id_merce VARCHAR(15) PRIMARY KEY,
Prezzo DECIMAL(2,2) NOT NULL
);


