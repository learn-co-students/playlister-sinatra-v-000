tom_petty = Artist.create(:name => "Tom Petty")
last_dance_with_mary_jane = Song.create(:name => "Last Dance with Mary Jane")
rock = Genre.create(:name => "Rock")
americana = Genre.create(:name => "Americana")
last_dance_with_mary_jane.artist = tom_petty
last_dance_with_mary_jane.genres << rock
last_dance_with_mary_jane.genres << americana
last_dance_with_mary_jane.save

avett_brothers = Artist.create(:name => "The Avett Brothers")
laundry_room = Song.create(:name => "Laundry Room")
laundry_room.artist = avett_brothers
laundry_room.genres << americana
laundry_room.save