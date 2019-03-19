require './config/environment'



use Rack::MethodOverride
use ArtistsController
use SongsController
use GenresController
run ApplicationController