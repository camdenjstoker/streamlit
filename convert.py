import mysql.connector
import sqlite3

# --- MySQL Connection Details ---
mysql_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Eternalf@milies', #
    'database': 'dnd_final_db'
}

# --- SQLite Database Details ---
sqlite_db_path = 'database.sqlite'

try:
    # Connect to MySQL
    mysql_conn = mysql.connector.connect(**mysql_config)
    mysql_cursor = mysql_conn.cursor()
    print("Connected to MySQL successfully!")

    # Connect to SQLite (creates the file if it doesn't exist)
    sqlite_conn = sqlite3.connect(sqlite_db_path)
    sqlite_cursor = sqlite_conn.cursor()
    print(f"Connected to SQLite database: {sqlite_db_path}")

    # --- Example: Transferring a 'character' table ---
    # You would repeat this for each table in your database

    # 1. Fetch schema and data from MySQL table
    mysql_cursor.execute("SELECT * FROM `character`") # Replace 'character' with your actual table name
    columns = [desc[0] for desc in mysql_cursor.description]
    data = mysql_cursor.fetchall()

    # 2. Create table in SQLite
    # IMPORTANT: Adjust SQL to match your table schema and SQLite's syntax
    create_table_sql = f"""
    CREATE TABLE IF NOT EXISTS `character` (
        character_id INTEGER PRIMARY KEY AUTOINCREMENT,
        {', '.join([f'{col} TEXT' for col in columns if col != 'character_id'])}
    );
    """
    sqlite_cursor.execute(create_table_sql)
    print(f"Created table 'character' in SQLite.")

    # 3. Insert data into SQLite
    if data:
        placeholders = ', '.join(['?' for _ in columns])
        insert_sql = f"INSERT INTO `character` ({', '.join(columns)}) VALUES ({placeholders})"
        sqlite_cursor.executemany(insert_sql, data)
        sqlite_conn.commit()
        print(f"Inserted {len(data)} rows into 'character' in SQLite.")
    else:
        print("No data to insert for 'character'.")

    # --- Add more tables as needed ---
    # Repeat the fetch, create, and insert steps for other tables like 'player', 'adventure', etc.

except mysql.connector.Error as err:
    print(f"MySQL Error: {err}")
except sqlite3.Error as err:
    print(f"SQLite Error: {err}")
finally:
    if mysql_conn.is_connected():
        mysql_cursor.close()
        mysql_conn.close()
        print("MySQL connection closed.")
    if sqlite_conn:
        sqlite_cursor.close()
        sqlite_conn.close()
        print("SQLite connection closed.")