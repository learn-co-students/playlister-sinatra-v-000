require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
require_relative 'app/controllers/songs_controller'
require_relative 'app/controllers/artists_controller'
require_relative 'app/controllers/genres_controller'

use SongsController
use ArtistsController
use GenresController

use Rack::MethodOverride
run ApplicationController