# Add seed data here. Seed your database with `rake db:seed`
beyonce = Artist.create(name: "Beyonce")
mfdoom = Artist.create(name: "MF DOOM")
jayz = Artist.create(name: "Jay-Z")
outkast = Artist.create(name: "Outkast")

hey_ya = Song.create(name: "Hey Ya")
outkast.songs << hey_ya
accordion = Song.create(name: "Accordion")
mfdoom.songs << accordion

pop = Genre.create(name: "Pop")
hip_hop = Genre.create(name: "Hip Hop")
