# Add seed data here. Seed your database with `rake db:seed`

kodiak_bear = Artist.create(name: "Kodiak Bear")
indie = Genre.create(name: "Indie")
Song.create(name: "Three Weeks", artist: kodiak_bear, genres: [indie])
Song.create(name: "Never Again", artist: kodiak_bear, genres: [indie])
