class Song < ActiveRecord::Base
  belongs_to :Artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
