# Add seed data here. Seed your database with `rake db:seed`
gessafelstein = Artist.create(name: "Gessafelstein")
out_of_line = Song.create(name: "Out of Line", artist: gessafelstein)
hellifornia = Song.create(name: "Hellifornia", artist: gessafelstein)
edm = Genre.create(name: "EDM")
industrial = Genre.create(name: "Industrial")
out_of_line.genres << edm
out_of_line.genres << industrial
hellifornia.genres << industrial
hellifornia.genres << edm
