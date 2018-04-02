# Add seed data here. Seed your database with `rake db:seed`
hotline_bling = Song.create(name: "Hotline Bling")
drake = Artist.create(name: "Drake")
hotline_bling.artist = drake

<<<<<<< HEAD
drake = Artist.create(name: "Drake")
rap = Genre.create(name: "Rap")
hotline_bling = Song.create(name: "Hotline Bling", artist: drake)


adele = Artist.create(name: "Adele")
pop = Genre.create(name: "pop")
hello = Song.create(name: "Hello", artist: adele)
=======
rap = Genre.create(name: "Rap")
hotline_bling.genre = rap

adele = Artist.create(name: "Adele")
hello = Song.create(name: "Hello")
hello.artist = adele

pop = Genre.create(name: "pop")
hello.genre = pop
>>>>>>> 86eef82d7ed6a2e8a4418487ed128c83a0983b51
