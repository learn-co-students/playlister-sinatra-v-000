Playlister App 
- dynamic web app built in Sinatra
- library of songs with the following associations - 
  -- Artist --- multiple songs and 
            --- multiple genres

  -- Genre  --- multiple artists and 
            --- multiple songs

  -- Song   --- belong to ONE Artist and 
            --- multiple genres

Steps
  - Build out file structure as follows:
    ├── app
    │   ├── controllers
    │   │   ├── application_controller.rb
    │   │   ├── artists_controller.rb
    │   │   ├── genres_controller.rb
    │   │   └── songs_controller.rb
    │   ├── models
    │   │   ├── artist.rb
    │   │   ├── concerns
    │   │   │   └── slugifiable.rb
    │   │   ├── genre.rb
    │   │   ├── song.rb
    │   │   └── song_genre.rb
    │   └── views
    │       ├── artists
    │       │   ├── index.erb
    │       │   └── show.erb
    │       ├── genres
    │       │   ├── index.erb
    │       │   └── show.erb
    │       ├── index.erb
    │       ├── layout.erb
    │       └── songs
    │           ├── edit.erb
    │           ├── index.erb
    │           ├── new.erb
    │           └── show.erb
     
  - SongGenre class required to implement relationship with songs and genres, a song can have many genres and a genre can have many songs 