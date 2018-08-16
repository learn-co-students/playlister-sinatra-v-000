class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  
  def slug
    text = self.name.split(" ").join("-").downcase
  end
    
  def self.find_by_slug(text)
    text = text.split("-").join(" ").titleize
    self.find_by(:name => text)    
  end
end
