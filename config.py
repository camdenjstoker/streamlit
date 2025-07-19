# Path to the SQLite database file
DB_PATH = "database.sqlite"

# Table name to interact with
TABLE_NAME = "player"

# Columns to manage (excluding ID)
COLUMNS = {
    "username": "TEXT",
    "join_date": "TEXT", # SQLite uses TEXT for dates and datetimes
    "email": "TEXT",
    "last_login": "TEXT", # SQLite uses TEXT for dates and datetimes
    "f_name": "TEXT",
    "l_name": "TEXT"
}