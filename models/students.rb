class Student < DbObject
    attr_reader :id, :name, :img_dir, :group_id, :group

    table_name :students
    columns :id
    columns :name
    columns :img_dir
    columns :group_id
    db_name 'students.db'

    def initialize(db_array)
        @id = db_array[0]
        @name = db_array[1]
        @img_dir = db_array[2]
        @group_id = db_array[3]
        @group_name = db_array[-1]
    end

    def self.get_students_of_group(group_name) #lägg till sökfunktion för gruppnamn
        result = @db.execute("SELECT * FROM students JOIN group_name WHERE students.group_id = group_name.id
            WHERE group_name.name = ?", group_name)
        p result
    end
end