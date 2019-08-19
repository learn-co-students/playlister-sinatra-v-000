require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride
  use ArtistsController # Is there a way to refactor this with an iterator? I think there is, involving class names.
  use GenresController
  use SongsController
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
