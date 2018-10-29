# Add seed data here. Seed your database with `rake db:seed`

@song = Song.create(name: 'Blank Space')
@genre = Genre.create(name: 'Pop')
@artist = Artist.create(name: 'Taylor Swift')

@song.song_genres.create(genre: @genre)
@song.artist = @artist

@song.save
