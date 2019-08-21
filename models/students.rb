class Student < DbObject
    attr_reader :id, :name, :img_dir, :group_id, :group, :description

    table_name :students
    columns :id
    columns :name
    columns :img_dir
    columns :description
    columns :group_id
    db_name 'students.db'

    def initialize(db_array)
        @id = db_array[0]
        @name = db_array[1]
        @img_dir = db_array[2]
        @description = db_array[3]
        @group_id = db_array[4]
        @group = db_array[-1]
    end

    def self.get_students_of_group(id) #lägg till sökfunktion för gruppnamn
        results = @db.execute("SELECT * FROM students JOIN group_name ON students.group_id = group_name.id WHERE students.group_id = ?", id)
        return results.map { |row| self.new(row) }
    end
end