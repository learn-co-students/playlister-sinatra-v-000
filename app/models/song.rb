class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genre, through: :song_genres
end
