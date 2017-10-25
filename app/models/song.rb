class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genre
  has_many :genre, through: :song_genre
end