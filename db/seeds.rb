# Add seed data here. Seed your database with `rake db:seed`
artist1 = Artist.create(:name => "ozzy")

song1 = Song.create(:name => "99probz")

genre = Genre.create(:name => "pop")
#song2 = Song.create(:artist => "john",:name => "98th st")