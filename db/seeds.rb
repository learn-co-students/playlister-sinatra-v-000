# Add seed data here. Seed your database with `rake db:seed`
@artist = Artist.create(:name => "Taylor Swift")

blank_space =  Song.create(:name => "Blank Space", :artist => @artist)

@genre = Genre.create(:name => "Pop")

blank_space.genre_ids = @genre.id
