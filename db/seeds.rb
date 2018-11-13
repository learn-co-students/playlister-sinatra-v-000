# Add seed data here. Seed your database with `rake db:seed`

artist = Artist.create(:name => "Michael Jackson")
song = Song.create(:name => "Thriller")
artist.songs << song
song_genre = SongGenre.create()
genre = Genre.create(:name => "Pop")
song.song_genres << song_genre
genre.song_genres << song_genre

song = Song.create(:name => "M-Blues")
artist.songs << song
song_genre = SongGenre.create()
genre = Genre.create(:name => "Blues")
song.song_genres << song_genre
genre.song_genres << song_genre
