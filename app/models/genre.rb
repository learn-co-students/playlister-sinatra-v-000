class Genre  < ActiveRecord::Base
  validates :name, presence: true
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
