class Artist < ActiveRecord::Base
  has_many :songs
  #has_many :artist_genres
  has_many :genres #, through: :songs #through: :artist_genres
  
  def slug
    # Lowercase the object's name, and replace blank spaces with -
    name.downcase.split.join("-")
  end
end