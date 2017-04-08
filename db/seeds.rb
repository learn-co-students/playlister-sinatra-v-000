# Add seed data here. Seed your database with `rake db:seed`
new_pornographers = Artist.create(name:"The New Pornographers")
indie = Genre.create(name:"Indie")
silver_jen = Song.create(name:"Silver Jenny Dollar")
still_havent = Song.create(name:"I Still Haven't Found What I'm Looking For")
jackie = Song.create(name: "Jackie")
rock = Genre.find_by_name("Rock")
pop = Genre.find_by_name("Pop")
still_havent.genres << rock
silver_jen.genres << indie
silver_jen.genres << Genre.find_by_name("Pop")
jackie.genres << indie
jackie.genres << pop
u2 = Artist.find_by_name("U2")
u2.songs << still_havent
new_pornographers.songs << silver_jen
new_pornographers.songs << jackie
