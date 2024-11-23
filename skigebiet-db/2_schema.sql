-- Yanick Egli
/*
 * CREATE TABLES based on UML
 */

CREATE TABLE skigebiet (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE restaurant (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  offen_ab TIME NOT NULL,
  offen_bis TIME NOT NULL,
  anzahl_plätze INTEGER NOT NULL,
  skigebiet INTEGER NOT NULL REFERENCES skigebiet -- is it required to add (id) here or not because it is the primary key
);

CREATE TABLE menukarte (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  restaurant INTEGER NOT NULL REFERENCES restaurant
);

CREATE TABLE gericht (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  preis INTEGER NOT NULL,
  ist_tagesmenu BOOLEAN NOT NULL
);

CREATE TABLE menukarte_gericht (
  menukarte INTEGER REFERENCES menukarte,
  gericht INTEGER REFERENCES gericht
);