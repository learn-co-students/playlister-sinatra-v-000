class Genre < ActiveRecord::Base
  belongs_to :song
#  has_many :songs, through: :song_genres

  has_many :artists
  has_many :genres
end
