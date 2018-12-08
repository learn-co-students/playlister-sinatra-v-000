ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.


task :console do
  puts "Loading your application environment..."
  reload!
  puts "Console started:"
  Pry.start
end
