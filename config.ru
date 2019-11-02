require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  run ApplicationController
  use ArtistsController
  use SongsController
  use GenresController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
