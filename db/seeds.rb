song = Song.create(name: 'Hold Her Tight')
genre = Genre.create(name: 'Electro Swing')
artist = Artist.create(name: 'The Correspondents')

song.genres << genre
song.artist = artist
song.save
