/*
 * INSERT minimum 10 tuples of Test Data for each table
 * DISCLAIMER: Test Data has been created by CHATGPT, PROMPT is added to the appendix of our documentation.
 */

-- TABLE person

INSERT INTO Person (ID, Name, Adresse, Email, Telefonnummer) VALUES
(1, 'John Doe', '123 Main St', 'johndoe@example.com', '0798513647'),
(2, 'Jane Smith', '456 Oak St', 'janesmith@example.com', '0776854235'),
(3, 'Michael Brown', '789 Pine St', 'michaelbrown@example.com', '0776954832'),
(4, 'Emily White', '135 Maple St', 'emilywhite@example.com', '0792345678'),
(5, 'David Black', '246 Elm St', 'davidblack@example.com', '0779583434'),
(6, 'Sophia Green', '357 Cedar St', 'sophiagreen@example.com', '0792349797'),
(7, 'James Blue', '468 Birch St', 'jamesblue@example.com', '0771232992'),
(8, 'Emma Red', '579 Willow St', 'emmared@example.com', '0796787878'),
(9, 'Lucas Yellow', '681 Ash St', 'lucasyellow@example.com', '0771423647'),
(10, 'Olivia Purple', '792 Spruce St', 'oliviapurple@example.com', '0791267352'),
(11, 'Liam Orange', '893 Sycamore St', 'liamorange@example.com', '0771423564'),
(12, 'Ava Pink', '904 Poplar St', 'avapink@example.com', '0796843674'),
(13, 'Noah Brown', '015 Cedar St', 'noahbrown@example.com', '0779685869'),
(14, 'Isabella White', '126 Birch St', 'isabellawhite@example.com', '0799654828'),
(15, 'Ethan Black', '237 Willow St', 'ethenblack@example.com', '0772345342'),
(16, 'Sophia Green', '348 Elm St', 'sophiagreen@example.com', '0776754976'),
(17, 'Mia Blue', '459 Pine St', 'miablue@example.com', '0771423647'),
(18, 'Mason Red', '560 Oak St', 'masonred@example.com', '0795674534'),
(19, 'Amelia Yellow', '671 Main St', 'ameliayellow@example.com', '0798568546'),
(20, 'Elijah Purple', '782 Spruce St', 'elijahpurple@example.com', '0771236363');

-- TABLE mitarbeiter

INSERT INTO Mitarbeiter (ID, Abteilung, Anstellungsdatum)
VALUES
(1, 'Verkauf', '2015-06-15'),
(2, 'Technik', '2017-03-21'),
(3, 'Verkauf', '2016-09-10'),
(4, 'HR', '2018-01-25'),
(5, 'Technik', '2019-11-03'),
(6, 'Verkauf', '2020-07-12'),
(7, 'Marketing', '2017-05-18'),
(8, 'Finanzen', '2016-04-09'),
(9, 'Verkauf', '2021-08-22'),
(10, 'Technik', '2022-02-11');

-- TABLE verkäufer

INSERT INTO Verkäufer (id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- TABLE kunde

INSERT INTO kunde (id) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- TABLE standorte

INSERT INTO standort (id, stadt) VALUES
(1, 'Zurich'),
(2, 'Bern'),
(3, 'Luzern'),
(4, 'Frankfurt'),
(5, 'Stuttgart'),
(6, 'Düsseldorf'),
(7, 'Köln'),
(8, 'Leipzig'),
(9, 'Dresden'),
(10, 'Hannover');

-- TABLE fahrzeug

INSERT INTO fahrzeug (id, hersteller, model, baujahr, preis, verfuegbarkeit, standort_id) VALUES
(1, 'Audi', 'A4', 2019, 40000, TRUE, 1),
(2, 'BMW', 'X5', 2020, 50000, TRUE, 2),
(3, 'Mercedes', 'C-Class', 2018, 45000, TRUE, 3),
(4, 'Volkswagen', 'Golf', 2017, 30000, FALSE, 4),
(5, 'Toyota', 'Corolla', 2016, 25000, TRUE, 5),
(6, 'Ford', 'Focus', 2015, 20000, TRUE, 6),
(7, 'Honda', 'Civic', 2014, 15000, FALSE, 7),
(8, 'Hyundai', 'Elantra', 2013, 10000, FALSE, 8),
(9, 'Kia', 'Rio', 2012, 8000, TRUE, 9),
(10, 'Nissan', 'Sentra', 2011, 6000, FALSE, 10);

-- TABLE vertrag

INSERT INTO vertrag (id, verkaufsdatum, zahlungsdatum, kunden_id, fahrzeug_id) VALUES
(1, '2022-03-01', '2022-03-01', 1, 1),
(2, '2022-03-02', '2022-03-02', 2, 2),
(3, '2022-03-03', '2022-03-03', 3, 3),
(4, '2022-03-04', '2022-03-04', 4, 4),
(5, '2022-03-05', '2022-03-05', 5, 5),
(6, '2022-03-06', '2022-03-06', 6, 6),
(7, '2022-03-07', '2022-03-07', 7, 7),
(8, '2022-03-08', '2022-03-08', 8, 8),
(9, '2022-03-09', '2022-03-09', 9, 9),
(10, '2022-03-10', '2022-03-10', 10, 10);

INSERT INTO fahrzeug_kunde (fahrzeug_id, kunden_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);