require './config/environment'
require './app/models/concerns/slugifiable'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use SongsController
use GenresController
use ArtistsController
run ApplicationController