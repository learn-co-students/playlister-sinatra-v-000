tom_petty = Artist.create(:name => "Tom Petty")
last_dance_with_mary_jane = Song.create(:name => "Last Dance with Mary Jane")
rock = Genre.create(:name => "Rock")
last_dance_with_mary_jane.artist = tom_petty
last_dance_with_mary_jane.genres << rock
last_dance_with_mary_jane.save
