class Genre < ActiveRecord::Base
  
  has_many :artists, through: :songs  
  has_many :songs, through: :song_genres
  has_many :song_genres 
  
  def slug
    data = self.name.downcase 
    new_data = data.split(" ")
    new_data.join('-')
  end
  
  def self.find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
  end
  
end