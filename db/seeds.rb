# Add seed data here. Seed your database with `rake db:seed`
artist = Artist.create(name: "Freddie Gibbs")
genre = Genre.create(name: "Rap")
song = Song.create(name: "National Anthem")
song.genres << genre
song.artist = artist
song.save
