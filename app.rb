require 'byebug'
require 'bcrypt'
require 'rack-flash'
#require_relative 'models/database_object'

class App < Sinatra::Base
    enable :sessions
    use Rack::Flash

    get '/' do
        slim :index
    end

    get '/:group' do
        group_name = params['group']
        group = Group.get(group)
        
    end
end