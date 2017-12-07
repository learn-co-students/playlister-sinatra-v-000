# Add seed data here. Seed your database with `rake db:seed`
foo = Artist.create(name: "Foo Fighters")
everlong = Song.create(name: "Everlong")
monkey = Song.create(name: "Monkey Wrench")
everlong.artist = foo
monkey.artist = foo
rock = Genre.create(name: "Rock")
everlong.genres << rock
monkey.genres << rock
everlong.save
monkey.save
