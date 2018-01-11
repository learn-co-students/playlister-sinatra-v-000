# Add seed data here. Seed your database with `rake db:seed`

artist_name = "Person with a Face"
genre_1_name = "Hippity Hop"
genre_2_name = "New Age Garbage"
song_name = "That One with the Guitar"
genre_1 = Genre.create(name: genre_1_name)
genre_2 = Genre.create(name: genre_2_name)

@song = Song.create(name: song_name)
artist = Artist.create(name: artist_name)

@song.song_genres.create(genre: genre_1)
@song.artist = artist

@song.save
