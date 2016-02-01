require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use SongController
use ArtistController
use GenreController
use SongController
run ApplicationController
require "rails_erd/diagram/graphviz"

RailsERD::Diagram::Graphviz.create
