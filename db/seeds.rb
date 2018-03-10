# Add seed data here. Seed your database with `rake db:seed`

LibraryParser.parse

kendrick_lamar = Artist.create(:name => "Kendrick Lamar")
love =  Song.create(:name => "Love", :artist => kendrick_lamar)
humble =  Song.create(:name => "HUMBLE. ", :artist => kendrick_lamar)
rap = Genre.create(:name => "Rap")
