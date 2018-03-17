require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

require 'sinatra'
require_relative
'app/controllers/artist_controller'
require_relative
'app/controllers/genres_controller'
require_relative
'app/controllers/songs_controller'

use ArtistsController
use GenresController
user SongsController
run ApplicationController
