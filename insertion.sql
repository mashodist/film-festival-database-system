-- data_Mashood_21978586.sql
USE Mashood_21978586;
SET FOREIGN_KEY_CHECKS=0;

-- 1) Countries (expanded to include all referenced countries)
INSERT IGNORE INTO Country (country_name) VALUES 
('France'),('Italy'),('Germany'),('United States'),('United Kingdom'),('Japan'),('South Korea'),('China'),
('Spain'),('Brazil'),('Mexico'),('India'),('Russia'),('Poland'),('Sweden'),('Denmark'),('Norway'),('Finland'),
('Canada'),('Australia'),('Iran'),('Turkey'),('Egypt'),('Argentina'),('Chile'),('Belgium'),('Netherlands'),
('Austria'),('Switzerland'),('Portugal'),('Greece'),('Israel'),('Lebanon'),('Philippines'),('Vietnam'),('Thailand'),
('Paraguay'),('Hungary'),('Senegal'),('Ireland'),('New Zealand'),('Iceland'),('Congo'),('Bolivia');

-- 2) Festivals (edition rows)
INSERT IGNORE INTO Festival (festival_name, year, city, country_id, start_date, end_date) VALUES 
('Berlin International Film Festival', 2023, 'Berlin', (SELECT country_id FROM Country WHERE country_name='Germany'), '2023-02-16', '2023-02-26'),
('Berlin International Film Festival', 2022, 'Berlin', (SELECT country_id FROM Country WHERE country_name='Germany'), '2022-02-10', '2022-02-20'),
('Berlin International Film Festival', 2020, 'Berlin', (SELECT country_id FROM Country WHERE country_name='Germany'), '2020-02-20', '2020-03-01'),
('Berlin International Film Festival', 2019, 'Berlin', (SELECT country_id FROM Country WHERE country_name='Germany'), '2019-02-07', '2019-02-17'),
('Berlin International Film Festival', 2018, 'Berlin', (SELECT country_id FROM Country WHERE country_name='Germany'), '2018-02-15', '2018-02-25'),
('Berlin International Film Festival', 2017, 'Berlin', (SELECT country_id FROM Country WHERE country_name='Germany'), '2017-02-09', '2017-02-19'),
('Berlin International Film Festival', 2016, 'Berlin', (SELECT country_id FROM Country WHERE country_name='Germany'), '2016-02-11', '2016-02-21'),
('Venice Film Festival', 2023, 'Venice', (SELECT country_id FROM Country WHERE country_name='Italy'), '2023-08-30', '2023-09-09'),
('Venice Film Festival', 2022, 'Venice', (SELECT country_id FROM Country WHERE country_name='Italy'), '2022-08-31', '2022-09-10'),
('Venice Film Festival', 2021, 'Venice', (SELECT country_id FROM Country WHERE country_name='Italy'), '2021-09-01', '2021-09-11'),
('Venice Film Festival', 2019, 'Venice', (SELECT country_id FROM Country WHERE country_name='Italy'), '2019-08-28', '2019-09-07'),
('Venice Film Festival', 2018, 'Venice', (SELECT country_id FROM Country WHERE country_name='Italy'), '2018-08-29', '2018-09-08'),
('Venice Film Festival', 2017, 'Venice', (SELECT country_id FROM Country WHERE country_name='Italy'), '2017-08-30', '2017-09-09');

-- 3) Awards 
INSERT IGNORE INTO Award (award_name, year, category, festival_id) VALUES 
('Golden Bear', 2023, 'Best Film', (SELECT festival_id FROM Festival WHERE festival_name='Berlin International Film Festival' AND year=2023)),
('Silver Bear Grand Jury Prize', 2023, 'Jury Grand Prix', (SELECT festival_id FROM Festival WHERE festival_name='Berlin International Film Festival' AND year=2023)),
('Silver Bear for Best Director', 2023, 'Best Director', (SELECT festival_id FROM Festival WHERE festival_name='Berlin International Film Festival' AND year=2023)),
('Silver Bear for Best Leading Performance', 2023, 'Best Actor/Actress', (SELECT festival_id FROM Festival WHERE festival_name='Berlin International Film Festival' AND year=2023)),
('Silver Bear for Best Supporting Performance', 2023, 'Best Supporting Actor/Actress', (SELECT festival_id FROM Festival WHERE festival_name='Berlin International Film Festival' AND year=2023)),
('Silver Bear for Best Screenplay', 2023, 'Best Screenplay', (SELECT festival_id FROM Festival WHERE festival_name='Berlin International Film Festival' AND year=2023)),

('Golden Bear', 2022, 'Best Film', (SELECT festival_id FROM Festival WHERE festival_name='Berlin International Film Festival' AND year=2022)),
('Silver Bear Grand Jury Prize', 2022, 'Jury Grand Prix', (SELECT festival_id FROM Festival WHERE festival_name='Berlin International Film Festival' AND year=2022)),
('Silver Bear for Best Director', 2022, 'Best Director', (SELECT festival_id FROM Festival WHERE festival_name='Berlin International Film Festival' AND year=2022)),

('Golden Bear', 2020, 'Best Film', (SELECT festival_id FROM Festival WHERE festival_name='Berlin International Film Festival' AND year=2020)),
('Silver Bear Grand Jury Prize', 2020, 'Jury Grand Prix', (SELECT festival_id FROM Festival WHERE festival_name='Berlin International Film Festival' AND year=2020)),

('Golden Lion', 2023, 'Best Film', (SELECT festival_id FROM Festival WHERE festival_name='Venice Film Festival' AND year=2023)),
('Grand Jury Prize', 2023, 'Jury Grand Prix', (SELECT festival_id FROM Festival WHERE festival_name='Venice Film Festival' AND year=2023)),
('Silver Lion for Best Director', 2023, 'Best Director', (SELECT festival_id FROM Festival WHERE festival_name='Venice Film Festival' AND year=2023)),
('Volpi Cup for Best Actress', 2023, 'Best Actress', (SELECT festival_id FROM Festival WHERE festival_name='Venice Film Festival' AND year=2023)),
('Volpi Cup for Best Actor', 2023, 'Best Actor', (SELECT festival_id FROM Festival WHERE festival_name='Venice Film Festival' AND year=2023)),

('Golden Lion', 2022, 'Best Film', (SELECT festival_id FROM Festival WHERE festival_name='Venice Film Festival' AND year=2022)),
('Grand Jury Prize', 2022, 'Jury Grand Prix', (SELECT festival_id FROM Festival WHERE festival_name='Venice Film Festival' AND year=2022)),

('Golden Lion', 2021, 'Best Film', (SELECT festival_id FROM Festival WHERE festival_name='Venice Film Festival' AND year=2021)),
('Grand Jury Prize', 2021, 'Jury Grand Prix', (SELECT festival_id FROM Festival WHERE festival_name='Venice Film Festival' AND year=2021));

-- 4) Films 
INSERT IGNORE INTO Film (title, release_year, language, country_id, runtime_minutes) VALUES 
('Sparta', 2022, 'German', (SELECT country_id FROM Country WHERE country_name='Austria'), 112),
('Robe of Gems', 2022, 'Spanish', (SELECT country_id FROM Country WHERE country_name='Mexico'), 136),
('Alcarràs', 2022, 'Catalan', (SELECT country_id FROM Country WHERE country_name='Spain'), 120),
('A E I O U – A Quick Alphabet of Love', 2022, 'German', (SELECT country_id FROM Country WHERE country_name='Germany'), 106),
('Bad Luck Banging or Loony Porn', 2021, 'Romanian', (SELECT country_id FROM Country WHERE country_name='Romania'), 106),
('Wheel of Fortune and Fantasy', 2021, 'Japanese', (SELECT country_id FROM Country WHERE country_name='Japan'), 121),
('Introduction', 2021, 'Korean', (SELECT country_id FROM Country WHERE country_name='South Korea'), 66),
('There Is No Evil', 2020, 'Persian', (SELECT country_id FROM Country WHERE country_name='Iran'), 150),
('Never Rarely Sometimes Always', 2020, 'English', (SELECT country_id FROM Country WHERE country_name='United States'), 101),
('The Works and Days', 2020, 'Japanese', (SELECT country_id FROM Country WHERE country_name='Japan'), 480),
('Synonyms', 2019, 'Hebrew', (SELECT country_id FROM Country WHERE country_name='Israel'), 123),
('By the Grace of God', 2019, 'French', (SELECT country_id FROM Country WHERE country_name='France'), 137),
('System Crasher', 2019, 'German', (SELECT country_id FROM Country WHERE country_name='Germany'), 118),
('Touch Me Not', 2018, 'English', (SELECT country_id FROM Country WHERE country_name='Romania'), 125),
('Mug', 2018, 'Polish', (SELECT country_id FROM Country WHERE country_name='Poland'), 91),
('The Heiresses', 2018, 'Spanish', (SELECT country_id FROM Country WHERE country_name='Chile'), 98),
('On Body and Soul', 2017, 'Hungarian', (SELECT country_id FROM Country WHERE country_name='Hungary'), 116),
('Félicité', 2017, 'French', (SELECT country_id FROM Country WHERE country_name='Senegal'), 123),
('Spoor', 2017, 'Polish', (SELECT country_id FROM Country WHERE country_name='Poland'), 128),
('Poor Things', 2023, 'English', (SELECT country_id FROM Country WHERE country_name='United States'), 141),
('All the Beauty and the Bloodshed', 2022, 'English', (SELECT country_id FROM Country WHERE country_name='United States'), 117),
('L''immensità', 2022, 'Italian', (SELECT country_id FROM Country WHERE country_name='Italy'), 97),
('The Banshees of Inisherin', 2022, 'English', (SELECT country_id FROM Country WHERE country_name='Ireland'), 114),
('Happening', 2021, 'French', (SELECT country_id FROM Country WHERE country_name='France'), 100),
('The Power of the Dog', 2021, 'English', (SELECT country_id FROM Country WHERE country_name='New Zealand'), 126),
('The Hand of God', 2021, 'Italian', (SELECT country_id FROM Country WHERE country_name='Italy'), 130),
('Nomadland', 2020, 'English', (SELECT country_id FROM Country WHERE country_name='United States'), 107),
('Joker', 2019, 'English', (SELECT country_id FROM Country WHERE country_name='United States'), 122),
('Roma', 2018, 'Spanish', (SELECT country_id FROM Country WHERE country_name='Mexico'), 135),
('The Shape of Water', 2017, 'English', (SELECT country_id FROM Country WHERE country_name='United States'), 123),
('My New Film', 2025, NULL, NULL, NULL);

-- 5) Persons
INSERT IGNORE INTO Person (name, primary_role, nationality_id) VALUES 
('Ulrich Seidl', 'Director', (SELECT country_id FROM Country WHERE country_name='Austria')),
('Natalia López Gallardo', 'Director', (SELECT country_id FROM Country WHERE country_name='Mexico')),
('Carla Simón', 'Director', (SELECT country_id FROM Country WHERE country_name='Spain')),
('Nicolette Krebitz', 'Director', (SELECT country_id FROM Country WHERE country_name='Germany')),
('Radu Jude', 'Director', (SELECT country_id FROM Country WHERE country_name='Romania')),
('Ryusuke Hamaguchi', 'Director', (SELECT country_id FROM Country WHERE country_name='Japan')),
('Hong Sang-soo', 'Director', (SELECT country_id FROM Country WHERE country_name='South Korea')),
('Mohammad Rasoulof', 'Director', (SELECT country_id FROM Country WHERE country_name='Iran')),
('Eliza Hittman', 'Director', (SELECT country_id FROM Country WHERE country_name='United States')),
('Tatsushi Ōmori', 'Director', (SELECT country_id FROM Country WHERE country_name='Japan')),
('Nadav Lapid', 'Director', (SELECT country_id FROM Country WHERE country_name='Israel')),
('François Ozon', 'Director', (SELECT country_id FROM Country WHERE country_name='France')),
('Nora Fingscheidt', 'Director', (SELECT country_id FROM Country WHERE country_name='Germany')),
('Adina Pintilie', 'Director', (SELECT country_id FROM Country WHERE country_name='Romania')),
('Małgorzata Szumowska', 'Director', (SELECT country_id FROM Country WHERE country_name='Poland')),
('Marcelo Martinessi', 'Director', (SELECT country_id FROM Country WHERE country_name='Paraguay')),
('Ildikó Enyedi', 'Director', (SELECT country_id FROM Country WHERE country_name='Hungary')),
('Alain Gomis', 'Director', (SELECT country_id FROM Country WHERE country_name='France')),
('Agnieszka Holland', 'Director', (SELECT country_id FROM Country WHERE country_name='Poland')),
('Yorgos Lanthimos', 'Director', (SELECT country_id FROM Country WHERE country_name='Greece')),
('Laura Poitras', 'Director', (SELECT country_id FROM Country WHERE country_name='United States')),
('Emanuele Crialese', 'Director', (SELECT country_id FROM Country WHERE country_name='Italy')),
('Martin McDonagh', 'Director', (SELECT country_id FROM Country WHERE country_name='United Kingdom')),
('Audrey Diwan', 'Director', (SELECT country_id FROM Country WHERE country_name='France')),
('Jane Campion', 'Director', (SELECT country_id FROM Country WHERE country_name='New Zealand')),
('Paolo Sorrentino', 'Director', (SELECT country_id FROM Country WHERE country_name='Italy')),
('Chloé Zhao', 'Director', (SELECT country_id FROM Country WHERE country_name='China')),
('Todd Phillips', 'Director', (SELECT country_id FROM Country WHERE country_name='United States')),
('Alfonso Cuarón', 'Director', (SELECT country_id FROM Country WHERE country_name='Mexico')),
('Guillermo del Toro', 'Director', (SELECT country_id FROM Country WHERE country_name='Mexico')),

('Sophie Rois', 'Actor', (SELECT country_id FROM Country WHERE country_name='Austria')),
('Nailea Norvind', 'Actor', (SELECT country_id FROM Country WHERE country_name='Mexico')),
('Anna Castillo', 'Actor', (SELECT country_id FROM Country WHERE country_name='Spain')),
('Udo Kier', 'Actor', (SELECT country_id FROM Country WHERE country_name='Germany')),
('Katia Pascariu', 'Actor', (SELECT country_id FROM Country WHERE country_name='Romania')),
('Kotone Furukawa', 'Actor', (SELECT country_id FROM Country WHERE country_name='Japan')),
('Shin Seok-ho', 'Actor', (SELECT country_id FROM Country WHERE country_name='South Korea')),
('Baran Rasoulof', 'Actor', (SELECT country_id FROM Country WHERE country_name='Iran')),
('Sidney Flanigan', 'Actor', (SELECT country_id FROM Country WHERE country_name='United States')),
('Rinko Kikuchi', 'Actor', (SELECT country_id FROM Country WHERE country_name='Japan')),
('Tom Mercier', 'Actor', (SELECT country_id FROM Country WHERE country_name='Israel')),
('Melvil Poupaud', 'Actor', (SELECT country_id FROM Country WHERE country_name='France')),
('Helena Zengel', 'Actor', (SELECT country_id FROM Country WHERE country_name='Germany')),
('Tómas Lemarquis', 'Actor', (SELECT country_id FROM Country WHERE country_name='Iceland')),
('Mateusz Kościukiewicz', 'Actor', (SELECT country_id FROM Country WHERE country_name='Poland')),
('Ana Brun', 'Actor', (SELECT country_id FROM Country WHERE country_name='Paraguay')),
('Géza Morcsányi', 'Actor', (SELECT country_id FROM Country WHERE country_name='Hungary')),
('Véro Tshanda Beya Mputu', 'Actor', (SELECT country_id FROM Country WHERE country_name='Congo')),
('Agnieszka Mandat', 'Actor', (SELECT country_id FROM Country WHERE country_name='Poland')),
('Emma Stone', 'Actor', (SELECT country_id FROM Country WHERE country_name='United States')),
('Willem Dafoe', 'Actor', (SELECT country_id FROM Country WHERE country_name='United States')),
('Nan Goldin', 'Actor', (SELECT country_id FROM Country WHERE country_name='United States')),
('Penélope Cruz', 'Actor', (SELECT country_id FROM Country WHERE country_name='Spain')),
('Colin Farrell', 'Actor', (SELECT country_id FROM Country WHERE country_name='Ireland')),
('Anamaria Vartolomei', 'Actor', (SELECT country_id FROM Country WHERE country_name='Romania')),
('Benedict Cumberbatch', 'Actor', (SELECT country_id FROM Country WHERE country_name='United Kingdom')),
('Toni Servillo', 'Actor', (SELECT country_id FROM Country WHERE country_name='Italy')),
('Frances McDormand', 'Actor', (SELECT country_id FROM Country WHERE country_name='United States')),
('Joaquin Phoenix', 'Actor', (SELECT country_id FROM Country WHERE country_name='United States')),
('Yalitza Aparicio', 'Actor', (SELECT country_id FROM Country WHERE country_name='Mexico')),
('Sally Hawkins', 'Actor', (SELECT country_id FROM Country WHERE country_name='United Kingdom')),

('Robbie Ryan', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Ireland')),
('Jörg Widmer', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Germany')),
('Diego García', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Mexico')),
('Daniela Cajías', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Bolivia')),
('Reinhold Vorschneider', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Germany')),
('Marius Panduru', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Romania')),
('Yamazaki Akiko', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Japan')),
('Hong Kyung-pyo', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='South Korea')),
('Ashkan Ashkani', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Iran')),
('Hélène Louvart', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='France')),
('Shai Goldman', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Israel')),
('Yorick Le Saux', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='France')),
('Yunus Roy Imer', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Turkey')),
('Michał Englert', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Poland')),
('Rui Poças', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Portugal')),
('Máté Herbai', 'Cinematographer', (SELECT country_id FROM Country WHERE country_name='Hungary'));

-- 6) Film_Person credits (directors, some actors, cinematographers)
INSERT IGNORE INTO Film_Person (film_id, person_id, role_in_film, credit_order)
-- directors
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Ulrich Seidl' AND f.title = 'Sparta' AND f.release_year = 2022
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Natalia López Gallardo' AND f.title = 'Robe of Gems' AND f.release_year = 2022
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Carla Simón' AND f.title = 'Alcarràs' AND f.release_year = 2022
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Nicolette Krebitz' AND f.title = 'A E I O U – A Quick Alphabet of Love' AND f.release_year = 2022
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Radu Jude' AND f.title = 'Bad Luck Banging or Loony Porn' AND f.release_year = 2021
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Ryusuke Hamaguchi' AND f.title = 'Wheel of Fortune and Fantasy' AND f.release_year = 2021
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Mohammad Rasoulof' AND f.title = 'There Is No Evil' AND f.release_year = 2020
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Eliza Hittman' AND f.title = 'Never Rarely Sometimes Always' AND f.release_year = 2020
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Yorgos Lanthimos' AND f.title = 'Poor Things' AND f.release_year = 2023
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Laura Poitras' AND f.title = 'All the Beauty and the Bloodshed' AND f.release_year = 2022
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Audrey Diwan' AND f.title = 'Happening' AND f.release_year = 2021
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Jane Campion' AND f.title = 'The Power of the Dog' AND f.release_year = 2021
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Todd Phillips' AND f.title = 'Joker' AND f.release_year = 2019
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Alfonso Cuarón' AND f.title = 'Roma' AND f.release_year = 2018
UNION
SELECT f.film_id, p.person_id, 'Director', 1
FROM Film f JOIN Person p ON p.name = 'Guillermo del Toro' AND f.title = 'The Shape of Water' AND f.release_year = 2017;

-- actors sample
INSERT IGNORE INTO Film_Person (film_id, person_id, role_in_film, credit_order)
SELECT f.film_id, p.person_id, 'Actor', 1
FROM Film f JOIN Person p ON p.name = 'Emma Stone' AND f.title = 'Poor Things' AND f.release_year = 2023
UNION
SELECT f.film_id, p.person_id, 'Actor', 1
FROM Film f JOIN Person p ON p.name = 'Willem Dafoe' AND f.title = 'Poor Things' AND f.release_year = 2023
UNION
SELECT f.film_id, p.person_id, 'Actor', 1
FROM Film f JOIN Person p ON p.name = 'Colin Farrell' AND f.title = 'The Banshees of Inisherin' AND f.release_year = 2022
UNION
SELECT f.film_id, p.person_id, 'Actor', 1
FROM Film f JOIN Person p ON p.name = 'Penélope Cruz' AND f.title = 'L''immensità' AND f.release_year = 2022;

-- cinematographers sample
INSERT IGNORE INTO Film_Person (film_id, person_id, role_in_film, credit_order)
SELECT f.film_id, p.person_id, 'Cinematographer', 1
FROM Film f JOIN Person p ON p.name = 'Robbie Ryan' AND f.title = 'The Power of the Dog' AND f.release_year = 2021
UNION
SELECT f.film_id, p.person_id, 'Cinematographer', 1
FROM Film f JOIN Person p ON p.name = 'Yorick Le Saux' AND f.title = 'The Shape of Water' AND f.release_year = 2017;

-- 7) Nomination (film-level nominations/wins)
INSERT IGNORE INTO Nomination (nomination_date, result, film_id, award_id, notes) VALUES
('2023-02-25', 'Winner',
  (SELECT film_id FROM Film WHERE title='Sparta' AND release_year=2022),
  (SELECT award_id FROM Award WHERE award_name='Golden Bear' AND year=2023),
  'Best Film'
),
('2023-02-25', 'Winner',
  (SELECT film_id FROM Film WHERE title='Robe of Gems' AND release_year=2022),
  (SELECT award_id FROM Award WHERE award_name='Silver Bear Grand Jury Prize' AND year=2023),
  'Jury Grand Prix'
),
('2023-02-25', 'Winner',
  (SELECT film_id FROM Film WHERE title='Alcarràs' AND release_year=2022),
  (SELECT award_id FROM Award WHERE award_name='Silver Bear for Best Director' AND year=2023),
  'Best Director'
),
('2023-02-25', 'Winner',
  (SELECT film_id FROM Film WHERE title='A E I O U – A Quick Alphabet of Love' AND release_year=2022),
  (SELECT award_id FROM Award WHERE award_name='Silver Bear for Best Leading Performance' AND year=2023),
  'Best Leading Performance'
),
('2022-02-20', 'Winner',
  (SELECT film_id FROM Film WHERE title='Alcarràs' AND release_year=2022),
  (SELECT award_id FROM Award WHERE award_name='Golden Bear' AND year=2022),
  'Best Film'
),
('2022-02-20', 'Winner',
  (SELECT film_id FROM Film WHERE title='The Banshees of Inisherin' AND release_year=2022),
  (SELECT award_id FROM Award WHERE award_name='Silver Bear for Best Screenplay' AND year=2022),
  'Best Screenplay'
),
('2020-03-01', 'Winner',
  (SELECT film_id FROM Film WHERE title='There Is No Evil' AND release_year=2020),
  (SELECT award_id FROM Award WHERE award_name='Golden Bear' AND year=2020),
  'Best Film'
),
('2020-03-01', 'Winner',
  (SELECT film_id FROM Film WHERE title='Never Rarely Sometimes Always' AND release_year=2020),
  (SELECT award_id FROM Award WHERE award_name='Silver Bear Grand Jury Prize' AND year=2020),
  'Jury Grand Prix'
),
('2023-09-09', 'Winner',
  (SELECT film_id FROM Film WHERE title='Poor Things' AND release_year=2023),
  (SELECT award_id FROM Award WHERE award_name='Golden Lion' AND year=2023),
  'Best Film'
),
('2023-09-09', 'Winner',
  (SELECT film_id FROM Film WHERE title='Poor Things' AND release_year=2023),
  (SELECT award_id FROM Award WHERE award_name='Volpi Cup for Best Actress' AND year=2023),
  'Best Actress'
),
('2023-09-09', 'Winner',
  (SELECT film_id FROM Film WHERE title='Poor Things' AND release_year=2023),
  (SELECT award_id FROM Award WHERE award_name='Volpi Cup for Best Actor' AND year=2023),
  'Best Actor'
),
('2022-09-10', 'Winner',
  (SELECT film_id FROM Film WHERE title='All the Beauty and the Bloodshed' AND release_year=2022),
  (SELECT award_id FROM Award WHERE award_name='Golden Lion' AND year=2022),
  'Best Film'
),
('2022-09-10', 'Winner',
  (SELECT film_id FROM Film WHERE title='L''immensità' AND release_year=2022),
  (SELECT award_id FROM Award WHERE award_name='Volpi Cup for Best Actress' AND year=2022),
  'Best Actress'
),
('2022-09-10', 'Winner',
  (SELECT film_id FROM Film WHERE title='The Banshees of Inisherin' AND release_year=2022),
  (SELECT award_id FROM Award WHERE award_name='Volpi Cup for Best Actor' AND year=2022),
  'Best Actor'
),
('2021-09-11', 'Winner',
  (SELECT film_id FROM Film WHERE title='Happening' AND release_year=2021),
  (SELECT award_id FROM Award WHERE award_name='Golden Lion' AND year=2021),
  'Best Film'
),
('2021-09-11', 'Winner',
  (SELECT film_id FROM Film WHERE title='Happening' AND release_year=2021),
  (SELECT award_id FROM Award WHERE award_name='Volpi Cup for Best Actress' AND year=2021),
  'Best Actress'
),
('2021-09-11', 'Winner',
  (SELECT film_id FROM Film WHERE title='The Power of the Dog' AND release_year=2021),
  (SELECT award_id FROM Award WHERE award_name='Silver Lion for Best Director' AND year=2021),
  'Best Director'
),
('2019-09-07', 'Winner',
  (SELECT film_id FROM Film WHERE title='Joker' AND release_year=2019),
  (SELECT award_id FROM Award WHERE award_name='Golden Lion' AND year=2019),
  'Best Film'
),
('2018-09-08', 'Winner',
  (SELECT film_id FROM Film WHERE title='Roma' AND release_year=2018),
  (SELECT award_id FROM Award WHERE award_name='Golden Lion' AND year=2018),
  'Best Film'
),
('2017-09-09', 'Winner',
  (SELECT film_id FROM Film WHERE title='The Shape of Water' AND release_year=2017),
  (SELECT award_id FROM Award WHERE award_name='Golden Lion' AND year=2017),
  'Best Film'
);

-- 8) Nomination_Person mapping (link nominated/winning persons)
INSERT IGNORE INTO Nomination_Person (nomination_id, person_id, role_in_nomination)
SELECT n.nomination_id, p.person_id, 'Recipient'
FROM Nomination n
JOIN Film f ON f.film_id = n.film_id
JOIN Person p ON
  (p.name = 'Ulrich Seidl' AND f.title = 'Sparta')
  OR (p.name = 'Natalia López Gallardo' AND f.title = 'Robe of Gems')
  OR (p.name = 'Carla Simón' AND f.title = 'Alcarràs')
  OR (p.name = 'Nicolette Krebitz' AND f.title = 'A E I O U – A Quick Alphabet of Love')
  OR (p.name = 'Radu Jude' AND f.title = 'Bad Luck Banging or Loony Porn')
  OR (p.name = 'Ryusuke Hamaguchi' AND f.title = 'Wheel of Fortune and Fantasy')
  OR (p.name = 'Mohammad Rasoulof' AND f.title = 'There Is No Evil')
  OR (p.name = 'Eliza Hittman' AND f.title = 'Never Rarely Sometimes Always')
  OR (p.name = 'Yorgos Lanthimos' AND f.title = 'Poor Things')
  OR (p.name = 'Laura Poitras' AND f.title = 'All the Beauty and the Bloodshed')
  OR (p.name = 'Audrey Diwan' AND f.title = 'Happening')
  OR (p.name = 'Jane Campion' AND f.title = 'The Power of the Dog')
  OR (p.name = 'Todd Phillips' AND f.title = 'Joker')
  OR (p.name = 'Alfonso Cuarón' AND f.title = 'Roma')
  OR (p.name = 'Guillermo del Toro' AND f.title = 'The Shape of Water')
  OR (p.name = 'Emma Stone' AND f.title = 'Poor Things')
  OR (p.name = 'Willem Dafoe' AND f.title = 'Poor Things')
  OR (p.name = 'Colin Farrell' AND f.title = 'The Banshees of Inisherin')
  OR (p.name = 'Penélope Cruz' AND f.title = 'L''immensità')
WHERE n.nomination_date IS NOT NULL;

-- 9) Genres (list)
INSERT IGNORE INTO Genre (genre_name) VALUES
('Drama'),
('Thriller'),
('Romance'),
('Comedy'),
('Satire'),
('Anthology'),
('Documentary'),
('Black comedy'),
('Musical'),
('Eco-thriller'),
('Science Fiction'),
('Tragicomedy'),
('Western'),
('Psychological thriller'),
('Crime'),
('Romantic fantasy');

-- 10) Film_Genre mappings (from your list)
-- Sparta (2022) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='Sparta' AND f.release_year=2022;

-- Robe of Gems (2022) - Drama, Thriller
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Drama','Thriller')
 WHERE f.title='Robe of Gems' AND f.release_year=2022;

-- Alcarràs (2022) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='Alcarràs' AND f.release_year=2022;

-- A E I O U – A Quick Alphabet of Love (2022) - Drama, Romance
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Drama','Romance')
 WHERE f.title LIKE 'A E I O U%' AND f.release_year=2022;

-- Bad Luck Banging or Loony Porn (2021) - Comedy, Drama, Satire
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Comedy','Drama','Satire')
 WHERE f.title='Bad Luck Banging or Loony Porn' AND f.release_year=2021;

-- Wheel of Fortune and Fantasy (2021) - Drama, Romance, Anthology
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Drama','Romance','Anthology')
 WHERE f.title='Wheel of Fortune and Fantasy' AND f.release_year=2021;

-- Introduction (2021) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='Introduction' AND f.release_year=2021;

-- There Is No Evil (2020) - Drama, Anthology
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Drama','Anthology')
 WHERE f.title='There Is No Evil' AND f.release_year=2020;

-- Never Rarely Sometimes Always (2020) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='Never Rarely Sometimes Always' AND f.release_year=2020;

-- The Works and Days (2020) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='The Works and Days' AND f.release_year=2020;

-- Synonyms (2019) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='Synonyms' AND f.release_year=2019;

-- By the Grace of God (2019) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='By the Grace of God' AND f.release_year=2019;

-- System Crasher (2019) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='System Crasher' AND f.release_year=2019;

-- Touch Me Not (2018) - Drama, Documentary
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Drama','Documentary')
 WHERE f.title='Touch Me Not' AND f.release_year=2018;

-- Mug (2018) - Drama, Black comedy
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Drama','Black comedy')
 WHERE f.title='Mug' AND f.release_year=2018;

-- The Heiresses (2018) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='The Heiresses' AND f.release_year=2018;

-- On Body and Soul (2017) - Drama, Romance
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Drama','Romance')
 WHERE f.title='On Body and Soul' AND f.release_year=2017;

-- Félicité (2017) - Drama, Musical
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Drama','Musical')
 WHERE f.title='Félicité' AND f.release_year=2017;

-- Spoor (2017) - Drama, Thriller, Eco-thriller
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Drama','Thriller','Eco-thriller')
 WHERE f.title='Spoor' AND f.release_year=2017;

-- Poor Things (2023) - Science Fiction, Comedy, Romance
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Science Fiction','Comedy','Romance')
 WHERE f.title='Poor Things' AND f.release_year=2023;

-- All the Beauty and the Bloodshed (2022) - Documentary
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Documentary'
 WHERE f.title='All the Beauty and the Bloodshed' AND f.release_year=2022;

-- L'immensità (2022) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='L''immensità' AND f.release_year=2022;

-- The Banshees of Inisherin (2022) - Tragicomedy, Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Tragicomedy','Drama')
 WHERE f.title='The Banshees of Inisherin' AND f.release_year=2022;

-- Happening (2021) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='Happening' AND f.release_year=2021;

-- The Power of the Dog (2021) - Western, Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Western','Drama')
 WHERE f.title='The Power of the Dog' AND f.release_year=2021;

-- The Hand of God (2021) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='The Hand of God' AND f.release_year=2021;

-- Nomadland (2020) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='Nomadland' AND f.release_year=2020;

-- Joker (2019) - Psychological thriller, Crime, Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Psychological thriller','Crime','Drama')
 WHERE f.title='Joker' AND f.release_year=2019;

-- Roma (2018) - Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name='Drama'
 WHERE f.title='Roma' AND f.release_year=2018;

-- The Shape of Water (2017) - Romantic fantasy, Drama
INSERT IGNORE INTO Film_Genre (film_id, genre_id)
SELECT f.film_id, g.genre_id FROM Film f JOIN Genre g ON g.genre_name IN ('Romantic fantasy','Drama')
 WHERE f.title='The Shape of Water' AND f.release_year=2017;

-- My New Film (2025) - no genre assigned (left unmapped)

SET FOREIGN_KEY_CHECKS=1;

