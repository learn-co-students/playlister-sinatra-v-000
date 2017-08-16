require './config/environment'
#added the require_relative
#require_relative 'app/controllers/artists_controller'
#require_relative 'app/controllers/genres_controller'
#require_relative 'app/controllers/songs_controller'


if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#added use to Rack line
use Rack::MethodOverride
use SongsController
use GenresController
use ArtistsController
run ApplicationController
