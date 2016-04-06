@artist = Artist.create(name: "Taylor Swift")
blank_space = Song.create(name: "Blank Space", artist: @artist)
pop = Genre.create(name: "Pop")
blank_space.genre_ids = pop.id