# Add seed data here. Seed your database with `rake db:seed`
crazy_in_love = Song.create(name:"crazy in love")
beyonce = Artist.create(name:"beyonce")
hiphop = Genre.create(name:"hip hop")
crazy_in_love.artist = beyonce
crazy_in_love.genres << hiphop
crazy_in_love.save
