class Genre < ActiveRecord::Base
  has_many :artists
  has_many :songs, through: :song_genre
  has_many :song_genre
end
