-- Yanick Egli, Gaëtan Allemann
/*
 * INSERT minimum 10 tuples of Test Data for each table
 * DISCLAIMER: Test Data has been created by CHATGPT, PROMPT is added to the appendix of our documentation.
 */

-- TABLE person

INSERT INTO person (id, name, vorname, adresse, email, telefonnummer) VALUES
(1, 'John', 'Doe', '123 Main St', 'johndoe@example.com', '0798513647'),
(2, 'Jane', 'Smith', '456 Oak St', 'janesmith@example.com', '0776854235'),
(3, 'Michael', 'Brown', '789 Pine St', 'michaelbrown@example.com', '0776954832'),
(4, 'Emily', 'White', '135 Maple St', 'emilywhite@example.com', '0792345678'),
(5, 'David', 'Black', '246 Elm St', 'davidblack@example.com', '0779583434'),
(6, 'Sophia', 'Green', '357 Cedar St', 'sophiagreen@example.com', '0792349797'),
(7, 'James', 'Blue', '468 Birch St', 'jamesblue@example.com', '0771232992'),
(8, 'Emma', 'Red', '579 Willow St', 'emmared@example.com', '0796787878'),
(9, 'Lucas', 'Yellow', '681 Ash St', 'lucasyellow@example.com', '0771423647'),
(10, 'Olivia', 'Purple', '792 Spruce St', 'oliviapurple@example.com', '0791267352'),
(11, 'Liam', 'Orange', '893 Sycamore St', 'liamorange@example.com', '0771423564'),
(12, 'Ava', 'Pink', '904 Poplar St', 'avapink@example.com', '0796843674'),
(13, 'Noah', 'Brown', '015 Cedar St', 'noahbrown@example.com', '0779685869'),
(14, 'Isabella', 'White', '126 Birch St', 'isabellawhite@example.com', '0799654828'),
(15, 'Ethan', 'Black', '237 Willow St', 'ethenblack@example.com', '0772345342'),
(16, 'Sophia', 'Green', '348 Elm St', 'sophiagreen@example.com', '0776754976'),
(17, 'Mia', 'Blue', '459 Pine St', 'miablue@example.com', '0771423647'),
(18, 'Mason', 'Red', '560 Oak St', 'masonred@example.com', '0795674534'),
(19, 'Amelia', 'Yellow', '671 Main St', 'ameliayellow@example.com', '0798568546'),
(20, 'Elijah', 'Purple', '782 Spruce St', 'elijahpurple@example.com', '0771236363'),
(21, 'Alfonso', 'Micropico', '687 Dogwater St', 'alfonso.micropico@example.com', '0779548327');

-- TABLE mitarbeiter

INSERT INTO mitarbeiter (mitarbeiter_nummer, abteilung, anstellungsdatum) VALUES --create table Abteilungen for normalization
(1, 'Verkauf', '2015-06-15'),
(2, 'Technik', '2017-03-21'),
(3, 'Verkauf', '2016-09-10'),
(4, 'HR', '2018-01-25'),
(5, 'Technik', '2019-11-03'),
(6, 'Verkauf', '2020-07-12'),
(7, 'Marketing', '2017-05-18'),
(8, 'Finanzen', '2016-04-09'),
(9, 'Verkauf', '2021-08-22'),
(10, 'Technik', '2022-02-11'),
(11, 'Verkauf', '2022-02-11');

-- TABLE verkaeufer

INSERT INTO verkaeufer (id, fk_standort) VALUES
(1,1),
(2,1),
(3,1),
(4,4),
(5,9),
(6,3),
(7,5),
(8,1),
(9,3),
(10,2),
(11,2);

-- TABLE kunde

INSERT INTO kunde (kunden_nummer) VALUES
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21);

-- TABLE standorte

INSERT INTO standort (id, stadt) VALUES
(1,'Zurich'),
(2,'Bern'),
(3,'Luzern'),
(4,'Frankfurt'),
(5,'Stuttgart'),
(6,'Düsseldorf'),
(7,'Köln'),
(8,'Leipzig'),
(9,'Dresden'),
(10,'Hannover');

-- TABLE fahrzeug

INSERT INTO fahrzeug (fahrgestell_nummer, hersteller, model, baujahr, preis, fk_standort) VALUES
(1, 'Audi', 'A4', 2019, 40000, 1),
(2, 'BMW', 'X5', 2020, 50000, 2),
(3, 'Mercedes', 'C-Class', 2018, 45000, 3),
(4, 'Volkswagen', 'Golf', 2017, 30000, 4),
(5, 'Toyota', 'Corolla', 2016, 25000, 5),
(6, 'Ford', 'Focus', 2015, 20000, 6),
(7, 'Honda', 'Civic', 2014, 15000, 7),
(8, 'Hyundai', 'Elantra', 2013, 10000, 8),
(9, 'Kia', 'Rio', 2012, 8000, 9),
(10, 'Nissan', 'Sentra', 2011, 6000, 10);

-- TABLE vertrag

INSERT INTO vertrag (id, verkaufsdatum, zahlungsdatum, fk_fahrzeug, fk_kunde) VALUES
(1, '2022-03-01', '2022-03-01', 1, 12),
(2, '2022-03-02', '2022-03-02', 2, 13),
(3, '2022-03-03', '2022-03-03', 3, 14),
(4, '2022-03-04', '2022-03-04', 4, 15),
(5, '2022-03-05', '2022-03-05', 5, 16),
(6, '2023-03-06', '2023-03-06', 6, 17),
(7, '2023-03-07', '2023-03-07', 7, 18),
(8, '2024-03-08', '2024-03-08', 8, 19),
(9, '2024-03-09', '2024-03-09', 9, 21),
(10, '2024-03-10', '2024-03-10', 10, 20);

INSERT INTO kunde_fahrzeug (fk_kunde, fk_fahrzeug) VALUES
(12, 1),
(13, 2),
(14, 3),
(15, 4),
(16, 7),
(17, 2);