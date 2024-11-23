-- Yanick Egli
/*
 * Queries erlauben die Prüfung der Funktionalität der Datenbank.
 */

--  SELECT menukarte.name, COUNT(gericht.id)
--  FROM menukarte
--  INNER JOIN menukarte_gericht ON menukarte.id = menukarte_gericht.menukarte
--  INNER JOIN gericht ON menukarte_gericht.gericht = gericht.id
--  GROUP BY menukarte.name;

-- SELECT m.name, COUNT(g.name)
-- FROM menukarte m
-- LEFT JOIN menukarte_gericht mg ON (m.id = mg.menukarte)
-- LEFT JOIN gericht g ON (g.id = mg.gericht)
-- GROUP BY m.id;

SELECT restaurant.name FROM restaurant
WHERE restaurant.skigebiet = 1 AND restaurant.offen_ab <= '08:00:00' AND restaurant.anzahl_plätze > 25;


