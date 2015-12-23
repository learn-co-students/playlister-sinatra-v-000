# Add seed data here. Seed your database with `rake db:seed`

Song.delete_all
Genre.delete_all
Artist.delete_all

thriller = Song.create(:name=>'Thriller')
other_song = Song.create(:name=>'other_song')

mj = Artist.create(:name=>'Michael Jackson')
not_so_good = Artist.create(:name=>'not_so_good')

New_Age_Garbage = Genre.create(:name=>'New Age Garbage')
pop = Genre.create(:name=>'Pop')
Hippity_Hop = Genre.create(:name=>'Hippity Hop')
