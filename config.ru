require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride #can use patch/delete

use ApplicationController
use ArtistsController
use GenresController
run SongsController
