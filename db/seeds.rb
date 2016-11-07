# Add seed data here. Seed your database with `rake db:seed`
Artist.create(name: "Avrohom Freid")
Song.create(name: "napolians march")
Song.create(name: "Kol dodi")
Genre.create(name: "Niggunim")
Genre.create(name: "Jewish")
Artist.create(name: "Pesach malovstovker")

parser = LibraryParser.new.call
