require './config/environment'
require 'sinatra'



use Rack::MethodOverride

use ArtistsController
use GenresController
use SongsController
run ApplicationController
