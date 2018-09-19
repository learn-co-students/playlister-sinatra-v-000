require './config/environment'
require 'sinatra'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# require_relative 'app/controllers/artists_controller'
# require_relative 'app/controllers/genres_controller'
# require_relative 'app/controllers/songs_controller'

use Rack::MethodOverride

use ArtistsController
use GenresController
use SongsController


run ApplicationController