# Add seed data here. Seed your database with `rake db:seed`
# LibraryParser.parse

pop=Genre.create(name: "Pop")
rock=Genre.create(name: "Rock")
jazz=Genre.create(name: "Jazz")
#[0,1,2]
alabama = Artist.create(name: "Alabama Shakes")
herbie = Artist.create(name: "Herbie Hancock")
the = Artist.create(name: "The Goo Goo Dolls")
 #[0,1,2]
alabama.songs.create(name: "Iris", genre_ids: [Genre.first.id])
alabama.songs.create(name: "Slide", genre_ids: [Genre.first.id])
alabama.songs.create(name: "Black Baloon", genre_ids: [Genre.first.id])
 #[3,4,5]
alabama.songs.create(name: "Sound & Color", genre_ids: [Genre.first.id])
alabama.songs.create(name: "Don't Wanna Fight", genre_ids: [Genre.first.id])
alabama.songs.create(name: "Dunes", genre_ids: [Genre.first.id])
 #[6,7,8]
alabama.songs.create(name: "Watermelon Man", genre_ids: [Genre.first.id])
alabama.songs.create(name: "Maiden Voyage", genre_ids: [Genre.first.id])
alabama.songs.create(name: "Cataloupe Island", genre_ids: [Genre.first.id])
 #[0,1,2]


# Song.first.update(genre: pop)
