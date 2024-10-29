/*
 * CREATE TABLES based on UML
 */

CREATE TABLE person (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  adresse VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  telefonnummer VARCHAR(255) NOT NULL
);

CREATE TABLE mitarbeiter (
  id INTEGER PRIMARY KEY REFERENCES person(id),
  abteilung VARCHAR(255) NOT NULL,
  anstellungsdatum DATE NOT NULL
);

CREATE TABLE verkäufer (id INTEGER PRIMARY KEY REFERENCES mitarbeiter(id));

CREATE TABLE kunde (id INTEGER PRIMARY KEY REFERENCES person(id));

CREATE TABLE standort (
  id INTEGER PRIMARY KEY,
  stadt VARCHAR(255) NOT NULL
);

CREATE TABLE fahrzeug (
  id INTEGER PRIMARY KEY,
  hersteller VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  baujahr INTEGER NOT NULL,
  preis DECIMAL NOT NULL,
  verfuegbarkeit BOOLEAN NOT NULL,
  standort_id INTEGER REFERENCES standort(id)
);

CREATE TABLE vertrag (
  id INTEGER PRIMARY KEY,
  verkaufsdatum DATE NOT NULL,
  zahlungsdatum DATE NOT NULL,
  kunden_id INTEGER NOT NULL REFERENCES kunde(id),
  fahrzeug_id INTEGER NOT NULL UNIQUE REFERENCES fahrzeug(id)  
);

CREATE TABLE fahrzeug_kunde (
  fahrzeug_id INTEGER NOT NULL REFERENCES fahrzeug(id),
  kunden_id INTEGER NOT NULL REFERENCES kunde(id),
  PRIMARY KEY (fahrzeug_id, kunden_id)
);
