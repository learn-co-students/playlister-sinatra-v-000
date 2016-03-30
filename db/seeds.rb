# Add seed data here. Seed your database with `rake db:seed`
@aaron = Artist.create(name: "aaron")
@song = Song.create(name: "i code", artist_id: @aaron.id)
@genre = Genre.create(name: "geek rock")


@roberto = Artist.create(name: "roberto")
@song_1 = Song.create(name: "I don't code", artist_id: @roberto.id)
@genre_2 = Genre.create(name: "Rock")


@song_3 = Song.create(name: "i code a lot", artist_id: @aaron.id)

@song.genres << @genre
@song.genres << @genre_2
@song_3.genres << @genre
@song_1.genres << @genre