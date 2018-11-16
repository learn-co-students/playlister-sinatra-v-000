require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

enable :sessions

use GenresController
use ArtistsController
use SongsController
# use Rack::Flash
use Rack::MethodOverride
run ApplicationController
