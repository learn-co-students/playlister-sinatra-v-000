ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require_relative '../lib/library_parser.rb'
require_relative '../app/helpers/application_helper.rb'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
require_all 'lib'