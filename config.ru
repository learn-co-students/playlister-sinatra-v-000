require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

require 'sinatra'

require_relative './app/controllers/artists_controller'
require_relative './app/controllers/genres_controller'
require_relative './app/controllers/songs_controller'
require_relative './app/controllers/application_controller'

use Rack::MethodOverride

use ArtistsController
use GenresController
use SongsController

run ApplicationController
