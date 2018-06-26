# Add seed data here. Seed your database with `rake db:seed`


Artist.create(:name => "Kanye West")
Artist.create(name: "Miley Cyrus")

Song.create(name: "Famous")
Song.create(name: "Ghost Town")
Song.create(name: "Wrecking Ball")

Genre.create("rap")
Genre.create("pop")
Genre.create("hip hop")
