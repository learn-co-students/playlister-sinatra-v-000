# Add seed data here. Seed your database with `rake db:seed`
coldplay = Artist.create(name: "Coldplay")
poprock = Genre.create(name: "pop rock")

dontpanic = Song.create(name: "Don't Panic", artist_id: coldplay.id)
dontpanic.genres << poprock

strawberryswing = Song.create(name: "Strawberry Swing", artist_id: coldplay.id)
strawberryswing.genres << poprock

beyonce = Artist.create(name: "Beyonce")
randb = Genre.create(name: "R&B")
freedom = Song.create(name: "Freedom", artist_id: beyonce.id)
freedom.genres << randb

phoenix = Artist.create(name: "Phoenix")
indie = Genre.create(name: "indie")
lisztomania = Song.create(name: "Lisztomania", artist_id: phoenix.id)
lisztomania.genres << indie

josegonzales = Artist.create(name: "Jose Gonzales")
openbook = Song.create(name: "Open Book", artist_id: josegonzales.id)
openbook.genres << indie