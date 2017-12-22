class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres
  
  def slug 
    slugify = self.name.split(" ").join("-")
    slugify.downcase
  end 
  
  def self.find_by_slug(name)
    unslugify=name.split("-").join(" ")
    
    Song.all.each do |song|
      
      if song.name.downcase == unslugify
        return song
      end 
    end 
  end 
  
  
end 