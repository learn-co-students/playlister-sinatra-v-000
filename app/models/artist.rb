class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs
  
  def slug(str)
      str.strip.downcase.gsub /\W+/, '-'  
  end
  
  def find_by_slug
    
  end
end