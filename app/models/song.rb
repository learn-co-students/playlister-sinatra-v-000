class Song < ActiveRecord::Base
  has_one :artists
  has_many :song_genres
  has_many :genres
  has_many :genres, through: :song_genres
end