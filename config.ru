require './config/environment'
require 'rack-flash'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use ArtistsController
use GenresController
use SongsController
use Rack::MethodOverride
use Rack::Flash
run ApplicationController
