-- Yanick Egli
/*
 * INSERT minimum 10 tuples of Test Data for each table
 * DISCLAIMER: Test Data has been created by CHATGPT, PROMPT is added to the appendix of our documentation.
 */

INSERT INTO skigebiet (id, name) VALUES
(1, 'Alpine Bliss'),
(2, 'Snow Haven'),
(3, 'Ice Peak'),
(4, 'Frosty Fields'),
(5, 'Winter Wonderland'),
(6, 'Summit Escape'),
(7, 'Glacier Resort'),
(8, 'Chill Zone'),
(9, 'Peak Paradise'),
(10, 'Snowy Meadows');

INSERT INTO restaurant (id, name, offen_ab, offen_bis, anzahl_plätze, skigebiet) VALUES
(1, 'The Alpine Feast', '08:00', '22:00', 50, 1),
(2, 'Snowy Snacks', '07:00', '21:00', 30, 2),
(3, 'Summit Bites', '10:00', '23:00', 80, 3),
(4, 'Frosty Treats', '09:00', '20:00', 40, 4),
(5, 'Peak Dining', '11:00', '23:00', 60, 5),
(6, 'Glacier Grill', '08:30', '22:00', 45, 6),
(7, 'Mountain Meals', '10:00', '21:00', 35, 7),
(8, 'Winter Warmers', '09:00', '22:00', 50, 8),
(9, 'Ice Café', '07:30', '20:30', 25, 9),
(10, 'Chill Cuisine', '10:00', '23:00', 70, 10);

INSERT INTO menukarte (id, name, restaurant) VALUES
(1, 'Breakfast Specials', 1),
(2, 'Lunch Combos', 2),
(3, 'Dinner Delights', 3),
(4, 'Snack Menu', 4),
(5, 'Seasonal Offers', 5),
(6, 'Tasting Menu', 6),
(7, 'Holiday Specials', 7),
(8, 'Winter Warmers', 8),
(9, 'Family Feast', 9),
(10, 'Summit Selection', 10);

INSERT INTO gericht (id, name, preis, ist_tagesmenu) VALUES
(1, 'Pancakes', 10, TRUE),
(2, 'Sausage Platter', 12, FALSE),
(3, 'Mountain Burger', 15, TRUE),
(4, 'Soup of the Day', 8, TRUE),
(5, 'Roast Beef', 20, FALSE),
(6, 'Pasta Alfredo', 18, FALSE),
(7, 'Chicken Salad', 14, TRUE),
(8, 'Chocolate Fondue', 10, FALSE),
(9, 'Apple Pie', 7, TRUE),
(10, 'Ice Cream Sundae', 9, FALSE);

INSERT INTO menukarte_gericht (menukarte, gericht) VALUES
(1, 1),
(1, 9),
(2, 2),
(2, 3),
(3, 5),
(3, 6),
(4, 4),
(5, 7),
(6, 8),
(6, 10);
