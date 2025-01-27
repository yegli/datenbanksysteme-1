
CREATE TABLE abteilung (
    abtNr INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE abteilungsleitung (
  abtnr INTEGER PRIMARY KEY,
  abtchef INTEGER UNIQUE NOT NULL
);

CREATE TABLE angestellter (
    persnr INTEGER PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    tel INTEGER,
    salaer DECIMAL(7,2) DEFAULT 0,
    chef INTEGER,
    abtnr INTEGER NOT NULL,
    wohnort VARCHAR(20),
    eintrittsdatum DATE DEFAULT CURRENT_DATE,
    bonus DECIMAL(7,2) DEFAULT 0
);

CREATE TABLE projekt (
    projnr INTEGER PRIMARY KEY,
    bezeichnung VARCHAR(20),
    startzeit DATE,
    dauer INTEGER,
    aufwand INTEGER,
    projleiter INTEGER
);

CREATE TABLE projektzuteilung (
    persnr INTEGER NOT NULL,
    projnr INTEGER NOT NULL,
    zeitanteil INTEGER NOT NULL,
    startzeit DATE,
    dauer INTEGER,
    PRIMARY KEY(persnr, projnr)
);