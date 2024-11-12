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
SELECT 
    person.name, 
    verkaeufer.id,
    standort.stadt
FROM person WHERE
    

/* Eine Query mit entweder ANY, IN, EXISTS oder ALL gegebenenfalls mit NOT davor*/

/* Eine Query bei der ein OUTER JOIN erforderlich ist */

/* Eine Querry die Datensätze aufgrund eines Datums und/oder Zeitangabe liefert */


