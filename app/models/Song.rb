class Song < ActiveRecord::Base
  belongs_to :artists
  belongs_to :genres
  has_many :song_genres
  has_many :genres, through: :song_genres
end