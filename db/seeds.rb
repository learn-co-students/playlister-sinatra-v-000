# Add seed data here. Seed your database with `rake db:seed`
biggie = Artist.create(name: "Biggie")
dead_wrong = Song.create(name: "Dead Wrong")
rap = Genre.create(name: "Rap")

biggie.songs << dead_wrong
dead_wrong.genres << rap
