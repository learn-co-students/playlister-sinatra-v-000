# Add seed data here. Seed your database with `rake db:seed`

guitar = Song.create(name: "That One with the Guitar")
Genre.create(name: "Hippity Hop", song: guitar)
Genre.create(name: "New Age Garbage", song: guitar)
Artist.create(name: "Person with a Face", song: guitar)