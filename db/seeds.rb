# Add seed data here. Seed your database with `rake db:seed`

@rayanna = Artist.create(:name => "Rayanna")
song_uno = Song.create(:name => "Chimichangas", :artist => @rayanna)
gen_uno = Genre.create(:name => "Mexican")

Song.create(:name => "Burritos", :artist => @rayanna)
song_uno.genre_ids = gen_uno.id

@artist = Artist.create(:name => "Taylor Swift")
blank_space =  Song.create(:name => "Blank Space", :artist => @artist)
pop = Genre.create(:name => "Pop")
blank_space.genre_ids = pop.id
