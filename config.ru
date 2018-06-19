require './config/environment'
require 'rack/flash'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

# use Rack::MethodOverride

# use Rack::Flash, :accessorize => [:message]
run ApplicationController
use ArtistController
use GenreController
use SongController
