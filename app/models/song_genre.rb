class SongGenre < ActiveRecord::Base
    attr_accessor :name
    
#confused
# song
#   has_many :genres
#   has_many :genres, through: :artists
#
# genre
#   has_many :songs
#   has_many :songs, through: :artists

  def initialize
  end 
    
  def genres
  end 
  
  def artist
  end 
  
  def slug
  end 
  
  def find_by_slug
  end 

end
