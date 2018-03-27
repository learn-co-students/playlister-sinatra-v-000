# Add seed data here. Seed your database with `rake db:seed`

@artist = Artist.create(name: "Luda McDuda")
@song = Song.create(name: "Ludalicious")
@genre = Genre.create(name: "LudaMcD Soul")
Genre.create(name: "What im talkin bout")

@song.song_genres.create(genre: @genre)
@song.artist = @artist

@song.save
