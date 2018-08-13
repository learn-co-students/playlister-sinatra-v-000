require './config/environment'

require_relative 'app/controllers/artists_controller.rb'
require_relative 'app/controllers/genres_controller.rb'
require_relative 'app/controllers/songs_controller.rb'

use ArtistsController
use GenresController
use SongsController

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use ArtistsController
use SongsController
use GenresController
run ApplicationController
