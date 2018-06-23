require './config/environment'
require_relative "./app/models/concerns/slugifiable.rb"

 
 if ActiveRecord::Migrator.needs_migration?
   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
 end
 
use Rack::MethodOverride
run ApplicationController 
