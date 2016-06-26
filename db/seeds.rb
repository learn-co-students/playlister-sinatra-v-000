# Add seed data here. Seed your database with `rake db:seed`

rock = Genre.create(name:"rock")
vh = Artist.create(name:"van halen")
Song.create(name:"panama", artist: vh, genres: [rock])
Song.create(name: "eruption", artist: vh, genres: [rock])


