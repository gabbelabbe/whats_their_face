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

    get '/group/:id' do
        @students = Student.get_students_of_group(params["id"])
        slim :'group/index'
    end
end