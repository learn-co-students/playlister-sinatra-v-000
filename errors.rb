Run options: include {:focus=>true}

All examples were filtered out; ignoring {:focus=>true}

Playlister Basics
  index pages
    /songs
      responds with a 200 status code (FAILED - 1)
      displays a list of songs (FAILED - 2)
      contains links to each song's show page (FAILED - 3)
    /artists
      responds with a 200 status code (FAILED - 4)
      displays a list of artists (FAILED - 5)
      contains links to each artist's show page (FAILED - 6)
    /genres
      responds with a 200 status code (FAILED - 7)
      displays a list of genres (FAILED - 8)
      contains links to each genre's show page (FAILED - 9)
  show pages
    /songs/:slug
      responds with a 200 status code (FAILED - 10)
      displays the song's artist (FAILED - 11)
      displays the song's genres (FAILED - 12)
      contains links to the artist's show page (FAILED - 13)
      contains links to each genre's show page (FAILED - 14)
    /artists/:slug
      responds with a 200 status code (FAILED - 15)
      displays the artist's songs (FAILED - 16)
      displays the artist's genres (FAILED - 17)
      contains links to each song's show page (FAILED - 18)
      contains links to each genre's show page (FAILED - 19)
    /genres/:slug
      responds with a 200 status code (FAILED - 20)
      displays the genre's artists (FAILED - 21)
      displays the genre's songs (FAILED - 22)
      contains links to each artist's show page (FAILED - 23)
      contains links to each song's show page (FAILED - 24)

Song Forms
  /songs/new
    without an existing artist
      creates a new artist on submit (FAILED - 25)
      creates a new song on submit (FAILED - 26)
      redirects to '/songs/:slug' after creation (FAILED - 27)
    with an existing artist
      does not create a new artist (FAILED - 28)
      creates a new song and associates it with an existing artist (FAILED - 29)
      redirects to '/songs/:slug' after creation (FAILED - 30)
  /songs/:slug/edit
    changing a song's artist
      updates the song's artist (FAILED - 31)
      renders to the song show page (FAILED - 32)
    changing a song's genres
      has a checkbox element on the form (FAILED - 33)
      updates the song's genres (FAILED - 34)
      renders to the song show page (FAILED - 35)

Artist
  can be initialized (FAILED - 36)
  can have a name (FAILED - 37)
  has many songs (FAILED - 38)
  can have many genres (FAILED - 39)
  can slugify its name (FAILED - 40)
  Class methods
    given the slug can find an Artist (FAILED - 41)

Song
  can initialize a song (FAILED - 42)
  can have a name (FAILED - 43)
  can have many genres (FAILED - 44)
  has an artist (FAILED - 45)
  can slugify its name (FAILED - 46)
  Class methods
    given the slug can find a song (FAILED - 47)

Genre
  can initialize a genre (FAILED - 48)
  has a name (FAILED - 49)
  has many songs (FAILED - 50)
  has many artists (FAILED - 51)
  can slugify its name (FAILED - 52)
  Class methods
    given the slug can find a genre (FAILED - 53)

Failures:

  1) Playlister Basics index pages /songs responds with a 200 status code
     Failure/Error: @song = Song.create(name: song_name)

     NameError:
       uninitialized constant Song
     # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  2) Playlister Basics index pages /songs displays a list of songs
     Failure/Error: @song = Song.create(name: song_name)

     NameError:
       uninitialized constant Song
     # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  3) Playlister Basics index pages /songs contains links to each song's show page
     Failure/Error: @song = Song.create(name: song_name)

     NameError:
       uninitialized constant Song
     # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  4) Playlister Basics index pages /artists responds with a 200 status code
     Failure/Error: @song = Song.create(name: song_name)

     NameError:
       uninitialized constant Song
     # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  5) Playlister Basics index pages /artists displays a list of artists
     Failure/Error: @song = Song.create(name: song_name)

     NameError:
       uninitialized constant Song
     # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  6) Playlister Basics index pages /artists contains links to each artist's show page
     Failure/Error: @song = Song.create(name: song_name)

     NameError:
       uninitialized constant Song
     # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  7) Playlister Basics index pages /genres responds with a 200 status code
     Failure/Error: @song = Song.create(name: song_name)

     NameError:
       uninitialized constant Song
     # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  8) Playlister Basics index pages /genres displays a list of genres
     Failure/Error: @song = Song.create(name: song_name)

     NameError:
       uninitialized constant Song
     # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  9) Playlister Basics index pages /genres contains links to each genre's show page
     Failure/Error: @song = Song.create(name: song_name)

     NameError:
       uninitialized constant Song
     # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  10) Playlister Basics show pages /songs/:slug responds with a 200 status code
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  11) Playlister Basics show pages /songs/:slug displays the song's artist
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  12) Playlister Basics show pages /songs/:slug displays the song's genres
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  13) Playlister Basics show pages /songs/:slug contains links to the artist's show page
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  14) Playlister Basics show pages /songs/:slug contains links to each genre's show page
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  15) Playlister Basics show pages /artists/:slug responds with a 200 status code
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  16) Playlister Basics show pages /artists/:slug displays the artist's songs
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  17) Playlister Basics show pages /artists/:slug displays the artist's genres
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  18) Playlister Basics show pages /artists/:slug contains links to each song's show page
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  19) Playlister Basics show pages /artists/:slug contains links to each genre's show page
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  20) Playlister Basics show pages /genres/:slug responds with a 200 status code
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  21) Playlister Basics show pages /genres/:slug displays the genre's artists
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  22) Playlister Basics show pages /genres/:slug displays the genre's songs
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  23) Playlister Basics show pages /genres/:slug contains links to each artist's show page
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  24) Playlister Basics show pages /genres/:slug contains links to each song's show page
      Failure/Error: @song = Song.create(name: song_name)

      NameError:
        uninitialized constant Song
      # ./spec/features/04_basic_view_spec.rb:9:in `block (2 levels) in <top (required)>'

  25) Song Forms /songs/new without an existing artist creates a new artist on submit
      Failure/Error: let!(:genre_1) { Genre.create(name: genre_1_name) }

      NameError:
        uninitialized constant Genre
      # ./spec/features/05_song_form_spec.rb:8:in `block (2 levels) in <top (required)>'

  26) Song Forms /songs/new without an existing artist creates a new song on submit
      Failure/Error: let!(:genre_1) { Genre.create(name: genre_1_name) }

      NameError:
        uninitialized constant Genre
      # ./spec/features/05_song_form_spec.rb:8:in `block (2 levels) in <top (required)>'

  27) Song Forms /songs/new without an existing artist redirects to '/songs/:slug' after creation
      Failure/Error: let!(:genre_1) { Genre.create(name: genre_1_name) }

      NameError:
        uninitialized constant Genre
      # ./spec/features/05_song_form_spec.rb:8:in `block (2 levels) in <top (required)>'

  28) Song Forms /songs/new with an existing artist does not create a new artist
      Failure/Error: let!(:genre_1) { Genre.create(name: genre_1_name) }

      NameError:
        uninitialized constant Genre
      # ./spec/features/05_song_form_spec.rb:8:in `block (2 levels) in <top (required)>'

  29) Song Forms /songs/new with an existing artist creates a new song and associates it with an existing artist
      Failure/Error: let!(:genre_1) { Genre.create(name: genre_1_name) }

      NameError:
        uninitialized constant Genre
      # ./spec/features/05_song_form_spec.rb:8:in `block (2 levels) in <top (required)>'

  30) Song Forms /songs/new with an existing artist redirects to '/songs/:slug' after creation
      Failure/Error: let!(:genre_1) { Genre.create(name: genre_1_name) }

      NameError:
        uninitialized constant Genre
      # ./spec/features/05_song_form_spec.rb:8:in `block (2 levels) in <top (required)>'

  31) Song Forms /songs/:slug/edit changing a song's artist updates the song's artist
      Failure/Error: let!(:genre_1) { Genre.create(name: genre_1_name) }

      NameError:
        uninitialized constant Genre
      # ./spec/features/05_song_form_spec.rb:8:in `block (2 levels) in <top (required)>'

  32) Song Forms /songs/:slug/edit changing a song's artist renders to the song show page
      Failure/Error: let!(:genre_1) { Genre.create(name: genre_1_name) }

      NameError:
        uninitialized constant Genre
      # ./spec/features/05_song_form_spec.rb:8:in `block (2 levels) in <top (required)>'

  33) Song Forms /songs/:slug/edit changing a song's genres has a checkbox element on the form
      Failure/Error: let!(:genre_1) { Genre.create(name: genre_1_name) }

      NameError:
        uninitialized constant Genre
      # ./spec/features/05_song_form_spec.rb:8:in `block (2 levels) in <top (required)>'

  34) Song Forms /songs/:slug/edit changing a song's genres updates the song's genres
      Failure/Error: let!(:genre_1) { Genre.create(name: genre_1_name) }

      NameError:
        uninitialized constant Genre
      # ./spec/features/05_song_form_spec.rb:8:in `block (2 levels) in <top (required)>'

  35) Song Forms /songs/:slug/edit changing a song's genres renders to the song show page
      Failure/Error: let!(:genre_1) { Genre.create(name: genre_1_name) }

      NameError:
        uninitialized constant Genre
      # ./spec/features/05_song_form_spec.rb:8:in `block (2 levels) in <top (required)>'

  36) Artist can be initialized
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/01_artist_spec.rb:5:in `block (2 levels) in <top (required)>'

  37) Artist can have a name
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/01_artist_spec.rb:5:in `block (2 levels) in <top (required)>'

  38) Artist has many songs
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/01_artist_spec.rb:5:in `block (2 levels) in <top (required)>'

  39) Artist can have many genres
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/01_artist_spec.rb:5:in `block (2 levels) in <top (required)>'

  40) Artist can slugify its name
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/01_artist_spec.rb:5:in `block (2 levels) in <top (required)>'

  41) Artist Class methods given the slug can find an Artist
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/01_artist_spec.rb:5:in `block (2 levels) in <top (required)>'

  42) Song can initialize a song
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/02_song_spec.rb:5:in `block (2 levels) in <top (required)>'

  43) Song can have a name
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/02_song_spec.rb:5:in `block (2 levels) in <top (required)>'

  44) Song can have many genres
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/02_song_spec.rb:5:in `block (2 levels) in <top (required)>'

  45) Song has an artist
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/02_song_spec.rb:5:in `block (2 levels) in <top (required)>'

  46) Song can slugify its name
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/02_song_spec.rb:5:in `block (2 levels) in <top (required)>'

  47) Song Class methods given the slug can find a song
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/02_song_spec.rb:5:in `block (2 levels) in <top (required)>'

  48) Genre can initialize a genre
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/03_genre_spec.rb:5:in `block (2 levels) in <top (required)>'

  49) Genre has a name
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/03_genre_spec.rb:5:in `block (2 levels) in <top (required)>'

  50) Genre has many songs
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/03_genre_spec.rb:5:in `block (2 levels) in <top (required)>'

  51) Genre has many artists
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/03_genre_spec.rb:5:in `block (2 levels) in <top (required)>'

  52) Genre can slugify its name
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/03_genre_spec.rb:5:in `block (2 levels) in <top (required)>'

  53) Genre Class methods given the slug can find a genre
      Failure/Error: @artist = Artist.create(:name => "Taylor Swift")

      NameError:
        uninitialized constant Artist
      # ./spec/models/03_genre_spec.rb:5:in `block (2 levels) in <top (required)>'

Finished in 0.01505 seconds (files took 2.66 seconds to load)
53 examples, 53 failures

Failed examples:

rspec ./spec/features/04_basic_view_spec.rb:25 # Playlister Basics index pages /songs responds with a 200 status code
rspec ./spec/features/04_basic_view_spec.rb:29 # Playlister Basics index pages /songs displays a list of songs
rspec ./spec/features/04_basic_view_spec.rb:33 # Playlister Basics index pages /songs contains links to each song's show page
rspec ./spec/features/04_basic_view_spec.rb:43 # Playlister Basics index pages /artists responds with a 200 status code
rspec ./spec/features/04_basic_view_spec.rb:47 # Playlister Basics index pages /artists displays a list of artists
rspec ./spec/features/04_basic_view_spec.rb:51 # Playlister Basics index pages /artists contains links to each artist's show page
rspec ./spec/features/04_basic_view_spec.rb:61 # Playlister Basics index pages /genres responds with a 200 status code
rspec ./spec/features/04_basic_view_spec.rb:65 # Playlister Basics index pages /genres displays a list of genres
rspec ./spec/features/04_basic_view_spec.rb:69 # Playlister Basics index pages /genres contains links to each genre's show page
rspec ./spec/features/04_basic_view_spec.rb:81 # Playlister Basics show pages /songs/:slug responds with a 200 status code
rspec ./spec/features/04_basic_view_spec.rb:85 # Playlister Basics show pages /songs/:slug displays the song's artist
rspec ./spec/features/04_basic_view_spec.rb:89 # Playlister Basics show pages /songs/:slug displays the song's genres
rspec ./spec/features/04_basic_view_spec.rb:93 # Playlister Basics show pages /songs/:slug contains links to the artist's show page
rspec ./spec/features/04_basic_view_spec.rb:97 # Playlister Basics show pages /songs/:slug contains links to each genre's show page
rspec ./spec/features/04_basic_view_spec.rb:107 # Playlister Basics show pages /artists/:slug responds with a 200 status code
rspec ./spec/features/04_basic_view_spec.rb:111 # Playlister Basics show pages /artists/:slug displays the artist's songs
rspec ./spec/features/04_basic_view_spec.rb:115 # Playlister Basics show pages /artists/:slug displays the artist's genres
rspec ./spec/features/04_basic_view_spec.rb:119 # Playlister Basics show pages /artists/:slug contains links to each song's show page
rspec ./spec/features/04_basic_view_spec.rb:123 # Playlister Basics show pages /artists/:slug contains links to each genre's show page
rspec ./spec/features/04_basic_view_spec.rb:133 # Playlister Basics show pages /genres/:slug responds with a 200 status code
rspec ./spec/features/04_basic_view_spec.rb:137 # Playlister Basics show pages /genres/:slug displays the genre's artists
rspec ./spec/features/04_basic_view_spec.rb:141 # Playlister Basics show pages /genres/:slug displays the genre's songs
rspec ./spec/features/04_basic_view_spec.rb:145 # Playlister Basics show pages /genres/:slug contains links to each artist's show page
rspec ./spec/features/04_basic_view_spec.rb:149 # Playlister Basics show pages /genres/:slug contains links to each song's show page
rspec ./spec/features/05_song_form_spec.rb:17 # Song Forms /songs/new without an existing artist creates a new artist on submit
rspec ./spec/features/05_song_form_spec.rb:26 # Song Forms /songs/new without an existing artist creates a new song on submit
rspec ./spec/features/05_song_form_spec.rb:38 # Song Forms /songs/new without an existing artist redirects to '/songs/:slug' after creation
rspec ./spec/features/05_song_form_spec.rb:52 # Song Forms /songs/new with an existing artist does not create a new artist
rspec ./spec/features/05_song_form_spec.rb:61 # Song Forms /songs/new with an existing artist creates a new song and associates it with an existing artist
rspec ./spec/features/05_song_form_spec.rb:73 # Song Forms /songs/new with an existing artist redirects to '/songs/:slug' after creation
rspec ./spec/features/05_song_form_spec.rb:97 # Song Forms /songs/:slug/edit changing a song's artist updates the song's artist
rspec ./spec/features/05_song_form_spec.rb:106 # Song Forms /songs/:slug/edit changing a song's artist renders to the song show page
rspec ./spec/features/05_song_form_spec.rb:114 # Song Forms /songs/:slug/edit changing a song's genres has a checkbox element on the form
rspec ./spec/features/05_song_form_spec.rb:118 # Song Forms /songs/:slug/edit changing a song's genres updates the song's genres
rspec ./spec/features/05_song_form_spec.rb:129 # Song Forms /songs/:slug/edit changing a song's genres renders to the song show page
rspec ./spec/models/01_artist_spec.rb:14 # Artist can be initialized
rspec ./spec/models/01_artist_spec.rb:18 # Artist can have a name
rspec ./spec/models/01_artist_spec.rb:22 # Artist has many songs
rspec ./spec/models/01_artist_spec.rb:26 # Artist can have many genres
rspec ./spec/models/01_artist_spec.rb:30 # Artist can slugify its name
rspec ./spec/models/01_artist_spec.rb:36 # Artist Class methods given the slug can find an Artist
rspec ./spec/models/02_song_spec.rb:15 # Song can initialize a song
rspec ./spec/models/02_song_spec.rb:19 # Song can have a name
rspec ./spec/models/02_song_spec.rb:23 # Song can have many genres
rspec ./spec/models/02_song_spec.rb:27 # Song has an artist
rspec ./spec/models/02_song_spec.rb:31 # Song can slugify its name
rspec ./spec/models/02_song_spec.rb:37 # Song Class methods given the slug can find a song
rspec ./spec/models/03_genre_spec.rb:16 # Genre can initialize a genre
rspec ./spec/models/03_genre_spec.rb:20 # Genre has a name
rspec ./spec/models/03_genre_spec.rb:24 # Genre has many songs
rspec ./spec/models/03_genre_spec.rb:28 # Genre has many artists
rspec ./spec/models/03_genre_spec.rb:32 # Genre can slugify its name
rspec ./spec/models/03_genre_spec.rb:39 # Genre Class methods given the slug can find a genre

