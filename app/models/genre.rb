class Genre < ActiveRecord::Base
  attr_accessor :name
  
  has_many :artists
  has_many :songs #or has_many :songs, through: :genre 

  def initialize
  end 
    
  def songs
  end 
  
  def artists
  end 
  
  def slug
  end 
  
  def find_by_slug
  end 
end   

