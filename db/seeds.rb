# Add seed data here. Seed your database with `rake db:seed`
a_g = Genre.create(name: "Alternative")
e_g = Genre.create(name: "Electronic")
r_g = Genre.create(name: "Rock")

id = Artist.create(name: "Imagine Dragons")
cp = Artist.create(name: "Coldplay")
jm = Artist.create(name: "Jardon Maron")
af = Artist.create(name: "Arcade Fire")

Song.create(name: "X & Y", genres: [r_g], artist: cp)
Song.create(name: "White Shadows", genres: [r_g], artist: cp)
Song.create(name: "Rise Up", genres: [a_g], artist: id)
Song.create(name: "Believer", genres: [a_g], artist: id)
Song.create(name: "Wake Up", genres: [r_g], artist: af)