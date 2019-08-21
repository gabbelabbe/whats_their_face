class Group < DbObject
    attr_reader :id, :name

    table_name :group_name
    columns :id
    columns :name
    db_name 'students_test.db'
    
    def initialize(db_array)
        @id = db_array[0]
        @name = db_array[1]
    end
end


# Group.all() -> Alla grupp objekt
# minGrupp.id -> gruppens id
# minGrupp.namn -> namnet på gruppen

# Students.all() -> alla elever
# Students.get_group("3b") -> alla elever i gruppen 3b
# minStudent.Whaterverafc -> whatever