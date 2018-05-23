require './config/environment'
require_relative 'app/controllers/artists_controller'


if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use ArtistsController
use SongsController
use GenresController
run ApplicationController