/*
 * Testdaten einfüllen
 */
-- TABLE  mitarbeiter

INSERT INTO mitarbeiter (name, vorname, wohnort, adresse, geburtstag) VALUES 
('Baumeister', 'Erik', 'Hinwil', 'Habertstrasse 1', to_date('1994-01-01', 'YYYY-MM-DD')),
('Kishelleff', 'Nico', 'Zürich', 'Bahnhofstrasse 12', to_date('1995-12-23', 'YYYY-MM-DD')),
('Beer', 'Richard', 'Wil', 'Gibswilerstrasse 24', to_date('2002-03-13', 'YYYY-MM-DD')),
('Urs', 'Lars', 'Rüti', 'Amreinstrasse 5', to_date('2000-04-25', 'YYYY-MM-DD')),
('Gujer', 'Nils', 'Uster', 'Zeughausstrasse 4', to_date('1960-07-12', 'YYYY-MM-DD')),
('Müller', 'Jakop', 'Wädenswil', 'Zoostrasse 3', to_date('1988-12-01', 'YYYY-MM-DD')),
('Seefar', 'Claudio', 'Eschenbach', 'Alte Jonastrasse 12', to_date('1992-07-11', 'YYYY-MM-DD'));

-- TABLE  kunde

INSERT INTO kunde (name, vorname, wohnort, adresse, foto) VALUES 
('Hager', 'Elias', 'Jona', 'Koenigsstrasse 7', 'img/elias.png'),
('Petrizzo', 'Mino', 'Uznach', 'Mühlaustrasse 7', 'img/mino.png'),
('Kurt', 'Emely', 'Rapperswil', 'Eggenstrasse 29', 'img/emely.png'),
('Speer', 'Klaus', 'Gommiswald', 'Utzstrasse 9', 'img/klaus.png'),
('Keller', 'Sebastian', 'Sibnen', 'Herrenaggerstrasse 13', 'img/sebastian.png'),
('Kurt', 'Mattias', 'Galgenen', 'Festwallstrasse 1', 'img/mattias.png'),
('Rasper', 'Tomas', 'Pfeffikon SZ', 'Echtheitstrasse 34', 'img/tomas.png');

-- TABLE  standorte

INSERT INTO standorte (strasse, ort, plz, telefon_nr, email, standort_name) VALUES 
('Zürcherstrasse 12', 'Uznach', '8730', '079 483 23 43', 'test@email.com', 'Treffpunkt1'),
('Lauferstrasse 6', 'Jona', '8645', '077 434 25 43', 'test1@email.com', 'Treffpunkt2'),
('Senhallenstrasse 34', 'Rapperswil', '8640', '078 283 23 43', 'test2@email.com', 'Treffpunkt3'),
('Gehburgstrasse 13', 'Rüti', '8636', '072 352 23 35', 'test3@email.com', 'Treffpunkt4'),
('Usterstrasse 15', 'Uster', '8610', '079 153 25 62', 'test4@email.com', 'Treffpunkt5'),
('Gasterstrasse 1', 'Zürich', '8000', '075 241 24 14', 'test5@email.com', 'Treffpunkt6'),
('Segasterstrasse 14', 'Meilen', '8706', '078 263 26 21', 'test6@email.com', 'Treffpunkt7');

-- TABLE  kunden_pro_standort

INSERT INTO kunden_pro_standort (kunde_id, standort_id) VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 4);

-- TABLE  mitarbeiter_pro_standort

INSERT INTO mitarbeiter_pro_standort (mitarbieter_id, standort_id) VALUES 
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 4),
(7, 4);

-- TABLE  abo_modell
-- Schwache Entitaetsmenge

INSERT INTO abo_modell (abo_dauer, kosten, abo_name) VALUES 
(24, 1600.00, '2 Jahresabo'),
(12, 900.00, '1 Jahresabo'),
(6, 500.00, '6 Monatsabo'),
(3, 300.00, '3 Monatsabo'),
(1, 175.00, '1 Monatsabo');

-- TABLE  abo_kaufhistorie

INSERT INTO abo_kaufhistorie (kunde_id, abo_medell_id, abo_anfang, abo_ende) VALUES 
(1, 2, to_date('2021-07-12', 'YYYY-MM-DD'), to_date('2022-07-12', 'YYYY-MM-DD')),
(2, 1, to_date('2022-04-09', 'YYYY-MM-DD'), to_date('2024-04-09', 'YYYY-MM-DD')),
(3, 4, to_date('2022-05-10', 'YYYY-MM-DD'), to_date('2022-08-10', 'YYYY-MM-DD')),
(4, 5, to_date('2022-06-24', 'YYYY-MM-DD'), to_date('2022-07-24', 'YYYY-MM-DD')),
(5, 5, to_date('2022-06-28', 'YYYY-MM-DD'), to_date('2022-07-28', 'YYYY-MM-DD')),
(6, 3, to_date('2022-07-07', 'YYYY-MM-DD'), to_date('2023-01-07', 'YYYY-MM-DD')),
(1, 1, to_date('2022-07-12', 'YYYY-MM-DD'), to_date('2024-07-12', 'YYYY-MM-DD'));