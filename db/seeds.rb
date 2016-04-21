# Add seed data here. Seed your database with `rake db:seed`
s = Song.create(name: "THe Song$")
a = Artist.create(name: "Singer")
g = Genre.create(name: "punk")

s.artist = a
s.genres << g

s2 = Song.create(name: "Another Song")
s2.artist = a
s2.genres << g

s3 = Song.create(name: "final song")
a2 = Artist.create(name: "Another singer")
g2 = Genre.create(name: "pop")

s3.artist = a2
s3.genre = g2
s3.genres << g2