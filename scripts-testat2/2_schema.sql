-- Yanick Egli, Gaëtan Allemann
/*
 * CREATE TABLES based on UML
 */

CREATE TABLE person (
  name VARCHAR(255) NOT NULL,
  vorname VARCHAR(255) NOT NULL,
  adresse VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  telefonnummer VARCHAR(255) NOT NULL
);

CREATE TABLE mitarbeiter (
  mitarbeiter_nummer INTEGER PRIMARY KEY REFERENCES person(id),
  abteilung VARCHAR(255) NOT NULL,
  anstellungsdatum DATE NOT NULL
);

CREATE TABLE verkäufer (id INTEGER PRIMARY KEY REFERENCES mitarbeiter(id));

CREATE TABLE kunde (kunden_nummer INTEGER PRIMARY KEY REFERENCES person(id));

CREATE TABLE standort (
  stadt VARCHAR(255) NOT NULL
);

CREATE TABLE fahrzeug (
  fahrgestell_nummer INTEGER PRIMARY KEY,
  hersteller VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  baujahr INTEGER NOT NULL,
  preis DECIMAL NOT NULL
);

CREATE TABLE vertrag (
  verkaufsdatum DATE NOT NULL,
  zahlungsdatum DATE NOT NULL
);
