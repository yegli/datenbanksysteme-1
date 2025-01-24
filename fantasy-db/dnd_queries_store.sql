-- Auflistung aller Personen, welche Zwerge sind
SELECT * FROM person
WHERE race = 2;

-- Alle Items die es gibt (ohne Dublikate) (name, description davon)
SELECT DISTINCT name, description 
FROM item;

-- Durchschnittlicher Item Preis je nach Item Typ
SELECT item_typ, AVG(value)
FROM item
GROUP BY item_typ;

-- Alle Personen, die mehr als 10 Items besitzten
SELECT p.name, p.age, COUNT(i.name)
FROM person p
JOIN item i ON p.id = i.person
GROUP BY p.name, p.age
HAVING COUNT(i.name) > 10;

-- Alle Personen, die in der Stadt Neverwinter wohnen
SELECT p.name, p.age, c.name
FROM person p
JOIN city c ON c.id = p.city
WHERE c.name = 'Neverwinter';

-- Alle Personen die in dem Land Sword Coast wohnen (Name, Alter der Person, Name der Stadt und Name des Landes)
SELECT p.name, p.age, c.name, co.name
FROM person p
JOIN city c ON c.id = p.city
JOIN country co ON c.country = co.id
WHERE co.name = 'Sword Coast';

-- Alle Personen, welche Darkvision besitzen (Name, Alter der Person, Name des Traits, Spezifikation)
SELECT p.name, p.age, t.name, s.specification
FROM person p
JOIN race r ON p.race = r.id
JOIN specification s ON s.race_id = r.id
JOIN trait t ON t.id = s.trait_id
WHERE t.name = 'Darkvision';

-- Ihr plant einen Einbrucht. Dafür sind die Skills "Sleight of Hand" und "Stealth" sehr wichtig. Welche beiden Personen würdet ihr mitnehmen
SELECT * 
FROM person p
JOIN skill_person sp ON sp.person_id = p.id
JOIN skill s ON sp.skill_id = s.id
WHERE s.name = 'Sleight of Hand' OR s.name = 'Stealth'
ORDER BY sp.score DESC
LIMIT 2;

-- Auflistung aller Items und alle Informationen dazu
-- Normaler Join geht nicht
SELECT DISTINCT i.name, i.description, i.value, mi.property, ci.curse FROM item i
JOIN magical_item mi ON mi.id = i.id
JOIN cursed_item ci ON ci.id = i.id

-- Outer Join muss verwendet werden
SELECT DISTINCT i.name, i.description, i.value, mi.property, ci.curse FROM item i
LEFT JOIN magical_item mi ON mi.id = i.id
LEFT JOIN cursed_item ci ON ci.id = i.id

-- Alle non-magical-items die teurer sind als das billigste magic item 
-- Ist diese Abfrage korrelierend oder unkorrelierend
SELECT DISTINCT i.name, i.value
FROM item i
WHERE i.item_typ = 0
AND i.value > (SELECT MIN(it.value)
				  FROM item it
				  WHERE it.item_typ = 1
			  );

-- Alle Personen, welche proficient sind in Animal Handling, gelöst mit Unterabfrage
-- korrelierend oder unkorrelierend
SELECT * FROM person p
JOIN skill_person sp ON sp.person_id = p.id
WHERE EXISTS(
	SELECT * FROM skill s 
	WHERE s.name = 'Animal Handling' 
	AND sp.skill_id = s.id
	AND sp.proficiency is true
)

-- Rangliste der Skills von "Faelar Lightwind"
SELECT p.name, p.age, s.name, sp.score, RANK() OVER(ORDER BY sp.score DESC) as "ranking"
FROM person p
JOIN skill_person sp ON sp.person_id = p.id
JOIN skill s ON sp.skill_id = s.id
WHERE p.name = 'Faelar Lightwind'
ORDER BY ranking;


-- Alle Personen, welche Darkvision besitzen (Name, Alter der Person, Name des Traits, Spezifikation)
-- Gelöst mit Common Table Expression
WITH race_traits(race_id, race, trait, description, specification) AS (
	SELECT r.id, r.name, t.name, t.description, s.specification
	FROM race r
	JOIN specification s ON s.race_id = r.id
	JOIN trait t ON t.id = s.trait_id
)
SELECT p.name, rt.race, trait, description, specification FROM race_traits rt
JOIN person p ON p.race = rt.race_id
WHERE trait = 'Darkvision';

-- Umgehen mit Null
-- Alle Items welche niemanden gehören
-- muss mit "is" gemacht werden
SELECT * FROM item i
WHERE i.person is NULL

-- View für die Herrscher: View für alle Personen, welche in der Sword Coast leben
DROP VIEW IF EXISTS sword_coast_residents;

CREATE VIEW sword_coast_residents(Name, Age, Birthday, City, Country) AS
SELECT p.name, p.age, p.birthday, c.name, co.name
FROM person p
JOIN city c ON c.id = p.city
JOIN country co ON co.id = c.country
WHERE co.name = 'Sword Coast'
ORDER BY c.name;

SELECT * FROM sword_coast_residents;

-- Für den Herrscher der Sword Coast einen User anlegen, der nur die View anschauen darf
DROP USER IF EXISTS sc_admin;
CREATE USER sc_admin WITH LOGIN PASSWORD '1234';

GRANT SELECT ON sword_coast_residents TO sc_admin;
REVOKE ALL ON sword_coast_residents FROM sc_admin;


-- Item tausch mit einer Transaktion
SELECT p.id, p.name, i.name 
FROM person p
JOIN item i ON i.person = p.id
WHERE p.id = 1;

BEGIN TRANSACTION;

UPDATE item
SET person = 2
WHERE person = 1
AND name = 'Dragon Mask';

UPDATE item
SET person = 1
WHERE person = 2
AND name = 'Blackstaff';

ROLLBACK;
-- COMMIT; -- um erfolgreich die Transaktion abzuschliessen

-- Index erstellen
CREATE INDEX item_idx ON item(name);
DROP INDEX item_idx;