require 'byebug'
require 'bcrypt'
require 'rack-flash'
require_relative 'models/db_objects'

class App < Sinatra::Base
    enable :sessions
    use Rack::Flash

    get '/' do
        Student.get_students_of_group("3A")
        slim :index
    end

    get '/:group' do
        group_name = params['group']
        group = Group.get(group)
        
    end
end