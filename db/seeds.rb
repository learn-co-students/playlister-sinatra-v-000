# Add seed data here. Seed your database with `rake db:seed`

drake = Artist.create(name: "Drake")
fear = drake.songs.create(name: "Fear")
fear.genres.create(name: "R&B")