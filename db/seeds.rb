# Add seed data here. Seed your database with `rake db:seed`

# empty the database
Artist.delete_all
Genre.delete_all
Song.delete_all
SongGenre.delete_all

# create artists
artist_1 = Artist.create(name: 'Benny')
artist_2 = Artist.create(name: 'An Artist With A Realy Long Name')

# create genres
genre_1 = Genre.create(name: 'Pop')
genre_2 = Genre.create(name: 'Classical')
genre_3 = Genre.create(name: 'Chasidic')
genre_4 = Genre.create(name: 'A Genre With A Realy Long Name')

# create songs with artist asociations
song_1 = Song.create(name: 'One Day', artist: artist_1)
song_2 = Song.create(name: 'Bring The House Down', artist: artist_1)
song_3 = Song.create(name: 'Song 3', artist: artist_2)
song_4 = Song.create(name: 'A Song With A Long Name', artist: artist_2)
# create a song wth an unknown artist
# song_5 = Song.create(name: 'A Song With A Long Name')

# asociate songs and genres
song_1.genres << genre_1
song_1.genres << genre_3
song_3.genres << genre_1
song_3.genres << genre_2
song_3.genres << genre_4
song_4.genres << genre_2
# song_5.genres << genre_3

