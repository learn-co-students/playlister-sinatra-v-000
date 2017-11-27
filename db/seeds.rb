# Add seed data here. Seed your database with `rake db:seed`

artist = Artist.create(:name => "Michael Jackson")
artist.songs.create(:name => "Just beat it")