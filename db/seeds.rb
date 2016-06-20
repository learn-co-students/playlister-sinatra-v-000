# Add seed data here. Seed your database with `rake db:seed`

# artist = Artist.create(name: "Jesse Pinkman Yo")
# genre = Genre.create(name: "Rap")
# genre2 = Genre.create(name: "Crap")
# Song.create(name: "What's up", artist: artist, genres: [genre])
# Song.create(name: "Yo", artist: artist, genres: [genre, genre2])
# Song.create(name: "Bitch!", artist: artist, genres: [genre])

artist_name = "Person with a Face" 
genre_1_name = "Hippity Hop" 
genre_2_name = "New Age Garbage"
song_name = "That One with the Guitar"

@song = Song.create(name: song_name)
@genre = Genre.create(name: genre_2_name)
@genre2 = Genre.create(name: genre_1_name)
@artist = Artist.create(name: artist_name)

@song.genres <<  @genre2
@song.artist = @artist
  
@song.save


