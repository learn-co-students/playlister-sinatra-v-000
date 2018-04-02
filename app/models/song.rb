class Song < ActiveRecord::Base
  belongs_to :artist #belongs to ONE artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end
