#python3 -m venv dbenv
#source dbenv/bin/activate



"""
-- replace strong_password_here with a real password you choose
CREATE USER 'ff_user'@'localhost' IDENTIFIED BY 'strong_password_here';
GRANT ALL PRIVILEGES ON Mashood_21978586.* TO 'ff_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
"""







import mysql.connector
from mysql.connector import Error

# ------------------------------
# DATABASE CONFIGURATION
# ------------------------------
DB_CONFIG = {
    "host": "localhost",
    "user": "ff_user",
    "password": "ChooseAStrongPassword123!",
    "database": "Mashood_21978586",
    "auth_plugin": "mysql_native_password"
}

# ------------------------------
# DB CONNECTION + QUERY WRAPPER
# ------------------------------
def get_conn():
    return mysql.connector.connect(**DB_CONFIG)

def run_query(sql, params=None, fetch=True):
    conn = get_conn()
    cur = conn.cursor()

    try:
        cur.execute(sql, params or ())
        if fetch:
            rows = cur.fetchall()
            columns = [desc[0] for desc in cur.description]
            print("\nRESULT:")
            print(columns)
            for r in rows:
                print(r)
            return rows
        else:
            conn.commit()
            return True

    except Error as e:
        print("ERROR:", e)
    finally:
        cur.close()
        conn.close()


# ------------------------------
# MENU QUERY FUNCTIONS
# ------------------------------

# Show all films (NEW OPTION)
def show_all_films():
    print("\n--- ALL FILMS IN DATABASE ---")

    sql = """
        SELECT film_id, title, release_year, runtime_minutes
        FROM Film
        ORDER BY film_id;
    """

    rows = run_query(sql)

    if rows:
        print("\nFILMS:")
        print("Film ID | Title | Year | Runtime")
        print("------------------------------------------")
        for r in rows:
            print(f"{r[0]} | {r[1]} | {r[2]} | {r[3]}")
    else:
        print("No films found.")

def query_1():
    sql = """
        SELECT film_id, title, release_year, language
        FROM Film
        WHERE release_year = 2022
        ORDER BY title;
    """
    run_query(sql)


def query_2():
    sql = """
        SELECT c.country_name, COUNT(*) AS films_count
        FROM Film f
        JOIN Country c ON f.country_id = c.country_id
        GROUP BY c.country_name
        ORDER BY films_count DESC
        LIMIT 10;
    """
    run_query(sql)


def query_3():
    sql = """
        SELECT title, release_year, runtime_minutes
        FROM Film
        WHERE runtime_minutes > 120
        ORDER BY runtime_minutes DESC;
    """
    run_query(sql)


def query_4():
    sql = """
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
    """
    run_query(sql)


def query_5():
    sql = """
        SELECT c.country_name, COUNT(DISTINCT n.nomination_id) AS awards_won
        FROM Nomination n
        JOIN Film f ON n.film_id = f.film_id
        JOIN Country c ON f.country_id = c.country_id
        WHERE n.result = 'Winner'
        GROUP BY c.country_name
        ORDER BY awards_won DESC
        LIMIT 10;
    """
    run_query(sql)


def query_6():
    sql = """
        SELECT f.film_id, f.title, f.release_year,
               IFNULL(GROUP_CONCAT(DISTINCT g.genre_name ORDER BY g.genre_name SEPARATOR ', '), 'Unknown') AS genres
        FROM Film f
        LEFT JOIN Film_Genre fg ON f.film_id = fg.film_id
        LEFT JOIN Genre g ON fg.genre_id = g.genre_id
        GROUP BY f.film_id, f.title, f.release_year
        ORDER BY f.release_year DESC, f.title;
    """
    run_query(sql)


# ------------------------------
# CRUD: INSERT, UPDATE, DELETE
# ------------------------------

def insert_film():
    print("\n--- INSERT NEW FILM ---")
    title = input("Enter film title: ")
    year = input("Enter release year: ")
    lang = input("Enter language: ")
    runtime = input("Enter runtime in minutes: ")
    country_id = input("Enter country_id (1–35): ")

    sql = """
        INSERT INTO Film (title, release_year, language, runtime_minutes, country_id)
        VALUES (%s, %s, %s, %s, %s);
    """

    run_query(sql, (title, year, lang, runtime, country_id), fetch=False)
    print("Film inserted successfully!\n")


def update_film():
    print("\n--- UPDATE FILM ---")
    film_id = input("Enter Film ID to update: ")

    print("""
    What do you want to update?
    1 — Title
    2 — Release Year
    3 — Language
    4 — Runtime
    """)

    choice = input("Choose option: ")

    if choice == "1":
        new_val = input("New title: ")
        sql = "UPDATE Film SET title = %s WHERE film_id = %s"
    elif choice == "2":
        new_val = input("New release year: ")
        sql = "UPDATE Film SET release_year = %s WHERE film_id = %s"
    elif choice == "3":
        new_val = input("New language: ")
        sql = "UPDATE Film SET language = %s WHERE film_id = %s"
    elif choice == "4":
        new_val = input("New runtime (minutes): ")
        sql = "UPDATE Film SET runtime_minutes = %s WHERE film_id = %s"
    else:
        print("Invalid option.")
        return

    run_query(sql, (new_val, film_id), fetch=False)
    print("Film updated successfully!\n")


def delete_film():
    print("\n--- DELETE FILM ---")
    show_all_films()

    film_id = input("\nEnter Film ID to delete: ")

    sql = "DELETE FROM Film WHERE film_id = %s"
    run_query(sql, (film_id,), fetch=False)

    print("Film deleted successfully!\n")


# ------------------------------
# MAIN MENU
# ------------------------------
def main_menu():
    while True:
        print("""
========= FILM FESTIVAL MENU =========
1. Show all films
2. Query 1 — Films from 2022
3. Query 2 — Top 10 countries by number of films
4. Query 3 — Films with runtime > 120 mins
5. Query 4 — Winners at Venice 2023
6. Query 5 — Top 10 countries by awards won
7. Query 6 — Films + Genres
8. Insert Film
9. Update Film
10. Delete Film
0. Exit
======================================
""")

        choice = input("Choose: ")

        if choice == "1":
            show_all_films()
        elif choice == "2":
            query_1()
        elif choice == "3":
            query_2()
        elif choice == "4":
            query_3()
        elif choice == "5":
            query_4()
        elif choice == "6":
            query_5()
        elif choice == "7":
            query_6()
        elif choice == "8":
            insert_film()
        elif choice == "9":
            update_film()
        elif choice == "10":
            delete_film()
        elif choice == "0":
            print("Goodbye!")
            break
        else:
            print("Invalid choice. Try again.")


# Run menu
main_menu()



#python3 film_festival_menu.py

