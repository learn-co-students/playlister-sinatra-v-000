# Add seed data here. Seed your database with `rake db:seed`

require_relative '../lib/library_parser'

LibraryParser.parse

test_song = Song.create(name: "Greatest metal song ever")
test_genre = Genre.find_or_create_by(name: "Metal")
test_artist = Artist.find_or_create_by(name: "Zak")
