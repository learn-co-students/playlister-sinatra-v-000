# Add seed data here. Seed your database with `rake db:seed`

s1 = Song.create(name: "summer squash")
s2 = Song.create(name: "roasting pig")
s3 = Song.create(name: "grilled oyster")






a = Artist.create(name: "Bon Jovi Punks")
b = Artist.create(name: "MLPS Bouncers Union")
c = Artist.create(name: "We Wear Black and Look Tough in the Camera but We're Senstive Boys")

g1 = Genre.create(name: "hamburger rock")
g2 = Genre.create(name: "dirty sock bop")




 s1.genres << g1
 s2.genres << g2
s3.genres << g2 