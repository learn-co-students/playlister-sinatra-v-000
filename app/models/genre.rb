class Genre < ActiveRecord::Base
  has_many :artists, through: :song_genres
  has_many :songs
end
