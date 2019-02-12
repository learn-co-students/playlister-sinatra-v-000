# Add seed data here. Seed your database with `rake db:seed`
Artist.create(:name => "First Artist")
Artist.create(:name => "Bill")
Genre.create(:name => "Rawk")
Genre.create(:name => "Jazz")
Genre.create(:name => "Rap")
Song.create(:name => "First Song", :artist_id => 1, :genre_ids => [1,2])
Song.create(:name => "2nd Song", :artist_id => 1, :genre_ids => [2,3])
Song.create(:name => "3rd Song", :artist_id => 2, :genre_ids => 1)
