ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'sinatra/base'
# require 'rack-flash' #require them only where you need--songs_controller
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
require_all 'lib'
