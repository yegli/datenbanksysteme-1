-- Yanick Egli, Gaëtan Allemann
/*
 * Queries erlauben die Prüfung der Funktionalität der Datenbank.
 */

-------------------------
/* 1. Einfache Queries */

/* Eine Query mit DISTINCT inklusive Begründung:
 * Distinct da ansonsten duplikate Abteilungsnamen zurückgegeben werden. */
SELECT DISTINCT abteilung FROM mitarbeiter;

/* Eine Query mit einem JOIN über drei oder mehr Tabellen */
SELECT 
    person.name, 
    vertrag.verkaufsdatum, 
    fahrzeug.model 
FROM fahrzeug
INNER JOIN vertrag ON fahrzeug.fahrgestell_nummer = vertrag.fk_fahrzeug
INNER JOIN kunde ON vertrag.fk_kunde = kunde.kunden_nummer
INNER JOIN person ON kunde.kunden_nummer = person.id AND kunde.type = person.type;

/* Eine Query mit Unterabfrage*/
/* korreliert oder unkorreliert? */ /* returns the name of any mitarbeiter that are verkäufer and work in Bern*/

--no clue how to fix
/*
SELECT 
    person.name,
    person.vorname
FROM person WHERE person. IN (
    SELECT mitarbeiter_nummer
    FROM mitarbeiter
    WHERE fk_mitarbeiter IN (
        SELECT fk_mitarbeiter
        FROM verkaeufer
        WHERE fk_standort IN (
            SELECT id
            FROM standort
            WHERE stadt = 'Bern'
        )
    )
);
*/

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
INNER JOIN kunde ON kunde_fahrzeug.fk_kunde = kunde.kunden_nummer
INNER JOIN person ON person.id = kunde.kunden_nummer AND person.type = kunde.type
WHERE EXISTS (
    SELECT kunde_fahrzeug.fk_kunde, kunde_fahrzeug.fk_fahrzeug 
    WHERE kunde_fahrzeug.fk_kunde = 12);

/* Eine Query bei der ein OUTER JOIN erforderlich ist */
/*Alle Mitarbeiter die keine Verkäufer sind*/
SELECT
    person.vorname,
    person.name
From mitarbeiter
LEFT JOIN verkaeufer ON mitarbeiter.mitarbeiter_nummer = verkaeufer.id
INNER JOIN person ON mitarbeiter.mitarbeiter_nummer = person.id AND mitarbeiter.type = person.type;

/* Eine Querry die Datensätze aufgrund eines Datums und/oder Zeitangabe liefert */
/*Alle Autos die im Jahr 2022 verkauft wurden*/
SELECT
    fahrzeug.hersteller,
    fahrzeug.model,
    fahrzeug.fahrgestell_nummer
From fahrzeug
INNER JOIN vertrag on vertrag.fk_fahrzeug = fahrzeug.fahrgestell_nummer
WHERE vertrag.verkaufsdatum > '2022-01-01' AND vertrag.verkaufsdatum < '2022-12-31';


-------------------------------------------------------
/* 2. Common Table Expressions und Window-Funktionen */

/* Eine Abfrage mit einer unkorrelierten Subquery im FROM-Teil dokumentiert als Kommentar vor dem SQL-Statement */

-- SELECT person.name, technik_mitarbeiter.anstellungsdatum
-- FROM (
--     SELECT mitarbeiter.mitarbeiter_nummer, mitarbeiter.anstellungsdatum
--     FROM mitarbeiter
--     INNER JOIN abteilungen ON mitarbeiter.abteilung_id = abteilungen.abteilung_id
--     WHERE abteilungen.abteilung_name = 'Technik'
-- ) AS technik_mitarbeiter
-- INNER JOIN person ON person.fk_mitarbeiter = technik_mitarbeiter.mitarbeiter_nummer;


/* Formen Sie diese in eine äquivalente Querry mit Common Table Expressions um (anstelle einer Subquery) */
WITH techniker AS (
    SELECT person.name, mitarbeiter.mitarbeiter_nummer, mitarbeiter.anstellungsdatum
    FROM person
    INNER JOIN mitarbeiter ON person.id = mitarbeiter.mitarbeiter_nummer AND person.type = mitarbeiter.type
    WHERE mitarbeiter.abteilung = 'Technik'
)
SELECT *
FROM techniker
WHERE anstellungsdatum > '2017-01-01';

/* Schreiben Sie eine sinnvolle Query mit einer GROUP BY-Klausel */
SELECT 
    COUNT(person.id) AS  "Anz. Verkäufer",
    standort.stadt
FROM person
INNER JOIN mitarbeiter ON person.id = mitarbeiter.mitarbeiter_nummer AND person.type = mitarbeiter.type
INNER JOIN verkaeufer ON mitarbeiter.mitarbeiter_nummer = verkaeufer.id
INNER JOIN standort ON verkaeufer.fk_standort = standort.id
GROUP BY standort.stadt;

/* Schreiben Sie eine sinnvolle Query mit einer Window-Funktion */
SELECT 
    verkaeufer.id AS verkaeufer_id,
    person.name AS verkaeufer_name,
    standort.stadt AS standort,
    COUNT(vertrag.id) AS vertrag_count,
    RANK() OVER (PARTITION BY standort.id ORDER BY COUNT(vertrag.id) DESC) AS rank_within_location
FROM verkaeufer
INNER JOIN mitarbeiter ON verkaeufer.id = mitarbeiter.mitarbeiter_nummer
INNER JOIN person ON person.id = mitarbeiter.mitarbeiter_nummer AND person.type = mitarbeiter.type
INNER JOIN standort ON verkaeufer.fk_standort = standort.id
LEFT JOIN vertrag ON verkaeufer.id = vertrag.fk_fahrzeug
GROUP BY verkaeufer.id, person.name, standort.stadt, standort.id
ORDER BY standort.id, rank_within_location;


--------------
/* 3. Views */

/* Eine View die mindestens drei Tabellen umfasst */
CREATE VIEW VertragsPartner AS
SELECT 
    person.name,
    kunde.kunden_nummer,
    vertrag.id,
    vertrag.verkaufsdatum
FROM person
INNER JOIN kunde ON person.id = kunde.kunden_nummer AND person.type = kunde.type
INNER JOIN vertrag ON kunde.kunden_nummer = vertrag.fk_kunde;


/* Eine normale Query die die obige View verwendet */
SELECT * FROM VertragsPartner WHERE verkaufsdatum > '2022-03-05';

/* Eine einfache View die sich updaten lässt */
CREATE VIEW Autos AS
SELECT *
FROM fahrzeug
WHERE fahrgestell_nummer < 5;

/* Ändern eines Datensatzes in der zweiten View mit einem UPDATE-Statement*/
UPDATE Autos
SET hersteller = 'Bring Mich Werkstatt'
WHERE fahrgestell_nummer = 2;