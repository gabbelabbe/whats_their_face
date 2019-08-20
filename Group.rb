require 'sqlite3'
class Group
 #   attr_reader :id, :group_name
    
    def initialize(id, group_name)
        self.id = id
        self.group_name = group_name
    end

    def self.all()
        db = SQLite3::Database.new 'student_img.db'      
    end

    def self.get_students_of_group(group_name)

    end


end


Group.all() -> Alla grupp objekt
minGrupp.id -> gruppens id
minGrupp.namn -> namnet på gruppen

#Students.all() -> alla elever
Students.get_group("3b") -> alla elever i gruppen 3b
minStudent.Whaterverafc -> whatever
