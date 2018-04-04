# Add seed data here. Seed your database with `rake db:seed`
require './config/environment'

song_bold_as_love = Song.create(name: "Bold as Love")
artist_hendrix = Artist.create(name: "Jimi Hendrix")
genre_rock = Genre.create(name: "Rock")
genre_blues = Genre.create(name: "Blues")
genre_psychelic = Genre.create(name: "Psychelic")



binding.pry
