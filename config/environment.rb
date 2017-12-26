ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

configure :development do
  set :database, 'sqlite3:db/genres.db'
end


#DBRegistry[ENV["PLAYLISTER_ENV"]].connect!
#DB = ActiveRecord::Base.connection

if ENV["PLAYLISTER_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end

require_all 'app'
require_all 'lib'
