class genre < ActiveRecord::Base
  has_many :artist
  has_many :songs, through: :song_genre
end
