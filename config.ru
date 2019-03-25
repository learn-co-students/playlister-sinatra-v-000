require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  run ApplicationController
  use SongsController
  use GenresController
  use ArtistsController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
