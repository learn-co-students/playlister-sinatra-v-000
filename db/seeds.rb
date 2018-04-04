# Add seed data here. Seed your database with `rake db:seed`
require './config/environment'

song_bold_as_love = Song.create(name: "Bold as Love")
song_freedom = Song.create(name: "Freedom")
song_voodoo_child = Song.create(name: "Voodoo Child")
song_dolly_dagger = Song.create(name: "Dolly Dagger")
song_message_to_love = Song.create(name: "Message to Love")
artist_hendrix = Artist.create(name: "Jimi Hendrix")
genre_rock = Genre.create(name: "Rock")
genre_blues = Genre.create(name: "Blues")
genre_psychelic = Genre.create(name: "Psychelic")

song_bold_as_love.artist = artist_hendrix
song_freedom.artist = artist_hendrix
song_voodoo_child.artist = artist_hendrix
song_dolly_dagger.artist = artist_hendrix
song_message_to_love.artist = artist_hendrix

song_bold_as_love.genres << genre_rock
song_bold_as_love.genres << genre_blues
song_bold_as_love.save

song_freedom.genres << genre_psychelic
song_freedom.genres << genre_blues
song_freedom.save

song_voodoo_child.genres << genre_rock
song_voodoo_child.genres << genre_psychelic
song_voodoo_child.save

song_dolly_dagger.genres << genre_blues
song_dolly_dagger.save

song_message_to_love.genres << genre_rock
song_message_to_love.genres << genre_blues
song_message_to_love.genres << genre_psychelic
song_message_to_love.save
