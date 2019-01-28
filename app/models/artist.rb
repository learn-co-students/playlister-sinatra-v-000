class Artist < ActiveRecord::Base
  #include Slug, not working?
  has_many :songs 
  has_many :genres, through: :songs
  
  def slug 
    name.gsub(" ", "-").downcase
  end 
    
  def self.find_by_slug(slug) 
     self.all.find{
       |artist| artist.slug == slug}
  end 
  
end