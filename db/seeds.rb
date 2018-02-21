# Add seed data here. Seed your database with `rake db:seed`
Song.destroy_all
Artist.destroy_all
Genre.destroy_all
david = Artist.create(name: "David")
country = Genre.create(name: "Country")
rap = Genre.create(name: "Rap")
Song.create(name: "test_song_1", artist: david, genres: [country, rap])
Song.create(name: "david_testSong", artist: david, genres: [country, rap])
Song.create(name: "est_song_2", artist: Artist.create(name: "mark"), genres: [country, rap])
Song.create(name: "test_song_test", artist: Artist.create(name: "lucia"), genres: [country, rap])
