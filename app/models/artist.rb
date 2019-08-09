class Artist < ActiveRecord::Base
  has_many :songs
  has_many :artist_genres
  has_many :genres, through: :artist_genres
  
  def slug
    # Should return taylor-swift if the artist's name is "Taylor Swift"
    # Replace blank spaces with -
  end
end