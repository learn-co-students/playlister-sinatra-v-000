require './config/environment'
require 'sinatra'


if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run &#96;rake db:migrate&#96; to resolve the issue.'
end

use Rack::MethodOverride

use ArtistsController
use GenresController
use SongsController
run ApplicationController
