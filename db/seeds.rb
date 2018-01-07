# Add seed data here. Seed your database with `rake db:seed`

song = Song.create(name: "Antibiotics Bitch")
artist = Artist.create(name: "nmlstyl")
genre = Genre.create(name: "Chip Music")
song.artist_id = artist.id
song.genre_ids = genre.id
