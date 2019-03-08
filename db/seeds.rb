# Add seed data here. Seed your database with `rake db:seed`

asap = Artist.create(name: "A$AP")
action_bronson = Artist.create(name: "Action Bronson")
adele = Artist.create(name: "Adele")
araabmuzik = Artist.create(name: "AraabMuzik")
atlas_sound = Artist.create(name: "Atlas Sound")
azealia_banks = Artist.create(name: "Azealia Banks")
battles = Artist.create(nambattlese: "Battles")
beyonce = Artist.create(name: "Beyonce")




Song.create(name: "Ricky Peso", owner: asap)
Song.create(name: "Larry Csonka", owner: action_bronson)
Song.create(name: "Rolling In the Deep", owner: adele)
Song.create(name: "Someone Like You", owner: adele)
Song.create(name: "Streetz Tonight", owner: araabmuzik)
Song.create(name: "Mona LIsa", owner: atlas_sound)
Song.create(name: "212", owner: azealia_banks)
Song.create(name: "Ice Cream", owner: battles)
Song.create(name: "1+1", owner: beyonce)
Song.create(name: "Countdown", owner: beyonce)