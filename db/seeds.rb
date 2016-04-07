# Add seed data here. Seed your database with `rake db:seed`
    @artist = Artist.create(:name => "Taylor Swift")

    @song =  Song.create(:name => "Blank Space", :artist => @artist)

    pop = Genre.create(:name => "Pop")

    @song.genre_ids = pop.id
