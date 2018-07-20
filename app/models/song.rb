class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :genres
  belongs_to :artist

end
