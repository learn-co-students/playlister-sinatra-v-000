ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'rack-flash'

Bundler.require(:default, ENV['SINATRA_ENV'])

#added this line after reading ActiveRecord Setup in Sinatra 
# configure :development do
#   set :database, 'sqlite3:db/database.db'
# end

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
require_all 'lib'

