# Add seed data here. Seed your database with `rake db:seed`

# az = Artist.create(name: "AZ")
# rap = Genre.create(name: "Rap")
# the_format = Song.create(name: "The Format", artist_id: az, genre_id: rap)
#
# nas = Artist.create(name: "Nas")
# hiphop = Genre.create(name: "Hip-Hop")
# ny_state_of_mind = Song.create(name: "New York State of Mind", artist_id: nas, genre_id: hiphop)

LibraryParser.parse
