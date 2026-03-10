-- schema_Mashood_21978586.sql
CREATE DATABASE IF NOT EXISTS Mashood_21978586 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
USE Mashood_21978586;

SET FOREIGN_KEY_CHECKS=0;

-- Drop if exist (safe)
DROP TABLE IF EXISTS Nomination_Person;
DROP TABLE IF EXISTS Nomination;
DROP TABLE IF EXISTS Award;
DROP TABLE IF EXISTS Film_Genre;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Film_Person;
DROP TABLE IF EXISTS Film;
DROP TABLE IF EXISTS Festival;
DROP TABLE IF EXISTS Person;
DROP TABLE IF EXISTS Country;

-- Country
CREATE TABLE Country (
  country_id INT AUTO_INCREMENT PRIMARY KEY,
  country_name VARCHAR(120) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Festival (edition)
CREATE TABLE Festival (
  festival_id INT AUTO_INCREMENT PRIMARY KEY,
  festival_name VARCHAR(200) NOT NULL,
  year INT NOT NULL,
  city VARCHAR(120) NOT NULL,
  country_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  UNIQUE KEY ux_festival_name_year (festival_name, year),
  INDEX idx_festival_year (year),
  CONSTRAINT fk_festival_country FOREIGN KEY (country_id) REFERENCES Country(country_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Film
CREATE TABLE Film (
  film_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(400) NOT NULL,
  release_year INT NOT NULL,
  language VARCHAR(100),
  country_id INT, -- references Country
  runtime_minutes INT,
  UNIQUE KEY ux_film_title_year (title, release_year),
  INDEX idx_film_title (title),
  CONSTRAINT fk_film_country FOREIGN KEY (country_id) REFERENCES Country(country_id)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Person
CREATE TABLE Person (
  person_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(300) NOT NULL,
  primary_role VARCHAR(60) NOT NULL, -- e.g., Director, Actor, Cinematographer, Composer, Producer
  nationality_id INT,                -- FK to Country
  UNIQUE KEY ux_person_name_role (name, primary_role),
  INDEX idx_person_name (name),
  CONSTRAINT fk_person_nationality FOREIGN KEY (nationality_id) REFERENCES Country(country_id)
    ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Film_Person (many-to-many)
CREATE TABLE Film_Person (
  film_person_id INT AUTO_INCREMENT PRIMARY KEY,
  film_id INT NOT NULL,
  person_id INT NOT NULL,
  role_in_film VARCHAR(100) NOT NULL, -- e.g., 'Director', 'Actor', 'Cinematographer', 'Composer'
  credit_order TINYINT,
  CONSTRAINT fk_fp_film FOREIGN KEY (film_id) REFERENCES Film(film_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_fp_person FOREIGN KEY (person_id) REFERENCES Person(person_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  UNIQUE KEY ux_fp_film_person_role (film_id, person_id, role_in_film),
  INDEX idx_fp_film (film_id),
  INDEX idx_fp_person (person_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Genre (new)
CREATE TABLE Genre (
  genre_id INT AUTO_INCREMENT PRIMARY KEY,
  genre_name VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Film_Genre (many-to-many)
CREATE TABLE Film_Genre (
  film_id INT NOT NULL,
  genre_id INT NOT NULL,
  PRIMARY KEY (film_id, genre_id),
  CONSTRAINT fk_fg_film FOREIGN KEY (film_id) REFERENCES Film(film_id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_fg_genre FOREIGN KEY (genre_id) REFERENCES Genre(genre_id) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Award (belongs to festival edition)
CREATE TABLE Award (
  award_id INT AUTO_INCREMENT PRIMARY KEY,
  award_name VARCHAR(300) NOT NULL,
  year INT NOT NULL,
  category VARCHAR(300),
  festival_id INT NOT NULL,
  UNIQUE KEY ux_award_festival (award_name, festival_id),
  INDEX idx_award_festival (festival_id),
  CONSTRAINT fk_award_festival FOREIGN KEY (festival_id) REFERENCES Festival(festival_id)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Nomination (for film + award)
CREATE TABLE Nomination (
  nomination_id INT AUTO_INCREMENT PRIMARY KEY,
  nomination_date DATE NOT NULL,
  result ENUM('Winner','Nominated','Shortlisted','Honorable Mention','Runner-up') NOT NULL DEFAULT 'Nominated',
  film_id INT NOT NULL,
  award_id INT NOT NULL,
  notes VARCHAR(500),
  CONSTRAINT fk_nom_film FOREIGN KEY (film_id) REFERENCES Film(film_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_nom_award FOREIGN KEY (award_id) REFERENCES Award(award_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX idx_nom_film (film_id),
  INDEX idx_nom_award (award_id),
  UNIQUE KEY ux_nom_unique_award_film_date (award_id, film_id, nomination_date)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Nomination_Person (many-to-many)
CREATE TABLE Nomination_Person (
  nomination_person_id INT AUTO_INCREMENT PRIMARY KEY,
  nomination_id INT NOT NULL,
  person_id INT NOT NULL,
  role_in_nomination VARCHAR(100),
  CONSTRAINT fk_np_nomination FOREIGN KEY (nomination_id) REFERENCES Nomination(nomination_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_np_person FOREIGN KEY (person_id) REFERENCES Person(person_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  UNIQUE KEY ux_np_nom_person (nomination_id, person_id),
  INDEX idx_np_nom (nomination_id),
  INDEX idx_np_person (person_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS=1;

