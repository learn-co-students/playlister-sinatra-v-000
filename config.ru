require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride #=> this has to be on top of the others in order to use the extra methods

use GenresController
use ArtistsController
use SongsController
run ApplicationController