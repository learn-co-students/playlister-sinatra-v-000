# Add seed data here. Seed your database with `rake db:seed`

taylor = Artist.create(name: "Taylor Swift")
pop = Genre.create(name: "Pop")
Song.create(name: "Wildest Dream", artist: taylor, genre_ids: pop.id)
Song.create(name: "Shake It Off", artist: taylor, genre_ids: pop.id)
Song.create(name: "22", artist: taylor, genre_ids: pop.id)


drake = Artist.create(name: "Drake")
rap = Genre.create(name: "Rap")
Song.create(name: "Hotline Bling", artist: drake, genre_ids: rap.id)
Song.create(name: "Views from the 6", artist: drake, genre_ids: rap.id)
Song.create(name: "Nice for what", artist: drake, genre_ids: rap.id)

calvin = Artist.create(name: "Calvin Harris")
edm = Genre.create(name: "Electric Dance Music")
Song.create(name: "Slide", artist: calvin, genre_ids: edm.id)
Song.create(name: "Heat Stroke", artist: calvin, genre_ids: edm.id)
Song.create(name: "Faking It", artist: calvin, genre_ids: edm.id)