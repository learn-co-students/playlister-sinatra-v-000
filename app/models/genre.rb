class Genre < ActiveRecord::Base
  has_many :songs_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end

# Genre.create(name: "Pop")
#   => #<Genre:0x007ff9990c94d8 id: 1, name: "Pop">
