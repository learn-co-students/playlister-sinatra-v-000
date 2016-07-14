# Add seed data here. Seed your database with `rake db:seed`
benji = Artist.create(name: "Benji")
hello = Song.create(name: "Hello", artist: benji)
jip = Genre.create(name: "Jip")