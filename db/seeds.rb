# Add seed data here. Seed your database with `rake db:seed`
beyonce = Artist.new(name: "Beyonce")
halo = Song.create(name: "Halo")
beyonce.songs << halo
beyonce.save