# Add seed data here. Seed your database with `rake db:seed`


someone_like_you = Song.create(name: "Someone Like You")
 country = Genre.create(name: "country")
 adele = Artist.create(name: "Adele")
 
 get_away = Song.create(name: "Get Away")
 indie = Genre.create(name: "indie")
 yuck = Artist.create(name: "Yuck")
 
 cruel = Song.create(name: "Cruel")
 electro = Genre.create(name: "electro")
 st_vincent = Artist.create(name: "St. Vincent")


LibraryParser.new.call