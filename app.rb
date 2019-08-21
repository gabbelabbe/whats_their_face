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
end