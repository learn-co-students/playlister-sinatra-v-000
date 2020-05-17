# Add seed data here. Seed your database with `rake db:seed`
artist_1 = Artist.create(:name => "Taylor Swift")
artist_2 = Artist.create(:name => "Jay Z")
artist_3 = Artist.create(:name => "Tame Impala")

song_1 = Song.create(name:"song_1", artist_id:artist_1.id) 
song_2= Song.create(name:"song_2", artist_id:artist_2.id)
song_3= Song.create(name:"song_3", artist_id:artist_3.id) 

genre_1 = Genre.create(name:"pop")
genre_2 = Genre.create(name:"rap")
genre_3 = Genre.create(name:"electronic")

SongGenre.create(song_id:song_1.id, genre_id:genre_1.id)
SongGenre.create(song_id:song_2.id, genre_id:genre_2.id)
SongGenre.create(song_id:song_3.id, genre_id:genre_3.id)





