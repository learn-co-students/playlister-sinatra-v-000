require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#require 'sinatra'
#require_relative 'app/controllers/application_controller'
#require_relative 'app/controllers/artist_controller'
#require_relative 'app/controllers/genre_controller'
#require_relative 'app/controllers/song_controller'

use Rack::MethodOverride
use SongsController
use ArtistsController
use GenresController
run ApplicationController
