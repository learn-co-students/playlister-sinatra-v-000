class Genre < ActiveRecord::Base
  validates_presence_of :name

  has_many :songs_genres
  has_many :songs, through: :songs_genres
  has_many :artists, through: :songs


end
