class Genre < ActiveRecord::Base
  #include Slug
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs 
  has_many :song_genres

  def slug 
    self.name.gsub(" ", "-").downcase
  end 
    
 def self.find_by_slug(slug) 
     self.all.find{
       |artist| artist.slug == slug}
  end 

end