require 'sqlite3'
require_relative 'models/db_objects.rb'
require_relative 'models/students.rb'
require_relative 'models/group.rb'

students = Student.all() { {join: "group_name"} }

p students