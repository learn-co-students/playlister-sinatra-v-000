require './config/environment'


use Rack::MethodOverride

use SongsController
use ArtistsController
run ApplicationController
