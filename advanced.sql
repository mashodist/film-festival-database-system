--Advanced concepts

-- views

-- 1) Films with their genres (comma-separated) and release year:

SELECT f.film_id, f.title, f.release_year,
       IFNULL(GROUP_CONCAT(DISTINCT g.genre_name ORDER BY g.genre_name SEPARATOR ', '), 'Unknown') AS genres
FROM Film f
LEFT JOIN Film_Genre fg ON f.film_id = fg.film_id
LEFT JOIN Genre g ON fg.genre_id = g.genre_id
GROUP BY f.film_id, f.title, f.release_year
ORDER BY f.release_year DESC, f.title;

-- test

SELECT * FROM vw_film_genres WHERE title LIKE '%Poor Things%';


-- 2) vw_winners_summary — one-row-per-winner (festival edition / award / film / persons)

DROP VIEW IF EXISTS vw_winners_summary;
CREATE VIEW vw_winners_summary AS
SELECT
  fest.festival_id,
  fest.festival_name,
  fest.year AS festival_year,
  aw.award_id,
  aw.award_name,
  f.film_id,
  f.title AS film_title,
  GROUP_CONCAT(DISTINCT p.name ORDER BY p.name SEPARATOR ', ') AS persons,
  n.nomination_date,
  n.result
FROM Award aw
JOIN Festival fest ON aw.festival_id = fest.festival_id
JOIN Nomination n ON n.award_id = aw.award_id
JOIN Film f ON n.film_id = f.film_id
LEFT JOIN Nomination_Person np ON n.nomination_id = np.nomination_id
LEFT JOIN Person p ON np.person_id = p.person_id
WHERE n.result = 'Winner'
GROUP BY fest.festival_id, aw.award_id, n.nomination_id;


SELECT festival_name, festival_year, award_name, film_title, persons
FROM vw_winners_summary
WHERE festival_name='Venice Film Festival' AND festival_year=2023;



-- stored procedures 

-- 1) Adds a new country into the Country table safely.

DROP PROCEDURE IF EXISTS sp_add_country;
DELIMITER $$

CREATE PROCEDURE sp_add_country (
    IN p_country_name VARCHAR(120)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error inserting country.';
    END;

    START TRANSACTION;

    INSERT INTO Country (country_name)
    VALUES (p_country_name);

    COMMIT;

    SELECT CONCAT('Inserted country: ', p_country_name) AS message;
END $$

DELIMITER ;



CALL sp_add_country('kuwait');


-- 2) it counts Wins (where Nomination.result = 'Winner') across all festivals in the specified p_year. p_top_n controls how many rows to return.


DROP PROCEDURE IF EXISTS sp_top_awarded_films;
DELIMITER $$
CREATE PROCEDURE sp_top_awarded_films(
  IN p_year INT,       -- award year to consider (Award.year / Festival.year)
  IN p_top_n INT       -- how many top films to return
)
BEGIN
  /*
    Returns a resultset:
      film_id, title, release_year, wins_count
  */
  SELECT
    f.film_id,
    f.title,
    f.release_year,
    COUNT(*) AS wins_count
  FROM Nomination n
  JOIN Award a ON n.award_id = a.award_id
  JOIN Film f  ON n.film_id = f.film_id
  WHERE a.year = p_year
    AND n.result = 'Winner'
  GROUP BY f.film_id
  ORDER BY wins_count DESC, f.title
  LIMIT p_top_n;
END $$
DELIMITER ;


CALL sp_top_awarded_films(2023, 10);

