ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# desc 'List defined routes'
# task 'routes' do

#   App::routes.each_pair do |method, list|
#     puts ":: #{method} ::"
#     routes = []
#     list.each do |item|
#       source = item[0].source
#       item[1].each do |s|
#         source.sub!(/\(.+?\)/, ':'+s)   
#       end
#       routes << source[1...-1]
#     end
#     puts routes.sort.join("\n")
#     puts "\n"
#   end

# end

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end