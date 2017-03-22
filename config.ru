require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

require 'sinatra'

require_relative 'app/controllers/artists_controller.rb'
require_relative 'app/controllers/songs_controller.rb'
require_relative 'app/controllers/genres_controller.rb'

use Rack::MethodOverride
use SongsController
use ArtistsController
use GenresController
run ApplicationController
