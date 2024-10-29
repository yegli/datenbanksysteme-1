-- Yanick Egli, Gaëtan Allemann
/*
 * CREATE TABLES based on UML
 */

CREATE TABLE person ( --Needs Constraint: fk_kunde exclusive or fk_mitarbeiter
  id INTEGER PRIMARY KEY NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  vorname VARCHAR(255) NOT NULL,
  adresse VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  telefonnummer VARCHAR(255) NOT NULL,
  fk_kunde INTEGER UNIQUE,
  fk_mitarbeiter INTEGER UNIQUE
);

CREATE TABLE mitarbeiter (
  mitarbeiter_nummer INTEGER PRIMARY KEY,
  abteilung VARCHAR(255) NOT NULL,
  anstellungsdatum DATE NOT NULL
);

CREATE TABLE verkaeufer (
  id INTEGER PRIMARY KEY NOT NULL UNIQUE,
  fk_mitarbeiter INTEGER NOT NULL UNIQUE,
  fk_standort INTEGER NOT NULL
  );

CREATE TABLE kunde (
  kunden_nummer INTEGER PRIMARY KEY NOT NULL UNIQUE
  );

CREATE TABLE standort (
  id INTEGER PRIMARY KEY NOT NULL UNIQUE,
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
  id INTEGER PRIMARY KEY NOT NULL UNIQUE,
  verkaufsdatum DATE NOT NULL,
  zahlungsdatum DATE NOT NULL,
  fk_fahrzeug INTEGER UNIQUE,
  fk_kunde INTEGER NOT NULL

);

CREATE TABLE kunde_fahrzeug ( --Needs Constraint: No Duplicates
  id INTEGER PRIMARY KEY,
  fk_kunde INTEGER NOT NULL,
  fk_fahrzeug INTEGER NOT NULL  
);