class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres_songs
  has_many :genres, through: :genres_songs
end