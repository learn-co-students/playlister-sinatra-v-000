# Add seed data here. Seed your database with `rake db:seed`

drake = Artist.create(name: "Drake")
rap = Genre.create(name: "Rap")
hotline_bling = Song.create(name: "Hotline Bling", artist: drake)


adele = Artist.create(name: "Adele")
pop = Genre.create(name: "pop")
hello = Song.create(name: "Hello", artist: adele)
