# Add seed data here. Seed your database with `rake db:seed`

require_relative '../lib/library_parser'
require_relative '../config/environment.rb'

LibraryParser.parse
