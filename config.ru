require './config/environment'
# require 'rack-flash'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# use Rack::Session::Cookie
use Rack::MethodOverride
use SongsController
use ArtistsController
use GenresController
run ApplicationController
