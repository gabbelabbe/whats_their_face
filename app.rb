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
        @students = Student.all() { {join: 'group_name'} }
        @students.shuffle

        @all_names = []
        4.times do
            @all_names << @students[rand(@students.size)]
        end

        uniq_names = false
        while uniq_names != true
            @all_names = @all_names.uniq
            if @all_names.size == 4
                uniq_names = true
            else
                while @all_names.size < 4
                    @all_names << @students[rand(@students.size)]
                end
            end
        end

        session[:right_name] = @all_names[0]
        @all_names = @all_names.shuffle

        slim :'game/index'
    end

    post '/game' do
        error = {}
        success = {}
        
        guess = params["guess"]

        if guess == session[:right_name].name
            success[:correct] = "Det va rätt gissning!"
        else
            error[:wrong] = "Det där va fel person! Det var #{session[:right_name].name.split(/ |\_|\-/).map(&:capitalize).join(" ")} men du gissade #{guess.split(/ |\_|\-/).map(&:capitalize).join(" ")}."
            error[:img] = "#{session[:right_name].img_dir}"
        end
        
        if error.any?
            flash[:error] = error
        elsif success.any?
            flash[:success] = success
        end

        redirect back
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