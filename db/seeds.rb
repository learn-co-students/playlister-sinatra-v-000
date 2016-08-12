# Add seed data here. Seed your database with `rake db:seed`
@artist1 = Artist.create(:name => "Eban")
big_dance = Song.create(:name => "Big Dance", :artist => @artist1)
alt = Genre.create(:name => "alt")
big_dance.genre_ids = alt.id

@artist2 = Artist.create(:name => "Jeff")
happy_days = Song.create(:name => "Happy Days", :artist => @artist2)
pop = Genre.create(:name => "pop")
happy_days.genre_ids = pop.id
