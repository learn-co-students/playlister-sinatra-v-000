ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'rack-flash' #added rack flash to environment
require_relative '../app/models/concerns/slugifiable.rb'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

use Rack::MethodOverride

require_all 'app'
require_all 'lib'
