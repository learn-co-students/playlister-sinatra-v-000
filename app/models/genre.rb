class Genre <ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs 
  
  def slug 
    name.gsub(" ", "-").downcase
  end 
  
  def self.find_by_slug(slug)
    Genre.all.detect do |genre|
      genre.name.downcase == slug.gsub("-", " ")
    end 
  end 
end 