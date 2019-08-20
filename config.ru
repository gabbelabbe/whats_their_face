#used by rackup

#Use bundler to select gems
require 'bundler'

# load all gems in Gemfile
Bundler.require

require_relative 'models/db_objects.rb'
require_relative 'models/students.rb'
require_relative 'models/group.rb'
require_relative 'app'

run App