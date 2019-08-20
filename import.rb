require 'sqlite3'

db = SQLite3::Database.new 'student_img.db'

# Table for students
db.execute('DROP TABLE IF EXISTS students')
db.execute('CREATE TABLE students
            (id INTEGER PRIMARY KEY AUTOINCREMENT,
            group_id INTEGER NOT NULL,
            name VARCHAR(255) NOT NULL,
            img_dir VARCHAR(255) NOT NULL UNIQUE,
            description VARCHAR(255) NOT NULL)')

# Table for groups
db.execute('DROP TABLE IF EXISTS group_name')
db.execute('CREATE TABLE group_name
            (id INTEGER PRIMARY KEY AUTOINCREMENT,
            group_name VARCHAR(255) NOT NULL UNIQUE)')