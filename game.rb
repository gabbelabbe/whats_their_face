require 'sqlite3'
require_relative 'models/db_objects.rb'
require_relative 'models/students.rb'
require_relative 'models/group.rb'

students = Student.all() { {join: "group_name"} }

#Kan välja samma person två gånger
cstudent = students.sample
fstudent1 = students.sample
fstudent2 = students.sample
fstudent3 = students.sample
shuffles = [cstudent.name, fstudent1.name, fstudent2.name, fstudent3.name]
 
shuffles = shuffles.shuffle

p shuffles.shuffle 


p cstudent.name
p cstudent.img_dir


p cstudent.img_dir 

p shuffles

alternativsiffra = gets.chomp.to_i
shuffles[alternativsiffra]
p shuffles[alternativsiffra]
if cstudent.name ==  shuffles[alternativsiffra]

    p "correct"


else    
    p "fel"
end

