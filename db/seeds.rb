# Add seed data here. Seed your database with `rake db:seed`
artist1 = Artist.create(name: "Artist1")
#genre1 = Genre.create(name: "Genre1")
#genre2 = Genre.create(name: "genre2")
song1 = Song.create(name: "song1", artist: artist1)
#song1.genres << genre1
song2 = Song.create(name: "song1a", artist: artist1)
#song2.genres << genre1
artist2 = Artist.create(name: "Artist2")
song3 = Song.create(name: "song2", artist: artist2)
song4 = Song.create(name: "song2a", artist: artist2)
#song3.genres << genre1
#song4.genres << genre1
#song4.genres << genre2
