# Add seed data here. Seed your database with `rake db:seed`

valient = Artist.create(name: "Valient Thorr")
valient.slug
valient.save

exit_strategy = Song.create(name: "Exit Strategy")
exit_strategy.artist_id = valient.id
exit_strategy.slug
exit_strategy.save

rock = Genre.create(name: "Rock")
shred = Genre.create(name: "Shred Rock")
exit_strategy.song_genres.create(genre: rock)
exit_strategy.song_genres.create(genre: shred)

exit_strategy.save
