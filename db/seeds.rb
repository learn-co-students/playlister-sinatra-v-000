# Add seed data here. Seed your database with `rake db:seed`

@artist = Artist.create(:name => "Taylor Swift")
blank_space =  Song.create(:name => "Blank Space", :artist => @artist)
pop = Genre.create(:name => "Pop")
blank_space.genre_ids = pop.id


@song = Song.create(name: "That One with the Guitar")
@genre = Genre.create(name: "New Age Garbage")
@artist = Artist.create(name: "Person with a Face")

@song.song_genres.create(genre: @genre)
@song.artist = @artist

@song.save
