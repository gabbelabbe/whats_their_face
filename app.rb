require 'byebug'
require 'bcrypt'
require 'rack-flash'
require_relative 'models/db_objects'

class App < Sinatra::Base
    enable :sessions
    use Rack::Flash

    get '/' do
        @groups = Group.all()
        
        slim :index
    end

    get '/group/:name' do
        @groups = Group.all()
        
        id = nil
        for group in @groups
            if group.name == params["name"]
                id = group.id
                break
            end
        end

        @students = Student.get_students_of_group(id)
        slim :'group/index'
    end

    get '/game' do
        slim :game
    end

    get '/leogame' do
        students = Student.all() { {join: "group_name"} }
        # TODO: Kan välja samma person två gånger!!!
        @cstudent = students.sample
        @fstudent1 = students.sample
        @fstudent2 = students.sample
        @fstudent3 = students.sample
        @shuffles = [@cstudent.name, @fstudent1.name, @fstudent2.name, @fstudent3.name]
        @shuffles = @shuffles.shuffle
        #p shuffles.shuffle 
        #p cstudent.name
        #p cstudent.img_dir
        #p cstudent.img_dir 
        #p shuffles
        #@alternativsiffra = gets.chomp.to_i
        #@shuffles[alternativsiffra]
        #p shuffles[alternativsiffra]

        slim :leogame
    end

    get '/legame:id' do
        if @cstudent.name ==  @shuffles[alternativsiffra]
            p "correct"
        else    
            p "fel"
        end

    end
end