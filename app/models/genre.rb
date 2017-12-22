class Genre < ActiveRecord::Base 
  has_many :song_genres 
  has_many :songs, through: :song_genres 
  has_many :artists, through: :songs 
  
  def slug 
    slugify = self.name.split(" ").join("-")
    slugify.downcase
  end 
  
  def self.find_by_slug(name)
    unslugify=name.split("-").join(" ")
    
    Genre.all.each do |genre|
      
      if genre.name.downcase == unslugify
        return genre 
      end 
    end 
  end 
  
  
end 