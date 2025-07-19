import mysql.connector
import sqlite3

# --- MySQL Connection Details ---
mysql_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'Et3rnalf@milies', # <<-- ENSURE THIS IS YOUR CORRECT MySQL ROOT PASSWORD
    'database': 'dnd_final_db'
}

# --- SQLite Database Details ---
sqlite_db_path = 'database.sqlite' # This file will contain all converted tables

def map_mysql_to_sqlite_type(mysql_type):
    """Maps MySQL data types to SQLite data types."""
    mysql_type = mysql_type.lower()
    if 'int' in mysql_type:
        return 'INTEGER'
    elif 'varchar' in mysql_type or 'text' in mysql_type:
        return 'TEXT'
    elif 'date' in mysql_type or 'time' in mysql_type:
        return 'TEXT' # SQLite often stores dates/times as TEXT, INTEGER (unix timestamp), or REAL (julian day)
    elif 'decimal' in mysql_type or 'double' in mysql_type or 'float' in mysql_type:
        return 'REAL'
    elif 'blob' in mysql_type or 'binary' in mysql_type:
        return 'BLOB'
    else:
        return 'TEXT' # Default to TEXT for unknown types

try:
    # Connect to MySQL
    mysql_conn = mysql.connector.connect(**mysql_config)
    mysql_cursor = mysql_conn.cursor()
    print("Connected to MySQL successfully!")

    # Connect to SQLite (creates the file if it doesn't exist)
    sqlite_conn = sqlite3.connect(sqlite_db_path)
    sqlite_cursor = sqlite_conn.cursor()
    print(f"Connected to SQLite database: {sqlite_db_path}")

    # --- Get all table names from MySQL database ---
    mysql_cursor.execute("SHOW TABLES")
    # Fetch all table names, which are in the first column of each row
    tables = [row[0] for row in mysql_cursor.fetchall()]
    print(f"Found {len(tables)} tables in MySQL: {', '.join(tables)}")

    for table_name in tables:
        print(f"\n--- Processing table: '{table_name}' ---")

        # 1. Fetch schema from MySQL table
        # We use DESCRIBE to get column details: (Field, Type, Null, Key, Default, Extra)
        mysql_cursor.execute(f"DESCRIBE `{table_name}`")
        mysql_table_schema = mysql_cursor.fetchall()

        column_defs = []
        column_names = []
        primary_key_column = None

        for col_info in mysql_table_schema:
            col_name = col_info[0]
            mysql_col_type = col_info[1]
            is_nullable = col_info[2] == 'YES'
            is_key = col_info[3]
            extra_info = col_info[5] # e.g., 'auto_increment'

            sqlite_col_type = map_mysql_to_sqlite_type(mysql_col_type)
            col_definition = f"`{col_name}` {sqlite_col_type}"

            if is_key == 'PRI':
                # SQLite has specific rules for PRIMARY KEY AUTOINCREMENT
                # Only one INTEGER PRIMARY KEY can be AUTOINCREMENT.
                # If a column is a primary key and an integer, make it AUTOINCREMENT.
                if sqlite_col_type == 'INTEGER' and 'auto_increment' in extra_info.lower():
                    col_definition += " PRIMARY KEY AUTOINCREMENT"
                    primary_key_column = col_name # Store PK name to exclude from general TEXT conversion
                else:
                    col_definition += " PRIMARY KEY" # Other types of PKs
            
            if not is_nullable and 'PRI' not in is_key: # Add NOT NULL if it's not a PK and not nullable
                col_definition += " NOT NULL"

            column_defs.append(col_definition)
            column_names.append(f"`{col_name}`") # Store names with backticks for SQL query

        # Remove the last comma if there are multiple columns
        create_table_sql = f"""
        CREATE TABLE IF NOT EXISTS `{table_name}` (
            {', '.join(column_defs)}
        );
        """
        
        try:
            sqlite_cursor.execute(create_table_sql)
            print(f"Created table '{table_name}' in SQLite.")
        except sqlite3.Error as e:
            print(f"Error creating table '{table_name}' in SQLite: {e}")
            continue # Skip to next table if creation fails

        # 2. Fetch data from MySQL table
        mysql_cursor.execute(f"SELECT {', '.join(column_names)} FROM `{table_name}`")
        data = mysql_cursor.fetchall()

        # 3. Insert data into SQLite
        if data:
            placeholders = ', '.join(['?' for _ in column_names])
            insert_sql = f"INSERT INTO `{table_name}` ({', '.join(column_names)}) VALUES ({placeholders})"
            
            try:
                sqlite_cursor.executemany(insert_sql, data)
                sqlite_conn.commit()
                print(f"Inserted {len(data)} rows into '{table_name}' in SQLite.")
            except sqlite3.Error as e:
                print(f"Error inserting data into '{table_name}' in SQLite: {e}")
                sqlite_conn.rollback() # Rollback if insert fails for this table
        else:
            print(f"No data to insert for '{table_name}'.")

except mysql.connector.Error as err:
    print(f"MySQL Error: {err}")
    # Additional check if mysql_conn was not defined (e.g. if connection failed immediately)
    if 'mysql_conn' in locals() and mysql_conn.is_connected():
        mysql_conn.close()
        print("MySQL connection closed after error.")
except sqlite3.Error as err:
    print(f"SQLite Error: {err}")
    if 'sqlite_conn' in locals() and sqlite_conn:
        sqlite_conn.close()
        print("SQLite connection closed after error.")
except Exception as e:
    print(f"An unexpected error occurred: {e}")
finally:
    # Ensure connections are closed if they were successfully established
    if 'mysql_cursor' in locals() and mysql_cursor is not None:
        mysql_cursor.close()
    if 'mysql_conn' in locals() and mysql_conn is not None and mysql_conn.is_connected():
        mysql_conn.close()
        print("MySQL connection closed.")
    if 'sqlite_cursor' in locals() and sqlite_cursor is not None:
        sqlite_cursor.close()
    if 'sqlite_conn' in locals() and sqlite_conn is not None: # sqlite_conn might be None if creation failed
        sqlite_conn.close()
        print("SQLite connection closed.")