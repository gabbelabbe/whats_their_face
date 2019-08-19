require 'byebug'
require 'bcrypt'
require 'rack-flash'
require_relative 'models/users'
require_relative 'models/database_object'

class App < Sinatra::Base
    enable :sessions
    use Rack::Flash

    get '/' do
        slim :index
    end
end