require './config/environment'

use Rack::MethodOverride

begin
  fi_check_migration

rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end

use ArtistsController
use GenresController
use SongsController
run ApplicationController
