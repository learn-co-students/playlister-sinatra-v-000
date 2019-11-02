class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genre
end

#├── app
#│   ├── controllers
#│   │   ├── application_controller.rb
#│   │   ├── artists_controller.rb
#│   │   ├── genres_controller.rb
#│   │   └── songs_controller.rb
#│   ├── models
#│   │   ├── artist.rb
#│   │   ├── concerns
#│   │   │   └── slugifiable.rb
#│   │   ├── genre.rb
#│   │   ├── song.rb
#│   │   └── song_genre.rb
#│   └── views
###│       ├── artists
#│       │   ├── index.erb
#│       │   └── show.erb
#│       ├── genres
#│       │   ├── index.erb
##│       │   └── show.erb
#│       ├── index.erb
#│       ├── layout.erb
#│       └── songs
#│           ├── edit.erb
#│           ├── index.erb
#│           ├── new.erb
#│           └── show.erb
