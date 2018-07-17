# Add seed data here. Seed your database with `rake db:seed`
song = Song.create(name: "Billie Jean")
genre_1 = Genre.create(name: "pop")
genre_2 = Genre.create(name: "dance")
artist = Artist.create(name: "Michael Jackson")
