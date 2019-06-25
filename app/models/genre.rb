class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  has_many :song_genres

end
