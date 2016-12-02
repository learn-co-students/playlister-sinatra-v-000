class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genre_songs
  has_many :genres, through: :genre_songs
end
