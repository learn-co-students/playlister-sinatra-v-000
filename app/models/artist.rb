class Artist < ActiveRecord::Base
  has_many :genres, through: :song_genres
  has_many :songs
end
