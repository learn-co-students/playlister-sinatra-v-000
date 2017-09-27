# Add seed data here. Seed your database with `rake db:seed`

beyonce = Artist.create(name:"Beyonce")
drake = Artist.create(name:"Drake")
rb = Genre.create(name: "R&B")
hiphop = Genre.create(name: "Hip-hop")
hotline = Song.create(name:"Hotline Bling", artist: drake)
one = Song.create(name:"1+1", artist: beyonce)
countdown = Song.create(name:"Countdown", artist: beyonce)
one.genres << hiphop
hotline.genres << hiphop
countdown.genres << rb


