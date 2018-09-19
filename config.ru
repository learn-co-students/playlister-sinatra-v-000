require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#require_relative 'app/controllers/songs_controller'

use Rack::MethodOverride
use SongsController
use ArtistsController
use GenresController
run ApplicationController
