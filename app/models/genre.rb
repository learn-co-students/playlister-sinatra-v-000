class Genre < ActiveRecord::Base
  has_many :artistsm through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres
end
