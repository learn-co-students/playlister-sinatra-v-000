class Artist < ActiveRecord::Base
  has_many :songs
  has_many :artist_genres
  has_many :genres, through: :artist_genres
  
  def slug
    binding.pry
    # Lowercase the object's name, and replace blank spaces with -
  end
end