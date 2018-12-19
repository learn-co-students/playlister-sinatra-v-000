# Add seed data here. Seed your database with `rake db:seed`

genre_1 = Genre.create(name: 'pop')
genre_2 = Genre.create(name: 'rock')

song1 = Song.create(name: "hello")


song2 = Song.new(name: "sky")
song2.save
