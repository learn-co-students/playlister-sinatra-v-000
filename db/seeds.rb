# Add seed data here. Seed your database with `rake db:seed`

someone_like_you = Song.create(name: "Someone Like You")
country = Genre.create(name: "Country")
adele = Artist.create(name: "Adele")

adele.songs << someone_like_you

get_away = Song.create(name: "Get Away")
indie = Genre.create(name: "Indie")
yuck = Artist.create(name: "Yuck")

yuck.songs << get_away

cruel = Song.create(name: "Cruel")
electro = Genre.create(name: "Electro")
st_vincent = Artist.create(name: "St. Vincent")

st_vincent.songs << cruel
