Artists
has_many songs
has_many genres

Genres
has_many artists
has many songs, through song_genres

:name
:songs (through song genres)

Songs
belongs_to artists
has many genres, through song_genres

:name
:artist
:genre (through song genres)

Song Genres
song_id
genre_id
