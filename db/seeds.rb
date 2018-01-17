# Add seed data here. Seed your database with `rake db:seed`
molly = Artist.create(name: "Molly")
jump_around = Song.create(name: "Jump Around")
genre = Genre.create(name: "techno")
molly.songs << jump_around
jump_around.genres << genre
eric = Artist.create(name: "Eric")
harper_rocks = Song.create(name: "Harper")
genre2 = Genre.create(name: "rock")
eric.songs << harper_rocks
harper_rocks.genres << genre2
