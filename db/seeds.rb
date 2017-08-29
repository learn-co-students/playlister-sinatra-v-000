# Add seed data here. Seed your database with `rake db:seed`
@genre = Genre.create(name: "rock")
@artist = Artist.create(name: "death cab 4 qt")
@song = Song.create(name: "soul meets body", artist: @artist)
@song.genres << @genre
