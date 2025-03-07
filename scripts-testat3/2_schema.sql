-- Yanick Egli, Gaëtan Allemann
/*
 * CREATE TABLES based on UML
 */

CREATE TABLE person (
  id INTEGER,
  type INTEGER NOT NULL, -- is person a "kunde" or a "mitarbeiter" 1 = "kunde" 0 = "mitarbeiter"
  PRIMARY KEY (id, type),
  name VARCHAR(255) NOT NULL,
  vorname VARCHAR(255) NOT NULL,
  adresse VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  telefonnummer VARCHAR(255) NOT NULL
);

CREATE TABLE mitarbeiter (
  mitarbeiter_nummer INTEGER PRIMARY KEY, --fk for person
  type INTEGER NOT NULL, --needed because of person primary key | is there another option? fugging hell
  abteilung VARCHAR(255) NOT NULL,
  anstellungsdatum DATE NOT NULL
);

CREATE TABLE verkaeufer (
  id INTEGER PRIMARY KEY, --fk for mitarbeiter
  fk_standort INTEGER NOT NULL
  );

CREATE TABLE kunde (
  kunden_nummer INTEGER PRIMARY KEY, --fk for person
  type INTEGER NOT NULL --needed because of person primary key | is there another option?
  );

CREATE TABLE standort (
  id INTEGER PRIMARY KEY, -- fk for verkaeufer
  stadt VARCHAR(255) NOT NULL
);

CREATE TABLE fahrzeug (
  fahrgestell_nummer INTEGER PRIMARY KEY,
  hersteller VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  baujahr INTEGER NOT NULL,
  preis DECIMAL NOT NULL,
  fk_standort INTEGER NOT NULL
);

CREATE TABLE vertrag (
  id INTEGER PRIMARY KEY,
  verkaufsdatum DATE NOT NULL,
  zahlungsdatum DATE NOT NULL,
  fk_fahrzeug INTEGER UNIQUE,
  fk_kunde INTEGER NOT NULL

);

CREATE TABLE kunde_fahrzeug (
  fk_kunde INTEGER NOT NULL,
  fk_fahrzeug INTEGER NOT NULL,
  PRIMARY KEY (fk_kunde, fk_fahrzeug)
);