Artists:
- :name
- has_many :songs, & :genres through: :songs

Songs:
- :name
- :artist_id
- :genre_id
- belongs_to :artist (and belong to many Genres) through Join Table
- has_many :SongGenre

Genre:
- :name
- :song_ids
- has_many :artists through: :songs
- has_many :SongGenre (and has many Songs) through Join Table

SongGenre:
- :song_id
- :genre_id
- belongs_to :song
- belongs_to :genre