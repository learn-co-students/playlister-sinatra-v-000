require './config/environment'
# require_relative 'app/controllers/aritsts_controller'
# require_relative 'app/controllers/songs_controller'
# require_relative 'app/controllers/genres_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#require_relative 'app/controllers/'

use Rack::MethodOverride
use ArtistsController
use SongsController 
use GenresController 
run ApplicationController