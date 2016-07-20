require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use SongsControler
use ArtistsControler
use GenresControler
use Rack::MethodOverride
run ApplicationController
