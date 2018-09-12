# Add seed data here. Seed your database with `rake db:seed`

#[0,1,2]
Artist.create(name: "Alabama Shakes")
Artist.create(name: "Herbie Hancock")
Artist.create(name: "The Goo Goo Dolls")

#[0,1,2]
Song.create(name: "Iris")
Song.create(name: "Slide")
Song.create(name: "Black Baloon")

#[3,4,5]
Song.create(name: "Sound & Color")
Song.create(name: "Don't Wanna Fight")
Song.create(name: "Dunes")

#[6,7,8]
Song.create(name: "Watermelon Man")
Song.create(name: "Maiden Voyage")
Song.create(name: "Cataloupe Island")

#[0,1,2]
Genre.create(name: "Pop")
Genre.create(name: "Rock")
Genre.create(name: "Jazz")