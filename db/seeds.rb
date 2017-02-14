# Add seed data here. Seed your database with `rake db:seed`

hello = Song.create(name: "Hello")
hello.artist = Artist.find_or_create_by(name: "Adele")
hello.genres << Genre.create(name: "Pop")
hello.save

maps = Song.create(name: "Maps")
maps.artist = Artist.find_or_create_by(name: "Yeah Yeah Yeahs")
maps.genres << Genre.create(name: "Indie")
maps.save
