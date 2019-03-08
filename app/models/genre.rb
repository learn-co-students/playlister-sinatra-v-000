class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :song_genre
end