class Student < DbObject
    attr_reader :id, :name, :img_dir, :group_id

    table_name :students
    columns :id
    columns :name
    columns :img_dir
    columns :group_id
    db_name 'student_img.db'
end