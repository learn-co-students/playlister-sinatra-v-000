require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

<<<<<<< HEAD
use ArtistsController
use SongsController
use GenresController
=======
use GenresController
use ArtistsController
use SongsController

>>>>>>> 1f9fad4566e7bea66933d1080285aea037651e86
run ApplicationController
