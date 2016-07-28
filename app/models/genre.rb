class Genre < ActiveRecord::Base
  has_many :song, through: :song_genres
  has_many :artist, through: :song
end
