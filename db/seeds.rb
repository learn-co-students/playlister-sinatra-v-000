# Add seed data here. Seed your database with `rake db:seed`

Artist.create(:name => "Jay-Z")
Artist.create(:name => "Kanye")
Artist.create(:name => "Robert Ellis")

Song.create(:name => "99 Problems")
Song.create(:name => "Gold Digger")
Song.create(:name => "Elephant")

Genre.create(:name => "Rap")
Genre.create(:name => "Folk")
