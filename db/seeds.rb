# Add seed data here. Seed your database with `rake db:seed`
@artist1 = Artist.create(:name => "Eban")
big_dance = Song.create(:name => "Big Dance", :artist => @artist1)
alt = Genre.create(:name => "alt")
big_dance.genre_ids = alt.id

@artist2 = Artist.create(:name => "Jeff")
suck_balls = Song.create(:name => "Suck Balls", :artist => @artist2)
gay = Genre.create(:name => "gay")
suck_balls.genre_ids = gay.id
