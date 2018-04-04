class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genre
end
