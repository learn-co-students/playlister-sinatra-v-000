# Add seed data here. Seed your database with `rake db:seed`


one_day = Song.create(name: "One Day")
one_day.artist = Artist.find_or_create_by(name: "Matisyahu")
one_day.genres << Genre.create(name: "Pop")
one_day.save

biladaich = Song.create(name: "Biladaich")
biladaich.artist = Artist.find_or_create_by(name: "Eyal Golan")
biladaich.genres << Genre.create(name: "Israeli")
biladaich.save