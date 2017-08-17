# Add seed data here. Seed your database with `rake db:seed`
require_relative '../config/environment'
parser = LibraryParser.new
parser.call
