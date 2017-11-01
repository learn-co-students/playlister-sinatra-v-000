# Add seed data here. Seed your database with `rake db:seed`

@song = Song.create(name: "Person with a Face")
@genre = Genre.create(name: "New Age Garbage")
@artist = Artist.create(name: "That One with the Guitar")

@song.song_genres.create(genre: @genre)
@song.artist = @artist

@song.save
