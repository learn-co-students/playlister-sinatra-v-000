require './config/environment'
require 'sinatra'

require_relative 'app/controllers/application_controller'
require_relative 'app/controllers/artists_controller'
require_relative 'app/controllers/genres_controller'
require_relative 'app/controllers/songs_controller'

use ArtistsController
use GenresController
use SongsController
#use LibraryParser 
run ApplicationController

begin
  fi_check_migration

  use Rack::MethodOverride
  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
