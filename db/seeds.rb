# Add seed data here. Seed your database with `rake db:seed`

jay-z = Artist.create(name:"Jay-Z")
drake = Artist.create(name:"Drake")
rb = Genre.create(name: "R&B")
hiphop = Genre.create(name: "Hip-hop")
otis = Song.create(name:"Otis", artist: jay-z)
headlines = Song.create(name:"headlines", artist: drake)
gods plan = Song.create(name:"God's Plan", artist: drake)
gods plan.genres << hiphop
headlines.genres << hiphop
otis.genres << rb
