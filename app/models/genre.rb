class Genre < ActiveRecord::Base
  attr_accessor :name
  
  has_many :artists, through: :songs
  has_many :songs, through: :song_genre 
  
  def slug
  end 
  
  def find_by_slug
  end 
end   

