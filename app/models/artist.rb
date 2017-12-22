class Artist < ActiveRecord::Base 
  has_many :songs 
  has_many :genres, through: :songs 
  
  def slug 
    slugify = self.name.split(" ").join("-")
    slugify.downcase
  end 
  
  def self.find_by_slug(name)
    unslugify=name.split("-").join(" ")
    
    Artist.all.each do |artist|
      
      if artist.name.downcase == unslugify
        return artist 
      end 
    end 
  end 
  
end 