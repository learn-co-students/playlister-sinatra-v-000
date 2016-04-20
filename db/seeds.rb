# Add seed data here. Seed your database with `rake db:seed`

kanye = Artist.create(name: "Kanye")
rap = Genre.create(name: "rap")
pop = Genre.create(name: "pop")


Song.create(name: "Stronger", artist: kanye)
Song.create(name: "Flashing Lights", artist: kanye)