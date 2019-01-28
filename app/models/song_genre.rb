class SongGenre < ActiveRecord::Base
  #include slug 
  belongs_to :song
  belongs_to :genre
  
  def slug 
    self.name.gsub(" ", "-").downcase
  end 
    
  def self.find_by_slug(slug) 
     self.all.find{
       |artist| artist.slug == slug}
  end 
  
end