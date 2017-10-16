require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::Flash
use Rack::MethodOverride
run ApplicationController
use ArtistController
use GenreController
use SongController