# Add seed data here. Seed your database with `rake db:seed`

st_vincent = Artist.create(name: "St. Vincent")
cruel = Song.new(name: "Cruel")
cruel.artist_id = st_vincent.id
cruel.save

bbymutha = Artist.create(name: "BbyMutha")
indian_hair = Song.new(name: "Indian Hair")
indian_hair.artist_id = bbymutha.id
indian_hair.save

escape_room = Genre.create(name: "Escape Room")
indietronica = Genre.create(name: "Indietronica")
