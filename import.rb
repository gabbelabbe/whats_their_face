require 'sqlite3'

db = SQLite3::Database.new 'students.db'

# Table for students
db.execute('DROP TABLE IF EXISTS students')
db.execute('CREATE TABLE students
            (id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(255) NOT NULL,
            img_dir VARCHAR(255) NOT NULL,
            description VARCHAR(255),
            group_id INTEGER NOT NULL)')

# Table for groups
db.execute('DROP TABLE IF EXISTS group_name')
db.execute('CREATE TABLE group_name
            (id INTEGER PRIMARY KEY AUTOINCREMENT,
            name VARCHAR(255) NOT NULL UNIQUE)')


files = Dir.glob("public/img/*.{jpg}")
image_dir = files.dup
puts image_dir
#file_names = Dir.entries("public/img")
#puts file_names
files.each do |x|
    x.slice!("public/img/")
    x.slice!(".jpg") 
end

groups = []
names = []
files.each do |x|
    arr = x.split(" ")
    groups << arr[0]
    names << arr[1] + " " + arr[2]    
end
puts image_dir
#puts group
#puts names

# TODO: Add stuff into database
unique_groups = groups.uniq
for group in unique_groups
    db.execute("INSERT INTO group_name(name) VALUES(?)", group)
end

i = 0
while i < files.length
    group_id = unique_groups.index(groups[i])
    db.execute("INSERT INTO students(group_id, name, img_dir) VALUES(?,?,?)", group_id, names[i], "public/img/" + files[i] + ".jpg")
    i += 1
end