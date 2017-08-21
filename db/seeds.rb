# Add seed data here. Seed your database with `rake db:seed`
# LibraryParser.parse

@song = Song.create(name: "That One With The Guitar")
@genre = Genre.create(name: "New Age Garbage")
@artist = Artist.create(name: "Person With A Face")

@song.song_genres.create(genre: @genre)
@song.artist = @artist

@song.save
