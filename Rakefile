ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end

task :migrations do
  puts "migrating test and development databases..."
  system("rake db:migrate && rake db:migrate SINATRA_ENV=test")
end

task :drop do
  puts "droping test and development databases, removing schema..."
  system("rm db/test.sqlite && rm db/development.sqlite && rm db/schema.rb")
end

task :t do
  puts "running rspec --f-f"
  system("rspec --f-f")
end
