class Genre < ActiveRecord::Base[5.1]
  has_many :songs
  has_many :artists, through :song_genre
end