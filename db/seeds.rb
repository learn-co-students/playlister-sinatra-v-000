# Add seed data here. Seed your database with `rake db:seed`

Song.create(:name => "Blank Space").tap do |song|
  song.build_artist(:name => "Taylor Swift")
  song.genres.build(:name => "Pop")
  song.save
end

Genre.create(:name => "Alternative Rock")

Song.create(:name => "That One with the Guitar").tap do |song|
  song.build_artist(:name => "Person with a Face")
  song.genres.build(:name => "New Age Garbage")
  song.save
end
