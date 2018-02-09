# Add seed data here. Seed your database with `rake db:seed`
  Artist.delete_all
  Genre.delete_all
  Song.delete_all
  SongGenre.delete_all

alabama = Artist.create( :name=> "Alabama" )
acdc = Artist.create( :name=> "AC/DC" )
allison_krauss = Artist.create( :name=> "Alison Krauss" )
bob_marley = Artist.create( :name=> "Bob Marley" )

the_maker_said_take_her = Song.create( :name=> "The Maker Said Take Her", :artist_id => 1, :genre_id => 1  )
back_in_black = Song.create( :name=> "Back In Black", :artist_id => 2, :genre_id => 2 )
forget_about_it = Song.create( :name=> "Forget About It", :artist_id =>3, :genre_id => 3 )
i_shot_the_sheriff = Song.create( :name=> "I Shot The Sheriff", :artist_id => 4, :genre_id => 4 )

country = Genre.create( :name=> "Country" )
rock = Genre.create( :name=> "Rock")
folk = Genre.create( :name=> "Folk")
reggae = Genre.create( :name=> "Reggae" )

join1 = SongGenre.create( :song_id => 1, :genre_id => 1 )
join2 = SongGenre.create( :song_id => 2, :genre_id => 2 )
join3 = SongGenre.create( :song_id => 3, :genre_id => 3 )
join4 = SongGenre.create( :song_id => 4, :genre_id => 4 )

# alabama = Artist.create( :name=> "Alabama", :song_id => 1 )
# acdc = Artist.create( :name=> "AC/DC", :song_id => 2 )
# allison_krauss = Artist.create( :name=> "Alison Krauss", :song_id => 3 )
# bob_marley = Artist.create( :name=> "Bob Marley", :song_id => 4 )
#
# the_maker_said_take_her = Song.create( :name=> "The Maker Said Take Her", :artist_id => 1, :genre_id => 1 )
# back_in_black = Song.create( :name=> "Back In Black", :artist_id => 2, :genre_id => 2)
# forget_about_it = Song.create( :name=> "Forget About It", :artist_id =>3, :genre_id => 3 )
# i_shot_the_sheriff = Song.create( :name=> "I Shot The Sheriff", :artist_id => 4, :genre_id => 4 )
#
# country = Genre.create( :name=> "Country", :artist_id => 1, :song_id => 1 )
# rock = Genre.create( :name=> "Rock", :artist_id => 2, :song_id => 2)
# folk = Genre.create( :name=> "Folk", :artist_id =>3, :song_id => 3 )
# reggae = Genre.create( :name=> "Reggae", :artist_id => 4, :song_id => 4 )
#
# join1 = SongGenre.create( :song_id => 1, :genre_id => 1 )
# join2 = SongGenre.create( :song_id => 2, :genre_id => 2 )
# join3 = SongGenre.create( :song_id => 3, :genre_id => 3 )
# join4 = SongGenre.create( :song_id => 4, :genre_id => 4 )
