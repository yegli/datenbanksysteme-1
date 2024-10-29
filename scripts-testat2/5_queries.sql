/*
 * Queries erlauben die Prüfung der Funktionalität der Datenbank.
 */

-- SELECT * FROM mitarbeiter WHERE anstellungsdatum < '2020-01-01';

SELECT * FROM fahrzeug WHERE verfuegbarkeit = TRUE;

-- -- Should fail because price is less than or equal to 0
-- INSERT INTO fahrzeug (hersteller, model, baujahr, preis, verfügbarkeit, kunde_id) 
-- VALUES ('BMW', 'X5', '2020-03-15', -5000, TRUE, 1);

-- -- Should fail because manufacturing year is in the future
-- INSERT INTO fahrzeug (hersteller, model, baujahr, preis, verfügbarkeit, kunde_id) 
-- VALUES ('Tesla', 'Model S', '2025-07-10', 80000, TRUE, 2);

-- -- Should fail because the vehicle is not available but has a customer assigned
-- INSERT INTO fahrzeug (hersteller, model, baujahr, preis, verfügbarkeit, kunde_id) 
-- VALUES ('Mercedes', 'C-Class', '2021-05-12', 45000, FALSE, 3);

-- -- Should fail because the vehicle is available but no customer is assigned
-- INSERT INTO fahrzeug (hersteller, model, baujahr, preis, verfügbarkeit, kunde_id) 
-- VALUES ('Audi', 'A4', '2020-06-18', 50000, TRUE, NULL);

-- -- Should fail because payment date is in the future
-- INSERT INTO vertrag (verkaufsdatum, zahlungsdatum) 
-- VALUES ('2023-03-10', '2025-05-15');

-- -- Should fail because the location name 'Berlin' already exists
-- INSERT INTO standorte (standort_name) 
-- VALUES ('Berlin');

-- -- Should fail because the customer is already assigned to this location
-- INSERT INTO kunden_pro_standort (kunde_id, standort_id) 
-- VALUES (1, 1);

-- -- Should fail because the employee is already assigned to this location
-- INSERT INTO mitarbeiter_pro_standort (mitarbieter_id, standort_id) 
-- VALUES (1, 1);

-- -- Should fail because the ID is a duplicate (if IDs are manually inserted and not auto-generated)
-- INSERT INTO fahrzeug (id, hersteller, model, baujahr, preis, verfügbarkeit, kunde_id) 
-- VALUES (1, 'Ford', 'Focus', '2021-07-15', 30000, TRUE, 4);
