# Add seed data here. Seed your database with `rake db:seed`


taylor = Artist.create(name: "Taylor Swift")
blank_space = Song.create(name: "Blank Space", artist: taylor)
two = Song.create(name: "22", artist: taylor)
pop = Genre.create(name: "pop")


