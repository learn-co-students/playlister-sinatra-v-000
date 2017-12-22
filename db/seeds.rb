# Add seed data here. Seed your database with `rake db:seed`
s = Song.create(name: "When we were")

a = Artist.create(name: "Ade")

g = Genre.create(name: "bal")

a.songs << s

s.genres << g
