# Add seed data here. Seed your database with `rake db:seed`
sohn = Artist.create(name: "SOHN")
Song.create(name: "Artifice", artist: sohn)
Song.create(name: "The Wheel", artist: sohn)
