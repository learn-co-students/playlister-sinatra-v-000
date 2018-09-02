class Song < ActiveRecord::Base
  belongs_to :artists
  has_many :genres, through: :song_genres
  has_many :song_genres
end