require './config/environment'
require './app/controllers/application_controller.rb'
require './app/controllers/artists_controller.rb'
require './app/controllers/genres_controller.rb'
require './app/controllers/songs_controller.rb'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
run ApplicationController
use ArtistsController
use GenresController
use SongsController
