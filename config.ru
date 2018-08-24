require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end

use Rack::MethodOverride
<<<<<<< HEAD

=======
>>>>>>> updated solution, rebase from master
use GenresController
use ArtistsController
use SongsController
run ApplicationController
