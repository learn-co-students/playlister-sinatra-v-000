require './config/environment'


use Rack::MethodOverride

use GenresController
use SongsController
use ArtistsController
run ApplicationController
