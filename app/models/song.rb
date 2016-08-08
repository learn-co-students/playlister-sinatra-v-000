class Song < ActiveRecord::Base

  # A Song can belong to ONE Artist and multiple genres
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres

end
