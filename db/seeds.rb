# Add seed data here. Seed your database with `rake db:seed`
beyonce = Artist.create(name: "Beyonce")
Artist.create(name: "Sam Hunt")
Artist.create(name: "Jayz")
Song.create(name: "In a Small Town")
Song.create(name: "99 problems")
halo = Song.create(name: "Halo")
beyonce.songs << halo
beyonce.save
Genre.create(name: "Hip Hop")
Genre.create(name: "Rock")
Genre.create(name: "Country")