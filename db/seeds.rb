# Add seed data here. Seed your database with `rake db:seed`


yeezy = Artist.create(name: "Kanye West")
miley = Artist.create(name: "Miley Cyrus")


famous = Song.create(name: "Famous")
ghost_town = Song.create(name: "Ghost Town")
wrecking_ball = Song.create(name: "Wrecking Ball")



rap = Genre.create("rap")
pop = Genre.create("pop")
hip_hop = Genre.create("hip hop")
