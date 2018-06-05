# Add seed data here. Seed your database with `rake db:seed`
ed_s = Artist.create(name: "Ed Sheeran")
pop = Genre.create(name: "Pop")
song = Song.create(name: "Perfect")
sg1 = SongGenre.create(song_id: 1, genre_id: 1)
