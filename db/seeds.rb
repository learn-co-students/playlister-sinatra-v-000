# Add seed data here. Seed your database with `rake db:seed`
coldplay = Artist.create(name: "Coldplay")
pop_rock = Genre.create(name: "pop rock")
Song.create(name: "Don't Panic", artist: coldplay, genre: pop_rock)
Song.create(name: "Strawberry Swing", artist: coldplay, genre: pop_rock)

beyonce = Artist.create(name: "Beyonce")
r_and_b = Genre.create(name: "R&B")
Song.create(name: "Freedom", artist: beyonce, genre: r_and_b)

phoenix = Artist.create(name: "Phoenix")
indie = Genre.create(name: "indie")
Song.create(name: "Lisztomania", artist: phoenix, genre: indie)

jose_gonzales = Artist.create(name: "Jose Gonzales")
Song.create(name: "Open Book", artist: jose_gonzales, genre: indie)
