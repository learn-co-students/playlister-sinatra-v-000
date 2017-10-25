class Genre < ActiveRecord::Base
  has_many :songs_genre
  has_many :songs, through: :song_genre
end