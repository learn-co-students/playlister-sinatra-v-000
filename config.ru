require './config/environment'
require 'sinatra'

require_relative 'app/controllers/application_controller'

require_relative 'app/controllers/songs_controller'
require_relative 'app/controllers/artists_controller'
require_relative 'app/controllers/genre_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
run ApplicationController
use ArtistsController
use GenreController
use SongsController