# Add seed data here. Seed your database with `rake db:seed`

artist_name = "Person with a Face"
genre_name = "New Age Garbage"
song_name = "That One with the Guitar"

song = Song.create(name: song_name)
genre = Genre.create(name: genre_name)
artist = Artist.create(name: artist_name)

song.song_genres.create(genre: genre)
song.artist = artist

song.save

artist_name = "Andrew DiMola"
genre_name = "Video Game Music"
song_name = "FFI OST"

song = Song.create(name: song_name)
genre = Genre.create(name: genre_name)
artist = Artist.create(name: artist_name)

song.song_genres.create(genre: genre)
song.artist = artist

song.save
