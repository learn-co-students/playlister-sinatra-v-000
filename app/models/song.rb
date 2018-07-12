
class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genre, through: :song_genres
end
