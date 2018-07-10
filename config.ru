require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
LibraryParser.parse
use Rack::MethodOverride
use ArtistsController
use SongsController
use GenresController
run ApplicationController
