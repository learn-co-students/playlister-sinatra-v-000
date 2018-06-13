ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

#configure :development do
#  set :database, 'sqlite3:db/data'
#end
<<<<<<< HEAD
=======

>>>>>>> ef1a3d26040f201e4ac21e4e7134bd95971c8099

require_all 'app'
require_all 'lib'
