require './config/environment'
require_relative './app/controllers/artists_controller'
require_relative './app/controllers/songs_controller'
require_relative './app/controllers/genres_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
run ApplicationController
use ArtistsController
use SongsController
use GenresController