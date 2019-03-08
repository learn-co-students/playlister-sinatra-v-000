class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :song_genre
end