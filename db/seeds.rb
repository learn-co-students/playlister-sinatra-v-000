# Add seed data here. Seed your database with `rake db:seed`
odesza = Artist.create(name: "Ozesza")
Song.create(name: "It's only", artist: odesza)
Song.create(name: "Say My Name", artist: odesza)
