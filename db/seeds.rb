# Add seed data here. Seed your database with `rake db:seed`
    @song = Song.create(name: "Dirty Paws")
    @genre = Genre.create(name: "Alt")
    @artist = Artist.create(name: "Of Monsters And Men")

    @song.song_genres.create(genre: @genre)
    @song.artist = @artist
  
    @song.save