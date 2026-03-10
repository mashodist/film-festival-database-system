# Film Festival Database System

## Overview
This project implements a relational database system designed to manage information about international film festivals. The system stores data about festivals, films, awards, people involved in films, genres, and nominations.

The database was designed using relational database principles and normalized to ensure data consistency and efficiency. It is implemented using **MySQL** and connected to a **Python application** that allows users to interact with the database through a menu-based interface.

The system demonstrates the full database development process including:
- conceptual database design
- relational schema implementation
- SQL querying
- advanced database features
- application connectivity using Python

---

## Technologies Used

- **MySQL Server 8**
- **Python 3**
- **mysql-connector-python**
- **Ubuntu Linux**

---

## Database Design

The database models the complex relationships involved in film festivals and awards.

### Main Entities

- Country
- Festival
- Film
- Person
- Genre
- Award
- Nomination

### Junction Tables (Many-to-Many Relationships)

To properly model relationships between entities, several junction tables are used:

- **Film_Person** – connects films with directors, actors, and other contributors
- **Film_Genre** – allows films to belong to multiple genres
- **Nomination_Person** – links award nominations directly to individuals

### Normalization

The database schema follows **Third Normal Form (3NF)** to ensure:

- elimination of redundant data
- proper dependency on primary keys
- improved query efficiency
- better data integrity

---

## Project Structure
film-festival-database
│
├── film_festival_menu.py
├── tables.sql
├── insertion.sql
├── queries.sql
├── advanced.sql
├── Report.pdf
└── user_guide.pdf


### File Description

| File | Description |
|-----|-------------|
| film_festival_menu.py | Python program that connects to the MySQL database and provides a menu interface |
| tables.sql | SQL script for creating the database schema and tables |
| insertion.sql | SQL script for inserting sample dataset records |
| queries.sql | SQL file containing basic SQL queries |
| advanced.sql | SQL file containing advanced SQL queries |
| Report.pdf | Full project report explaining database design and implementation |
| user_guide.pdf | Step-by-step guide for installing and running the project |

---

## Database Features

The database contains realistic data from major international film festivals including:

- **Berlin International Film Festival**
- **Venice Film Festival**

The dataset includes:

- 46 countries
- 13 festival editions
- 30 films
- 77 people involved in films
- multiple genres
- award nominations and winners

Example queries include:

- listing films released in a specific year
- finding films longer than 120 minutes
- counting films by country
- showing festival winners
- displaying films and their genres

---

## Advanced SQL Features

The project also demonstrates more advanced database functionality.

### Views

Views were created to simplify complex queries and make reporting easier.

Examples include:

- **vw_film_genres** – shows films with their associated genres
- **vw_winners_summary** – provides a summary of award winners across festivals

### Stored Procedures

Stored procedures were implemented to allow reusable database operations.

Examples include:

- **sp_add_country** – safely insert a new country into the database
- **sp_top_awarded_films** – find the most awarded films in a given year

---

## Python Application

A Python application was created to interact with the database through a menu system.

The program supports **CRUD operations**:

- Create new film records
- Read film data
- Update film information
- Delete films from the database

### Python Menu Interface

When the program runs, users see a menu similar to:
========= FILM FESTIVAL DATABASE MENU =========

1. Show films released in 2022
2. Rank leading nations by number of films
3. Show films with runtime > 120 minutes
4. Show Venice 2023 winners
5. Show top winning countries
6. Show films with genres
7. Insert new film
8. Update existing film
9. Delete film
10. Exit


This allows users to interact with the database without directly writing SQL queries.

---

## System Requirements

The project was developed using the following software:

| Component | Version |
|----------|--------|
| MySQL Server | 8.0 |
| Python | 3.12 |
| Operating System | Ubuntu Linux 22.04 |

Required Python packages:


mysql-connector-python
pandas


Install them using:


pip install mysql-connector-python pandas


---

## How to Run the Project

### 1. Start MySQL


sudo mysql


### 2. Create Database User


CREATE USER 'ff_user'@'localhost'
IDENTIFIED WITH mysql_native_password BY 'ChooseAStrongPassword123!';

GRANT ALL PRIVILEGES ON *.* TO 'ff_user'@'localhost';

FLUSH PRIVILEGES;


### 3. Create Database Tables

Run the schema file:


mysql -u ff_user -p < tables.sql


### 4. Insert Sample Data


mysql -u ff_user -p < insertion.sql


### 5. Run the Python Application


python3 film_festival_menu.py


The menu interface will appear and you can begin interacting with the database.

---

## Troubleshooting

### Access Denied Error

If Python cannot connect to MySQL:

- make sure you are using **ff_user**
- verify the password in the Python script
- ensure MySQL is running

Avoid using the **root user** for application connections.

---

## Future Improvements

Possible future enhancements include:

- implementing a role lookup table for standardized roles
- adding a user authentication system
- building a web interface using Flask or Django
- adding advanced analytics for festival statistics
- creating a graphical user interface for easier interaction

---

## Documentation

More detailed information about the project can be found in:

- **Report.pdf** – full explanation of database design, normalization, queries, and implementation
- **user_guide.pdf** – instructions for installing and running the system

---

## Author

**Mashood Syed**  
Database Systems Project


