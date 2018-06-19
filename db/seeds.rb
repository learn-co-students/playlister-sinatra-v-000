# Add seed data here. Seed your database with `rake db:seed`

song_name = "That One with the Guitar"
artist_name = "Person with a Face"
genre_name = "New Age Garbage"

@song = Song.create(name: song_name)
@genre = Genre.create(name: genre_name)
@artist = Artist.create(name: artist_name)

@song.song_genres.create(genre: @genre)
@song.artist = @artist

@song.save
