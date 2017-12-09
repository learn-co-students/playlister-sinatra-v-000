# Add seed data here. Seed your database with `rake db:seed`
@artist = Artist.create(:name => "Taylor Swift")
blank_space =  Song.create(:name => "Blank Space", :artist => @artist)
pop = Genre.create(:name => "Pop")
country = Genre.create(:name => "Country")
rock = Genre.create(:name => "Rock")
