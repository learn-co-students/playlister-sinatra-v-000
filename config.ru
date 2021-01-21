require './config/environment'

begin
  #fi_check_migration

  use Rack::MethodOverride
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
 STDERR.puts err
  exit 1
end

use SongsController
<<<<<<< HEAD
use ArtistsController 
use GenresController 
=======
use ArtistsController
use GenresController
>>>>>>> 417f5d79e15b00b9c86f6cc7b458806eebf90074
