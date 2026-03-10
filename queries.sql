--simple queries

-- 1) List all films released in 2022:

SELECT film_id, title, release_year, language
FROM Film
WHERE release_year = 2022
ORDER BY title;

-- 2) Count films by country of origin (top 10): 

SELECT c.country_name, COUNT(*) AS films_count
FROM Film f
JOIN Country c ON f.country_id = c.country_id
GROUP BY c.country_name
ORDER BY films_count DESC
LIMIT 10;

--3) List films longer than 120 minutes:

SELECT title, release_year, runtime_minutes
FROM Film
WHERE runtime_minutes > 120
ORDER BY runtime_minutes DESC;

--Advanced queries

-- 1) Winners for a festival edition (festival + year): award name, film, winning person(s):

SELECT
  fest.festival_name,
  fest.year AS festival_year,
  aw.award_name,
  f.title AS film_title,
  GROUP_CONCAT(DISTINCT p.name SEPARATOR ', ') AS persons,
  n.result,
  n.nomination_date
FROM Award aw
JOIN Festival fest ON aw.festival_id = fest.festival_id
JOIN Nomination n ON n.award_id = aw.award_id AND n.result = 'Winner'
JOIN Film f ON n.film_id = f.film_id
LEFT JOIN Nomination_Person np ON np.nomination_id = n.nomination_id
LEFT JOIN Person p ON np.person_id = p.person_id
WHERE fest.festival_name = 'Venice Film Festival' AND fest.year = 2023
GROUP BY aw.award_id, n.nomination_id
ORDER BY aw.award_name;

-- 2) Top countries by number of award-winning films (film as the target of an award):

SELECT c.country_name, COUNT(DISTINCT n.nomination_id) AS awards_won
FROM Nomination n
JOIN Film f ON n.film_id = f.film_id
JOIN Country c ON f.country_id = c.country_id
WHERE n.result = 'Winner'
GROUP BY c.country_name
ORDER BY awards_won DESC
LIMIT 10;

-- 3) Films with their genres (comma-separated) and release year: --missing

SELECT f.film_id, f.title, f.release_year,
       IFNULL(GROUP_CONCAT(DISTINCT g.genre_name ORDER BY g.genre_name SEPARATOR ', '), 'Unknown') AS genres
FROM Film f
LEFT JOIN Film_Genre fg ON f.film_id = fg.film_id
LEFT JOIN Genre g ON fg.genre_id = g.genre_id
GROUP BY f.film_id, f.title, f.release_year
ORDER BY f.release_year DESC, f.title;
