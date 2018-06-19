# Add seed data here. Seed your database with `rake db:seed`
genre = Genre.create(:name => "Genre Name")
artist = Artist.create(:name => "Artist Name")
song = Song.create(:name => "Song Name")

song.artist = artist
song.genres << genre
song.save
