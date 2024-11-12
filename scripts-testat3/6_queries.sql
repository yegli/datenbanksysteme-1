-- Yanick Egli, Gaëtan Allemann
/*
 * Queries erlauben die Prüfung der Funktionalität der Datenbank.
 */

/* Eine Query mit DISTINCT inklusive Begründung:
 * Distinct da ansonsten duplikate Abteilungsnamen zurückgegeben werden. */
SELECT DISTINCT abteilung FROM mitarbeiter;

/* Eine Query mit einem JOIN über drei oder mehr Tabellen */
SELECT 
    person.name, 
    vertrag.verkaufsdatum, 
    fahrzeug.model 
FROM fahrzeug
INNER JOIN vertrag ON fahrzeug.fahrgestell_nummer = vertrag.id
INNER JOIN kunde ON vertrag.fk_kunde = kunde.kunden_nummer
INNER JOIN person ON kunde.kunden_nummer = person.fk_kunde;

/* Eine Query mit Unterabfrage*/
/* korreliert oder unkorreliert? */
    


/* Eine Query mit entweder ANY, IN, EXISTS oder ALL gegebenenfalls mit NOT davor*/
/*Alle Autos auf der Wunschliste von einem bestimmten Kunden resp. dessen ID*/
SELECT 
    hersteller, 
    model, 
    fahrgestell_nummer, 
    person.vorname,
    person.name
FROM fahrzeug 
INNER JOIN kunde_fahrzeug ON kunde_fahrzeug.fk_fahrzeug = fahrzeug.fahrgestell_nummer
INNER JOIN person ON person.id = kunde_fahrzeug.fk_kunde --It's scuffed I know
WHERE EXISTS (
    SELECT kunde_fahrzeug.fk_kunde, kunde_fahrzeug.fk_fahrzeug 
    WHERE kunde_fahrzeug.fk_kunde = 1);

/* Eine Query bei der ein OUTER JOIN erforderlich ist */
/*Alle Mitarbeiter die keine Verkäufer sind*/
SELECT
    person.vorname,
    person.name
From mitarbeiter
LEFT JOIN verkaeufer on mitarbeiter.mitarbeiter_nummer = verkaeufer.fk_mitarbeiter
INNER JOIN person on mitarbeiter.mitarbeiter_nummer = person.fk_mitarbeiter;

/* Eine Querry die Datensätze aufgrund eines Datums und/oder Zeitangabe liefert */
/*Alle Autos die im Jahr 2022 verkauft wurden*/
SELECT
    fahrzeug.hersteller,
    fahrzeug.model,
    fahrzeug.fahrgestell_nummer
From fahrzeug
INNER JOIN vertrag on vertrag.fk_fahrzeug = fahrzeug.fahrgestell_nummer
WHERE vertrag.verkaufsdatum > '2022-01-01' AND vertrag.verkaufsdatum < '2022-12-31';