# Add seed data here. Seed your database with `rake db:seed`

song1 = Song.create(name: 'song 1')
song2 = Song.create(name: 'song 2')
song3 = Song.create(name: 'song 3')



artist1 = Artist.create(name:  'artist 1')
artist2 = Artist.create(name:  'artist 2')
artist3 = Artist.create(name:  'artist 3')

genre1 = Genre.create(name:  'genre 1')
genre2 = Genre.create(name:  'genre 2')
genre3 = Genre.create(name:  'genre 3')

song1.artist = artist1
song2.artist = artist2
song3.artist = artist3


song1.genres << genre1
song2.genres << genre2
song3.genres << genre3
