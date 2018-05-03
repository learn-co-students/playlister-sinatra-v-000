# Add seed data here. Seed your database with `rake db:seed`
bowie = Artist.create(name: "David Bowie")
rock = Genre.create(name: "Rock")
Song.create(name: "Janine", artist: bowie, genres: [rock])
Song.create(name: "Space Oddity", artist: bowie, genres: [rock])
