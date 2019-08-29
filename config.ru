require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride

  controllers = [ArtistsController, GenresController, SongsController]
  controllers.each {|controller| use controller} 
  # There are some better (albeit complex) ways to refactor this; the Sinatra Complex Forms Associations lesson has one.
  # use ArtistsController
  # use GenresController
  # use SongsController
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
