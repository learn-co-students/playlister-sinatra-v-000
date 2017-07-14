require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
use ArtistsController
run ApplicationController
use GenresController
use SongsController

use Rack::MethodOverride
