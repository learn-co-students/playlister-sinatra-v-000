ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'rack-flash'
# require 'sinatra/flash'

Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
# require_relative '../app/models/concerns/slugifiable'

require_all 'app'
require_all 'lib'
# require 'sinatra/base'
# require_relative '../app/models/concerns/slugify'
