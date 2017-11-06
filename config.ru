require './config/environment'
require "rack/flash"

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use Rack::Flash

use SongsController
use ArtistsController
use GenresController
run ApplicationController
