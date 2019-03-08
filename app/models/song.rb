class Song < ActiveRecord::Base[5.1]
  belongs_to :artist
  has_many :genres, through :song_genre
end