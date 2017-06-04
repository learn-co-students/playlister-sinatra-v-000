require './config/environment'
require 'rack-flash'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
use Rack::MethodOverride
use Rack::Session::Cookie
use Rack::Flash

use GenresController
use ArtistsController
use SongsController
run ApplicationController
