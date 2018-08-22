ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'sinatra'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require 'rack-flash3'
require_all 'app'
require_all 'lib'
