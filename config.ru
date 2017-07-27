require './config/environment'
require 'sinatra'
require_relative 'app/controllers/artist_controller'
require_relative 'app/controllers/song_controller'
require_relative 'app/controllers/genre_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use GenreController
use ArtistController
use SongController
use Rack::MethodOverride
run ApplicationController