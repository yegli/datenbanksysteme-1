-- SElECT name, salaer FROM angestellter 
-- WHERE salaer > 5000;

-- SElECT name, salaer FROM angestellter 
-- WHERE (salaer > 8000 OR salaer < 5000) AND wohnort = 'Luzern';

-- SELECT name, tel 
-- FROM angestellter
-- WHERE tel IS NOT NULL
-- ORDER BY name ASC;

-- SELECT name
-- FROM angestellter WHERE name LIKE 'Widmer%';

-- SELECT name
-- FROM angestellter
-- WHERE chef = 1001;

-- SELECT 
--     chef AS "chef",
--     COUNT(persnr) AS "Anz-MA",
--     AVG(salaer) AS "Avg-Salaer"
-- FROM angestellter
-- WHERE chef IS NOT NULL
-- GROUP BY chef
-- ORDER BY
--     COUNT(persnr) DESC,
--     AVG(salaer) ASC;

-- SELECT
--     COUNT(persnr) AS "Ma",
--     SUM(salaer) AS "Sum",
--     AVG(salaer) AS "AVG" 
-- FROM angestellter;

-- SELECT 
--     abtnr,
--     COUNT(persnr) AS "Anz-MA",
--     SUM(salaer) AS "Salaer-Summe"
-- FROM angestellter
-- GROUP BY abtnr
-- ORDER BY 
--     SUM(salaer) ASC;

-- SELECT
--     DISTINCT wohnort,
--     COUNT(persnr) AS "Headcount",
--     AVG(salaer) AS "AVG-Salaer"
-- FROM angestellter
-- GROUP BY wohnort;

-- SELECT
--     DISTINCT wohnort,
--     COUNT(persnr) AS "Headcount",
--     AVG(salaer) AS "AVG-Salaer"
-- FROM angestellter
-- GROUP BY wohnort
-- HAVING COUNT(persnr) > 1;


-- INNER JOINS AUFGABEN ------------------

-- SELECT 
--     angestellter.name AS "Projektleiter",
--     projekt.bezeichnung AS "Projekt"
-- FROM angestellter
-- INNER JOIN projekt ON angestellter.persnr = projekt.projleiter;

-- SELECT 
--     angestellter.name,
--     abteilung.name
-- FROM angestellter
-- INNER JOIN abteilung ON angestellter.abtnr = abteilung.abtnr
-- ORDER BY abteilung.name;

-- SELECT
--  abteilung.name,
--  angestellter.name,
--  angestellter.salaer
-- FROM abteilung
-- INNER JOIN abteilungsleitung ON abteilung.abtnr = abteilungsleitung.abtnr
-- INNER JOIN angestellter ON abteilungsleitung.abtchef = angestellter.persnr
-- ORDER BY angestellter.salaer;

-- SELECT 
--     angestellter.name,
--     angestellter.wohnort
-- FROM angestellter
-- INNER JOIN abteilung ON angestellter.abtnr = abteilung.abtnr
-- WHERE (abteilung.name = 'Verkauf') AND (angestellter.wohnort = 'Luzern');

-- SELECT
--     a1.name AS "MA",
--     a1.salaer AS "MAS",
--     a2.name AS "CH",
--     a2.salaer AS "CHS"
-- FROM angestellter a1
-- INNER JOIN angestellter a2 ON a1.chef = a2.persnr
-- WHERE a1.salaer > a2.salaer;

-- SELECT DISTINCT angestellter1.name AS "MA", abteilung.name AS "Abt" FROM projekt
-- INNER JOIN angestellter angestellter2 ON projekt.projleiter = angestellter2.persnr
-- INNER JOIN projektzuteilung ON projekt.projnr = projektzuteilung.projnr
-- INNER JOIN angestellter angestellter1 ON projektzuteilung.persnr = angestellter1.persnr
-- INNER JOIN abteilung on angestellter1.abtnr = abteilung.abtnr
-- WHERE (angestellter2.name LIKE 'Marxer%');

-- SELECT
--     abteilung.name,
--     COUNT(angestellter.persnr),
--     SUM(angestellter.salaer),
--     AVG(angestellter.salaer)
-- FROM abteilung
-- INNER JOIN angestellter ON abteilung.abtnr = angestellter.abtnr
-- GROUP BY abteilung.name
-- ORDER BY abteilung.name;

-- SELECT 
--     COUNT(angestellter.persnr),
--     SUM(angestellter.salaer)
-- FROM angestellter
-- INNER JOIN projektzuteilung ON angestellter.persnr = projektzuteilung.persnr
-- INNER JOIN projekt ON projektzuteilung.projnr = projekt.projnr
-- WHERE projekt.bezeichnung LIKE 'Mars%';

-- SELECT
--     projekt.bezeichnung,
--     COUNT(angestellter.persnr),
--     SUM(angestellter.salaer),
--     AVG(angestellter.salaer)
-- FROM angestellter
-- INNER JOIN projektzuteilung ON angestellter.persnr = projektzuteilung.persnr
-- INNER JOIN projekt ON projektzuteilung.projnr = projekt.projnr
-- GROUP BY projekt.bezeichnung;

-- OUTER JOINS AUFGABEN ------------------

-- SELECT
--     abteilung.name,
--     angestellter.name,
--     angestellter.salaer
-- FROM abteilung
-- LEFT JOIN abteilungsleitung ON abteilung.abtnr = abteilungsleitung.abtnr
-- LEFT JOIN angestellter ON abteilungsleitung.abtchef = angestellter.persnr
-- ORDER BY angestellter.salaer;

-- SELECT
--     a1.name,
--     a1.salaer,
--     a2.name AS "CHEF",
--     a2.salaer AS "CHEF-SALàR"
-- FROM angestellter a1
-- LEFT JOIN angestellter a2 ON a1.chef = a2.persnr;

-- SELECT
--     abteilung.name,
--     COUNT(angestellter.persnr),
--     SUM(angestellter.salaer),
--     AVG(angestellter.salaer)
-- FROM abteilung
-- LEFT JOIN angestellter ON abteilung.abtnr = angestellter.abtnr
-- GROUP BY abteilung.name
-- ORDER BY abteilung.name;

-- UNTER ABFRAGEN ------------------

-- SELECT
--     name,
--     salaer
-- FROM angestellter
-- WHERE salaer = (
--     SELECT MIN(salaer) FROM angestellter
-- );

-- SELECT
--     name,
--     salaer
-- FROM angestellter
-- WHERE salaer > (SELECT AVG(salaer) FROM angestellter);

-- SELECT count(*),
--        sum(salaer)
-- FROM angestellter
-- WHERE persnr IN
--         ( SELECT persnr
--          FROM projektzuteilung
--          WHERE projnr =
--                  ( SELECT projnr
--                   FROM projekt
--                   WHERE bezeichnung = 'Mars' ) );

-- SELECT name
-- FROM angestellter
-- WHERE persnr IN (
--     SELECT persnr
--     FROM projektzuteilung
--     GROUP BY persnr
--     HAVING COUNT(projnr) > 2
-- );

-- SELECT abtnr,
--        round(avg(salaer), 2),
--        count(*)
-- FROM angestellter
-- GROUP BY abtnr
-- HAVING avg(salaer) <= ALL (SELECT avg(salaer) FROM angestellter GROUP BY abtnr);

-- SELECT bezeichnung AS "Projekt",
--        name AS "Mitarbeiter",
--        zeitanteil
-- FROM projekt
-- INNER JOIN projektzuteilung ON projekt.projnr = projektzuteilung.projnr
-- INNER JOIN angestellter ON projektzuteilung.persnr = angestellter.persnr
-- UNION
-- SELECT bezeichnung AS "Projekt",
--        'All',
--        sum(zeitanteil)
-- FROM projekt
-- INNER JOIN projektzuteilung ON projekt.projnr = projektzuteilung.projnr
-- GROUP BY bezeichnung
-- UNION
-- SELECT 'All',
--        'All',
--        sum(zeitanteil)
-- FROM projektzuteilung
-- ORDER BY "Projekt" DESC,
--          zeitanteil;

-- SELECT DISTINCT Wohnort FROM Angestellter ORDER BY 1;

-- SELECT Wohnort FROM Angestellter GROUP BY Wohnort ORDER BY 1;

-- SELECT DISTINCT abtnr, SUM(salaer) FROM angestellter GROUP BY abtnr ORDER BY 1;

-- SELECT DISTINCT abtnr, SUM(salaer) OVER (PARTITION BY abtnr) FROM angestellter ORDER BY 1;

-- WITH tmptable AS (
--     SELECT name, bezeichnung, zeitanteil 
--     FROM angestellter
--     JOIN projektzuteilung ON projektzuteilung.persnr = angestellter.persnr
--     JOIN projekt ON projekt.projnr = projektzuteilung.projnr
-- )
-- SELECT name, bezeichnung, zeitanteil FROM tmptable;

-- SELECT abt.abtnr, abt.name, persnr, amtaelteste.name
-- FROM abteilung abt
-- CROSS JOIN LATERAL (
--     SELECT *
--     FROM angestellter ang
--     WHERE ang.abtnr = abt.abtnr
--     ORDER BY eintrittsdatum ASC
--     LIMIT 3
-- ) amtaelteste;

-- SELECT abt.abtNr, abt.name, ang.maxsalaer
-- FROM abteilung AS abt
-- JOIN LATERAL (
--     SELECT MAX(salaer) AS maxsalaer 
--     FROM angestellter 
--     WHERE abtnr = abt.abtNr
-- ) AS ang ON true;

-- CREATE VIEW GutVerdienende AS
--     SELECT * FROM angestellter
--     WHERE angestellter.salaer > 8000;

-- SELECT * FROM GutVerdienende;

-- -- UPDATE angestellter SET salaer = salaer - 2000 WHERE salaer > 8000;

-- -- SELECT * FROM GutVerdienende;

-- UPDATE angestellter SET salaer = salaer * 1.2;

-- SELECT * FROM GutVerdienende;

-- CREATE VIEW abtview (abtnr, abtname, abtleiter, salaersumme) AS
-- SELECT abt.abtnr,
--        abt.name,
--        leiter.name,  
--        sum(ang.salaer)
-- FROM abteilung abt
--  JOIN abteilungsleitung al ON al.abtnr = abt.abtnr
--  JOIN angestellter leiter ON al.abtchef = leiter.persnr
--  JOIN angestellter ang ON ang.abtnr = abt.abtnr
-- GROUP BY abt.abtnr, abt.name, leiter.name 
-- ORDER BY abt.abtnr;

-- SELECT * FROM abtview;

-- SELECT persnr, abtnr, MAX(salaer)
-- OVER (PARTITION BY abtnr) 
-- FROM angestellter








