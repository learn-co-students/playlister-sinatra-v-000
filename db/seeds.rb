# Add seed data here. Seed your database with `rake db:seed`

beyonce = Artist.create(name: "Beyonce")
countdown = beyonce.songs.create(name: "Countdown")
countdown.genres.create(name: "pop")
