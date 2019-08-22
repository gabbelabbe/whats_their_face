require_relative 'models/db_objects.rb'
require_relative 'models/students.rb'
require_relative 'models/group.rb'
require_relative 'app'
require 'sqlite3'

students = Student.all() { {join: "group_name"} }

puts students