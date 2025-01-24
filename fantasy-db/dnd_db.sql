DROP TABLE IF EXISTS item, magical_item, cursed_item, race, person, trait, specification, skill, skill_person, city, country;

CREATE TABLE race (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE country (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE city (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	country INTEGER NOT NULL REFERENCES country(id)
);

CREATE TABLE person (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	age INTEGER NOT NULL,
	birthday DATE NOT NULL,
	race INTEGER NOT NULL REFERENCES race(id),
	city INTEGER NOT NULL REFERENCES city(id)
);

CREATE TABLE trait (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	description TEXT NOT NULL
);

CREATE TABLE specification (
	race_id INTEGER REFERENCES race(id),
	trait_id INTEGER REFERENCES trait(id),
	specification TEXT NULL,
	PRIMARY KEY(race_id, trait_id)
);

CREATE TABLE skill (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	description TEXT NOT NULL
);

CREATE TABLE skill_person (
	skill_id INTEGER REFERENCES skill(id),
	person_id INTEGER REFERENCES person(id),
	score INTEGER NOT NULL,
	proficiency BOOLEAN NOT NULL,
	PRIMARY KEY(skill_id, person_id)
);

CREATE TABLE item (
	id INTEGER PRIMARY KEY,
	name TEXT NOT NULL,
	description TEXT NOT NULL,
	value INTEGER NOT NULL CHECK (value > 0),
	item_typ INTEGER NOT NULL,
	person INTEGER REFERENCES person(id)
);

CREATE TABLE magical_item (
	id INTEGER PRIMARY KEY REFERENCES item(id),
	property TEXT NOT NULL
);

CREATE TABLE cursed_item (
	id INTEGER PRIMARY KEY REFERENCES item(id),
	curse TEXT NOT NULL
);

INSERT INTO race VALUES
(1, 'Human'),
(2, 'Dwarf'),
(3, 'Elf'),
(4, 'Tiefling'),
(5, 'Half-Elf');

INSERT INTO country VALUES
(1, 'Backlands'),
(2, 'Elturgard'),
(3, 'Najara'),
(4, 'Sunset Vale'),
(5, 'Sword Coast');

INSERT INTO city VALUES
(1, 'Drawn Swords', 1),
(2, 'Evereska', 1),
(3, 'Yarthrain', 1),
(4, 'Elturel', 2),
(5, 'Scornubel', 2),
(6, 'Berdusk', 2),
(7, 'Soubar', 2),
(8, 'Crypt of the six', 3),
(9, 'Heartwing Estate', 3),
(10, 'Serpents Cowl', 3),
(11, 'Berdusk', 4),
(12, 'Hills Edge', 4),
(13, 'Iriaebor', 4),
(14, 'Waterdeep', 5),
(15, 'Neverwinter', 5),
(16, 'Luskan', 5),
(17, 'Baldurs Gate', 5);

INSERT INTO person VALUES
(1, 'Aldor Ironshield', 65, '1958-03-12', 2, 1),
(2, 'Lorelei Silverleaf', 125, '1898-11-28', 3, 2),
(3, 'Sylas Blackthorn', 30, '1993-06-05', 4, 4),
(4, 'Elena Moonshadow', 28, '1995-09-18', 5, 6),
(5, 'Kaelin Fireheart', 22, '2001-02-09', 1, 14),
(6, 'Thrain Stonebeard', 150, '1873-08-04', 2, 1),
(7, 'Elowen Starfall', 78, '1945-02-15', 3, 3),
(8, 'Mordaius Shadowborn', 45, '1978-11-21', 4, 8),
(9, 'Isolde Moonbrook', 32, '1991-07-30', 5, 17),
(10, 'Eldric Ironhand', 50, '1973-04-08', 1, 15),
(11, 'Brogar Thunderaxe', 90, '1933-12-19', 2, 1),
(12, 'Lirael Moonshade', 200, '1823-06-27', 3, 2),
(13, 'Ravenna Nightshade', 35, '1988-09-03', 4, 10),
(14, 'Faelar Lightwind', 29, '1994-02-14', 5, 17),
(15, 'Saria Brightwater', 28, '1995-11-10', 1, 14),
(16, 'Gimli Stoneheart', 130, '1893-04-30', 2, 1),
(17, 'Eldorin Starshaper', 150, '1873-09-15', 3, 3),
(18, 'Xandria Shadowcaster', 40, '1982-07-12', 4, 8),
(19, 'Aerin Swiftwind', 31, '1990-03-25', 5, 11),
(20, 'Cedric Stormbringer', 26, '1997-11-08', 1, 14);

INSERT INTO trait VALUES 
(1, 'Darkvision', 'Allows the user to see in the dark.'),
(2, 'Speed', 'How much the user can Move in a turn.'),
-- Human Trait
(3, 'Versatile', 'Humans gain an additional skill proficiency of their choice.'),
-- Dwarven Trait
(4, 'Dwarven Resilience', 'Dwarves have advantage on saving throws against poison and resistance against poison damage.'),
(5, 'Dwarven Combat Training', 'Dwarves are proficient with battleaxes, handaxes, light hammers, and warhammers.'),
-- ELven Trait
(6, 'Keen Senses', 'Elves have proficiency in the Perception skill.'),
(7, 'Fey Ancestry', 'Elves have advantage on saving throws against being charmed and can’t be put to sleep by magic.'),
-- Tiefling Traits
(8, 'Hellish Resistance', 'Tieflings have resistance to fire damage.'),
(9, 'Infernal Legacy', 'Tieflings know the Thaumaturgy cantrip. At 3rd level, they can cast Hellish Rebuke. At 5th level, they can cast Darkness.'),
-- Half-Elven Traits
(10, 'Fey Ancestry', 'Half-Elves have advantage on saving throws against being charmed and can’t be put to sleep by magic.'),
(11, 'Skill Versatility', 'Half-Elves gain proficiency in two skills of their choice.');

INSERT INTO specification VALUES
(1, 2, '30 Feet'),
(1, 3, NULL),
(2, 1, '60 Feet'),
(2, 2, '25 Feet'),
(2, 4, NULL),
(2, 5, NULL),
(3, 1, '80 Feet'),
(3, 2, '30 Feet'),
(3, 6, NULL),
(3, 7, NULL),
(4, 2, '30 Feet'),
(4, 8, NULL),
(4, 9, NULL),
(5, 2, '30 Feet'),
(5, 10, NULL),
(5, 11, NULL);

-- Example 1
INSERT INTO skill VALUES
(1, 'Acrobatics', 'The ability to perform feats of balance, agility, and coordination.'),
(2, 'Arcana', 'Knowledge of magical traditions, ancient symbols, and the ability to recall information about spells.'),
(3, 'Stealth', 'The art of avoiding detection and moving silently.'),
(4, 'Persuasion', 'The ability to influence others through charm, sincerity, or intimidation.'),
(5, 'Survival', 'Knowledge of tracking, hunting, and surviving in the wilderness.'),
(6, 'Investigation', 'The ability to deduce information by examining and analyzing clues.'),
(7, 'Athletics', 'Proficiency in physical activities such as climbing, swimming, and jumping.'),
(8, 'Sleight of Hand', 'Dexterity in performing tricks or manipulating objects without being noticed.'),
(9, 'Medicine', 'Knowledge of treating injuries, diseases, and providing long-term care.'),
(10, 'Nature', 'Understanding the natural world, plants, animals, and the environment.'),
(11, 'Deception', 'The ability to mislead others through lies, disguise, or bluffing.'),
(12, 'Intimidation', 'The skill of using forceful and threatening behavior to influence others.'),
(13, 'Religion', 'Knowledge of gods, religious traditions, and the ability to identify religious symbols.'),
(14, 'History', 'Understanding of historical events, societies, and cultures.'),
(15, 'Perception', 'Awareness of your surroundings and the ability to notice hidden details.'),
(16, 'Animal Handling', 'The ability to calm, train, and handle animals.'),
(17, 'Thieves'' Tools', 'Proficiency in using tools to open locks and disable traps.'),
(18, 'Performance', 'The ability to entertain through music, acting, or other artistic forms.'),
(19, 'Insight', 'The ability to judge the intentions and honesty of others.'),
(20, 'Engineering', 'Understanding of mechanics, architecture, and technological devices.');

INSERT INTO skill_person VALUES 
-- skill, person, score, proficiency
(1, 1, 2, false),
(2, 1, 5, true),
(3, 1, 2, false),
(4, 1, 2, false),
(5, 1, 4, false),
(6, 1, 3, false),
(7, 1, 2, false),
(8, 1, 4, false),
(9, 1, 0, false),
(10, 1, 3, false),
(11, 1, 5, true),
(12, 1, 5, true),
(13, 1, 5, true),
(14, 1, 5, true),
(15, 1, 3, false),
(16, 1, 2, false),
(17, 1, 4, false),
(18, 1, -1, false),
(19, 1, 3, false),
(20, 1, 5, true),
(1, 2, 4, false),
(2, 2, 1, false),
(3, 2, 5, true),
(4, 2, 0, false),
(5, 2, 5, true),
(6, 2, 0, false),
(7, 2, -2, false),
(8, 2, 5, true),
(9, 2, 4, false),
(10, 2, -1, false),
(11, 2, 3, false),
(12, 2, -2, false),
(13, 2, 5, true),
(14, 2, -2, false),
(15, 2, 2, false),
(16, 2, 5, true),
(17, 2, 3, false),
(18, 2, 1, false),
(19, 2, 1, false),
(20, 2, -2, false),
(1, 3, 4, false),
(2, 3, 4, false),
(3, 3, 3, false),
(4, 3, -1, false),
(5, 3, 3, false),
(6, 3, 1, false),
(7, 3, -2, false),
(8, 3, -2, false),
(9, 3, 2, false),
(10, 3, -2, false),
(11, 3, 4, false),
(12, 3, 4, false),
(13, 3, 3, false),
(14, 3, 4, false),
(15, 3, 4, false),
(16, 3, 2, false),
(17, 3, 2, false),
(18, 3, 4, false),
(19, 3, 0, false),
(20, 3, 2, false),
(1, 4, 4, false),
(2, 4, 0, false),
(3, 4, 0, false),
(4, 4, 3, false),
(5, 4, 5, true),
(6, 4, 4, false),
(7, 4, -2, false),
(8, 4, 4, false),
(9, 4, 2, false),
(10, 4, 3, false),
(11, 4, 3, false),
(12, 4, 2, false),
(13, 4, -2, false),
(14, 4, 2, false),
(15, 4, 2, false),
(16, 4, 3, false),
(17, 4, -2, false),
(18, 4, 5, true),
(19, 4, -1, false),
(20, 4, -2, false),
(1, 5, 1, false),
(2, 5, -1, false),
(3, 5, 1, false),
(4, 5, 3, false),
(5, 5, -2, false),
(6, 5, 1, false),
(7, 5, -2, false),
(8, 5, 1, false),
(9, 5, 5, true),
(10, 5, 3, false),
(11, 5, 2, false),
(12, 5, -1, false),
(13, 5, 4, false),
(14, 5, 1, false),
(15, 5, -2, false),
(16, 5, 5, true),
(17, 5, 4, false),
(18, 5, 0, false),
(19, 5, 5, true),
(20, 5, 0, false),
(1, 6, 2, false),
(2, 6, 3, false),
(3, 6, 5, true),
(4, 6, 0, false),
(5, 6, 3, false),
(6, 6, 4, false),
(7, 6, 1, false),
(8, 6, 1, false),
(9, 6, -1, false),
(10, 6, 2, false),
(11, 6, 2, false),
(12, 6, -1, false),
(13, 6, 3, false),
(14, 6, 3, false),
(15, 6, 2, false),
(16, 6, 3, false),
(17, 6, 5, true),
(18, 6, 5, true),
(19, 6, -1, false),
(20, 6, 4, false),
(1, 7, 3, false),
(2, 7, 0, false),
(3, 7, 0, false),
(4, 7, -2, false),
(5, 7, 1, false),
(6, 7, 0, false),
(7, 7, 3, false),
(8, 7, 2, false),
(9, 7, 5, true),
(10, 7, 1, false),
(11, 7, 2, false),
(12, 7, 4, false),
(13, 7, -2, false),
(14, 7, 2, false),
(15, 7, 2, false),
(16, 7, 4, false),
(17, 7, 0, false),
(18, 7, 2, false),
(19, 7, 0, false),
(20, 7, -2, false),
(1, 8, -2, false),
(2, 8, 1, false),
(3, 8, -1, false),
(4, 8, 4, false),
(5, 8, 5, true),
(6, 8, 4, false),
(7, 8, -1, false),
(8, 8, -1, false),
(9, 8, 1, false),
(10, 8, -2, false),
(11, 8, 5, true),
(12, 8, 2, false),
(13, 8, 2, false),
(14, 8, 1, false),
(15, 8, 1, false),
(16, 8, 1, false),
(17, 8, 2, false),
(18, 8, 5, true),
(19, 8, 2, false),
(20, 8, 4, false),
(1, 9, 2, false),
(2, 9, 5, true),
(3, 9, 5, true),
(4, 9, -2, false),
(5, 9, 0, false),
(6, 9, 1, false),
(7, 9, 3, false),
(8, 9, 1, false),
(9, 9, 3, false),
(10, 9, 5, true),
(11, 9, 1, false),
(12, 9, 3, false),
(13, 9, 1, false),
(14, 9, 1, false),
(15, 9, 0, false),
(16, 9, 5, true),
(17, 9, -2, false),
(18, 9, 0, false),
(19, 9, 0, false),
(20, 9, 1, false),
(1, 10, 1, false),
(2, 10, 5, true),
(3, 10, 3, false),
(4, 10, 5, true),
(5, 10, 2, false),
(6, 10, -2, false),
(7, 10, 1, false),
(8, 10, 1, false),
(9, 10, 4, false),
(10, 10, 3, false),
(11, 10, 1, false),
(12, 10, 4, false),
(13, 10, -2, false),
(14, 10, 5, true),
(15, 10, -1, false),
(16, 10, 3, false),
(17, 10, 1, false),
(18, 10, 2, false),
(19, 10, 4, false),
(20, 10, 1, false),
(1, 11, -1, false),
(2, 11, 1, false),
(3, 11, -1, false),
(4, 11, 5, true),
(5, 11, 0, false),
(6, 11, 1, false),
(7, 11, 3, false),
(8, 11, -1, false),
(9, 11, 3, false),
(10, 11, 3, false),
(11, 11, 1, false),
(12, 11, 5, true),
(13, 11, 5, true),
(14, 11, 4, false),
(15, 11, -2, false),
(16, 11, 4, false),
(17, 11, 3, false),
(18, 11, 3, false),
(19, 11, 0, false),
(20, 11, -2, false),
(1, 12, 0, false),
(2, 12, -2, false),
(3, 12, 4, false),
(4, 12, 0, false),
(5, 12, 2, false),
(6, 12, 2, false),
(7, 12, 0, false),
(8, 12, 2, false),
(9, 12, 1, false),
(10, 12, 3, false),
(11, 12, 0, false),
(12, 12, 2, false),
(13, 12, -1, false),
(14, 12, 0, false),
(15, 12, 3, false),
(16, 12, -1, false),
(17, 12, 2, false),
(18, 12, -1, false),
(19, 12, 1, false),
(20, 12, 3, false),
(1, 13, 2, false),
(2, 13, 0, false),
(3, 13, 4, false),
(4, 13, -2, false),
(5, 13, 3, false),
(6, 13, 5, true),
(7, 13, 4, false),
(8, 13, -2, false),
(9, 13, 1, false),
(10, 13, -2, false),
(11, 13, 1, false),
(12, 13, 4, false),
(13, 13, 4, false),
(14, 13, 4, false),
(15, 13, 1, false),
(16, 13, 1, false),
(17, 13, 1, false),
(18, 13, -2, false),
(19, 13, 2, false),
(20, 13, 5, true),
(1, 14, 5, true),
(2, 14, 1, false),
(3, 14, -2, false),
(4, 14, 4, false),
(5, 14, 2, false),
(6, 14, 4, false),
(7, 14, 0, false),
(8, 14, 0, false),
(9, 14, 2, false),
(10, 14, 2, false),
(11, 14, 1, false),
(12, 14, 4, false),
(13, 14, 2, false),
(14, 14, -1, false),
(15, 14, -2, false),
(16, 14, 5, true),
(17, 14, 3, false),
(18, 14, 1, false),
(19, 14, 2, false),
(20, 14, 3, false),
(1, 15, 1, false),
(2, 15, 5, true),
(3, 15, 3, false),
(4, 15, 3, false),
(5, 15, 1, false),
(6, 15, 0, false),
(7, 15, -2, false),
(8, 15, 5, true),
(9, 15, 1, false),
(10, 15, 2, false),
(11, 15, 0, false),
(12, 15, 4, false),
(13, 15, 0, false),
(14, 15, 5, true),
(15, 15, 0, false),
(16, 15, 0, false),
(17, 15, 2, false),
(18, 15, -2, false),
(19, 15, 5, true),
(20, 15, -2, false),
(1, 16, 2, false),
(2, 16, -1, false),
(3, 16, 1, false),
(4, 16, 0, false),
(5, 16, 0, false),
(6, 16, 5, true),
(7, 16, 4, false),
(8, 16, -2, false),
(9, 16, 4, false),
(10, 16, 2, false),
(11, 16, 2, false),
(12, 16, 3, false),
(13, 16, -1, false),
(14, 16, -2, false),
(15, 16, 0, false),
(16, 16, -2, false),
(17, 16, 4, false),
(18, 16, 3, false),
(19, 16, 5, true),
(20, 16, -1, false),
(1, 17, -2, false),
(2, 17, -1, false),
(3, 17, 4, false),
(4, 17, 4, false),
(5, 17, -2, false),
(6, 17, 3, false),
(7, 17, -1, false),
(8, 17, 2, false),
(9, 17, 3, false),
(10, 17, 5, true),
(11, 17, -1, false),
(12, 17, 2, false),
(13, 17, -1, false),
(14, 17, 3, false),
(15, 17, 2, false),
(16, 17, 4, false),
(17, 17, -1, false),
(18, 17, 4, false),
(19, 17, 1, false),
(20, 17, 1, false),
(1, 18, 3, false),
(2, 18, 4, false),
(3, 18, 4, false),
(4, 18, 4, false),
(5, 18, 2, false),
(6, 18, 3, false),
(7, 18, 2, false),
(8, 18, 0, false),
(9, 18, 1, false),
(10, 18, 2, false),
(11, 18, 0, false),
(12, 18, -2, false),
(13, 18, 3, false),
(14, 18, -1, false),
(15, 18, -2, false),
(16, 18, 1, false),
(17, 18, 1, false),
(18, 18, 1, false),
(19, 18, 2, false),
(20, 18, 0, false),
(1, 19, 0, false),
(2, 19, 0, false),
(3, 19, 0, false),
(4, 19, 1, false),
(5, 19, -2, false),
(6, 19, -2, false),
(7, 19, 0, false),
(8, 19, 3, false),
(9, 19, 0, false),
(10, 19, 4, false),
(11, 19, 3, false),
(12, 19, 0, false),
(13, 19, 5, true),
(14, 19, 4, false),
(15, 19, 5, true),
(16, 19, 1, false),
(17, 19, 5, true),
(18, 19, 5, true),
(19, 19, -1, false),
(20, 19, -1, false),
(1, 20, -2, false),
(2, 20, -1, false),
(3, 20, 1, false),
(4, 20, 1, false),
(5, 20, 4, false),
(6, 20, 2, false),
(7, 20, 3, false),
(8, 20, 1, false),
(9, 20, -1, false),
(10, 20, -1, false),
(11, 20, 3, false),
(12, 20, -1, false),
(13, 20, -2, false),
(14, 20, 3, false),
(15, 20, 0, false),
(16, 20, -2, false),
(17, 20, 3, false),
(18, 20, 5, true),
(19, 20, -2, false),
(20, 20, 0, false);


-- 0 - non magical items
-- 1 - magical items
-- 2 - cursed items
INSERT INTO item VALUES
-- id name desc value type person
(1, 'Rations', 'Food for one day', 1, 0, NULL),
(2, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, NULL),
(3, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, NULL),
(4, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, NULL),
(5, 'Gas Mask', 'Protect yourself from gas', 25, 0, NULL),
(6, 'Harpoon', 'A Harpoon made for fishing', 30, 0, NULL),
(7, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, NULL),
(8, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, NULL),
(9, 'Rope', '50 Feet of Rope', 1, 0, 1),
(10, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 1),
(11, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 1),
(12, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 1),
(13, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 1),
(14, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 1),
(15, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 1),
(16, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 1),
(17, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 1),
(18, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 1),
(19, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 1),
(20, 'Rope', '50 Feet of Rope', 1, 0, 2),
(21, 'Rations', 'Food for one day', 1, 0, 2),
(22, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 2),
(23, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 2),
(24, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 2),
(25, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 2),
(26, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 2),
(27, 'Gas Mask', 'Protect yourself from gas', 25, 0, 2),
(28, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 2),
(29, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 2),
(30, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 2),
(31, 'Rations', 'Food for one day', 1, 0, 3),
(32, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 3),
(33, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 3),
(34, 'Gas Mask', 'Protect yourself from gas', 25, 0, 3),
(35, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 3),
(36, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 3),
(37, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 3),
(38, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 3),
(39, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 3),
(40, 'Battering Shield', 'A strong shield', 110, 1, 3),
(41, 'Binding Mask', 'This rounded mask, made up of a polished slab of some unknown substance, is a ruddy color akin to a plum, with faded teal tentacle-like whorls decorating the outer edge', 830, 2, 3),
(42, 'Rope', '50 Feet of Rope', 1, 0, 4),
(43, 'Rations', 'Food for one day', 1, 0, 4),
(44, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 4),
(45, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 4),
(46, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 4),
(47, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 4),
(48, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 4),
(49, 'Gas Mask', 'Protect yourself from gas', 25, 0, 4),
(50, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 4),
(51, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 4),
(52, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 4),
(53, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 4),
(54, 'Binding Mask', 'This rounded mask, made up of a polished slab of some unknown substance, is a ruddy color akin to a plum, with faded teal tentacle-like whorls decorating the outer edge', 830, 2, 4),
(55, 'Blade of Vertigo', 'The Blade of Vertigo is a strange crystalline blade created by an obscure goddess supposedly named Vertigo', 2200, 2, 4),
(56, 'Rope', '50 Feet of Rope', 1, 0, 5),
(57, 'Rations', 'Food for one day', 1, 0, 5),
(58, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 5),
(59, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 5),
(60, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 5),
(61, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 5),
(62, 'Gas Mask', 'Protect yourself from gas', 25, 0, 5),
(63, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 5),
(64, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 5),
(65, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 5),
(66, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 5),
(67, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 5),
(68, 'Battering Shield', 'A strong shield', 110, 1, 5),
(69, 'Bead of Force', 'This small black sphere measures 3/4 of an inch in diameter and weighs an ounce.', 30, 1, 5),
(70, 'Blade of Sacrifice', 'Sharp on all ends, even the handle, the Blade of Sacrifice is a dangerous one.', 1201, 2, 5),
(71, 'Rope', '50 Feet of Rope', 1, 0, 6),
(72, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 6),
(73, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 6),
(74, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 6),
(75, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 6),
(76, 'Gas Mask', 'Protect yourself from gas', 25, 0, 6),
(77, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 6),
(78, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 6),
(79, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 6),
(80, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 6),
(81, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 6),
(82, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 6),
(83, 'Battering Shield', 'A strong shield', 110, 1, 6),
(84, 'Bead of Force', 'This small black sphere measures 3/4 of an inch in diameter and weighs an ounce.', 30, 1, 6),
(85, 'Rope', '50 Feet of Rope', 1, 0, 7),
(86, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 7),
(87, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 7),
(88, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 7),
(89, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 7),
(90, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 7),
(91, 'Gas Mask', 'Protect yourself from gas', 25, 0, 7),
(92, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 7),
(93, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 7),
(94, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 7),
(95, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 7),
(96, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 7),
(97, 'Battering Shield', 'A strong shield', 110, 1, 7),
(98, 'Bead of Force', 'This small black sphere measures 3/4 of an inch in diameter and weighs an ounce.', 30, 1, 7),
(99, 'Rope', '50 Feet of Rope', 1, 0, 8),
(100, 'Rations', 'Food for one day', 1, 0, 8),
(101, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 8),
(102, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 8),
(103, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 8),
(104, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 8),
(105, 'Gas Mask', 'Protect yourself from gas', 25, 0, 8),
(106, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 8),
(107, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 8),
(108, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 8),
(109, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 8),
(110, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 8),
(111, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 8),
(112, 'Bead of Force', 'This small black sphere measures 3/4 of an inch in diameter and weighs an ounce.', 30, 1, 8),
(113, 'Rope', '50 Feet of Rope', 1, 0, 9),
(114, 'Rations', 'Food for one day', 1, 0, 9),
(115, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 9),
(116, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 9),
(117, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 9),
(118, 'Gas Mask', 'Protect yourself from gas', 25, 0, 9),
(119, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 9),
(120, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 9),
(121, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 9),
(122, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 9),
(123, 'Rope', '50 Feet of Rope', 1, 0, 10),
(124, 'Rations', 'Food for one day', 1, 0, 10),
(125, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 10),
(126, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 10),
(127, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 10),
(128, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 10),
(129, 'Gas Mask', 'Protect yourself from gas', 25, 0, 10),
(130, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 10),
(131, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 10),
(132, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 10),
(133, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 10),
(134, 'Bead of Force', 'This small black sphere measures 3/4 of an inch in diameter and weighs an ounce.', 30, 1, 10),
(135, 'Rope', '50 Feet of Rope', 1, 0, 11),
(136, 'Rations', 'Food for one day', 1, 0, 11),
(137, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 11),
(138, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 11),
(139, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 11),
(140, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 11),
(141, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 11),
(142, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 11),
(143, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 11),
(144, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 11),
(145, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 11),
(146, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 11),
(147, 'Bead of Force', 'This small black sphere measures 3/4 of an inch in diameter and weighs an ounce.', 30, 1, 11),
(148, 'Rope', '50 Feet of Rope', 1, 0, 12),
(149, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 12),
(150, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 12),
(151, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 12),
(152, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 12),
(153, 'Gas Mask', 'Protect yourself from gas', 25, 0, 12),
(154, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 12),
(155, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 12),
(156, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 12),
(157, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 12),
(158, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 12),
(159, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 12),
(160, 'Battering Shield', 'A strong shield', 110, 1, 12),
(161, 'Bead of Force', 'This small black sphere measures 3/4 of an inch in diameter and weighs an ounce.', 30, 1, 12),
(162, 'Rope', '50 Feet of Rope', 1, 0, 13),
(163, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 13),
(164, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 13),
(165, 'Gas Mask', 'Protect yourself from gas', 25, 0, 13),
(166, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 13),
(167, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 13),
(168, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 13),
(169, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 13),
(170, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 13),
(171, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 13),
(172, 'Rope', '50 Feet of Rope', 1, 0, 14),
(173, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 14),
(174, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 14),
(175, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 14),
(176, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 14),
(177, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 14),
(178, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 14),
(179, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 14),
(180, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 14),
(181, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 14),
(182, 'Rations', 'Food for one day', 1, 0, 15),
(183, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 15),
(184, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 15),
(185, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 15),
(186, 'Gas Mask', 'Protect yourself from gas', 25, 0, 15),
(187, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 15),
(188, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 15),
(189, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 15),
(190, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 15),
(191, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 15),
(192, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 15),
(193, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 15),
(194, 'Battering Shield', 'A strong shield', 110, 1, 15),
(195, 'Bead of Force', 'This small black sphere measures 3/4 of an inch in diameter and weighs an ounce.', 30, 1, 15),
(196, 'Rations', 'Food for one day', 1, 0, 16),
(197, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 16),
(198, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 16),
(199, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 16),
(200, 'Gas Mask', 'Protect yourself from gas', 25, 0, 16),
(201, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 16),
(202, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 16),
(203, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 16),
(204, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 16),
(205, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 16),
(206, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 16),
(207, 'Bead of Force', 'This small black sphere measures 3/4 of an inch in diameter and weighs an ounce.', 30, 1, 16),
(208, 'Rope', '50 Feet of Rope', 1, 0, 17),
(209, 'Rations', 'Food for one day', 1, 0, 17),
(210, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 17),
(211, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 17),
(212, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 17),
(213, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 17),
(214, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 17),
(215, 'Gas Mask', 'Protect yourself from gas', 25, 0, 17),
(216, 'Balanced Axe', 'A well balanced Axe that makes attacking in succession easier', 60, 0, 17),
(217, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 17),
(218, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 17),
(219, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 17),
(220, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 17),
(221, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 17),
(222, 'Battering Shield', 'A strong shield', 110, 1, 17),
(223, 'Bead of Force', 'This small black sphere measures 3/4 of an inch in diameter and weighs an ounce.', 30, 1, 17),
(224, 'Rope', '50 Feet of Rope', 1, 0, 18),
(225, 'Rations', 'Food for one day', 1, 0, 18),
(226, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 18),
(227, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 18),
(228, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 18),
(229, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 18),
(230, 'Gas Mask', 'Protect yourself from gas', 25, 0, 18),
(231, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 18),
(232, 'Blackstaff', 'The Blackstaff is a sentient, rune-carved staff set with thin silver veins.', 250, 1, 18),
(233, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 18),
(234, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 18),
(235, 'Bead of Force', 'This small black sphere measures 3/4 of an inch in diameter and weighs an ounce.', 30, 1, 18),
(236, 'Rope', '50 Feet of Rope', 1, 0, 19),
(237, 'Rations', 'Food for one day', 1, 0, 19),
(238, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 19),
(239, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 19),
(240, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 19),
(241, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 19),
(242, 'Gas Mask', 'Protect yourself from gas', 25, 0, 19),
(243, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 19),
(244, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 19),
(245, 'Dragon Mask', 'Each dragon mask is a legendary wondrous item that reshapes to fit the face and head of a wearer attuned to it.', 175, 1, 19),
(246, 'Rope', '50 Feet of Rope', 1, 0, 20),
(247, 'Rations', 'Food for one day', 1, 0, 20),
(248, 'Torch', 'Wooden stake that can be lit. Is a light source when lit', 1, 0, 20),
(249, 'Crowbar', 'Can be used to crack open Crates', 1, 0, 20),
(250, 'Grappling Hook', 'Grappel yourself to something. Rope needs to be attached', 1, 0, 20),
(251, 'Spiked Shield', 'Shield with spikes attached for better defense', 15, 0, 20),
(252, 'Leather Armor', 'Armor to protect yourself a bit', 10, 0, 20),
(253, 'Gas Mask', 'Protect yourself from gas', 25, 0, 20),
(254, 'Harpoon', 'A Harpoon made for fishing', 30, 0, 20),
(255, 'Naval Cutlass', 'A Cutlass mostly used by sailors', 55, 0, 20),
(256, 'Dawnbringer', 'Lost for ages in the Underdark, Dawnbringer appears to be a gilded longsword hilt.', 540, 1, 20),
(257, 'Dragonlance', 'A dragonlance is a renowned weapon forged from rare metal with the aid of powerful artifacts.', 600, 1, 20);

INSERT INTO magical_item VALUES
(7, 'Animate Walking Statues, Dispel Magic'),
(8, 'Bonus Damage against dragons'),
(17, 'Animate Walking Statues, Dispel Magic'),
(18, 'Damage Absorption, Draconic Majesty'),
(19, 'Bonus Damage against dragons'),
(30, 'Animate Walking Statues, Dispel Magic'),
(38, 'The blade shines in the dark giving vision'),
(39, 'Bonus Damage against dragons'),
(40, 'Bonus Defense'),
(51, 'Animate Walking Statues, Dispel Magic'),
(52, 'The blade shines in the dark giving vision'),
(53, 'Damage Absorption, Draconic Majesty'),
(65, 'Animate Walking Statues, Dispel Magic'),
(66, 'The blade shines in the dark giving vision'),
(67, 'Damage Absorption, Draconic Majesty'),
(68, 'Bonus Defense'),
(69, 'Explodes on impact'),
(80, 'Animate Walking Statues, Dispel Magic'),
(81, 'The blade shines in the dark giving vision'),
(82, 'Bonus Damage against dragons'),
(83, 'Bonus Defense'),
(84, 'Explodes on impact'),
(95, 'Damage Absorption, Draconic Majesty'),
(96, 'Bonus Damage against dragons'),
(97, 'Bonus Defense'),
(98, 'Explodes on impact'),
(109, 'Animate Walking Statues, Dispel Magic'),
(110, 'Damage Absorption, Draconic Majesty'),
(111, 'Bonus Damage against dragons'),
(112, 'Explodes on impact'),
(122, 'Animate Walking Statues, Dispel Magic'),
(132, 'Damage Absorption, Draconic Majesty'),
(133, 'Bonus Damage against dragons'),
(134, 'Explodes on impact'),
(144, 'Animate Walking Statues, Dispel Magic'),
(145, 'The blade shines in the dark giving vision'),
(146, 'Bonus Damage against dragons'),
(147, 'Explodes on impact'),
(157, 'Animate Walking Statues, Dispel Magic'),
(158, 'The blade shines in the dark giving vision'),
(159, 'Bonus Damage against dragons'),
(160, 'Bonus Defense'),
(161, 'Explodes on impact'),
(169, 'The blade shines in the dark giving vision'),
(170, 'Damage Absorption, Draconic Majesty'),
(171, 'Bonus Damage against dragons'),
(180, 'Animate Walking Statues, Dispel Magic'),
(181, 'Damage Absorption, Draconic Majesty'),
(190, 'Animate Walking Statues, Dispel Magic'),
(191, 'The blade shines in the dark giving vision'),
(192, 'Damage Absorption, Draconic Majesty'),
(193, 'Bonus Damage against dragons'),
(194, 'Bonus Defense'),
(195, 'Explodes on impact'),
(204, 'Animate Walking Statues, Dispel Magic'),
(205, 'The blade shines in the dark giving vision'),
(206, 'Damage Absorption, Draconic Majesty'),
(207, 'Explodes on impact'),
(219, 'The blade shines in the dark giving vision'),
(220, 'Damage Absorption, Draconic Majesty'),
(221, 'Bonus Damage against dragons'),
(222, 'Bonus Defense'),
(223, 'Explodes on impact'),
(232, 'Animate Walking Statues, Dispel Magic'),
(233, 'The blade shines in the dark giving vision'),
(234, 'Bonus Damage against dragons'),
(235, 'Explodes on impact'),
(244, 'The blade shines in the dark giving vision'),
(245, 'Damage Absorption, Draconic Majesty'),
(256, 'The blade shines in the dark giving vision'),
(257, 'Bonus Damage against dragons');

INSERT INTO cursed_item VALUES
(41, 'Thrall to the Depths'),
(54, 'Thrall to the Depths'),
(55, 'Curse of Vertigo'),
(70, 'Sacrifice');