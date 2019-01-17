
class Artist < ActiveRecord::Base
  # extend Slugifiable::ClassMethods
  # include Slugifiable::InstanceMethods 
  
  has_many :songs
  has_many :genres, through: :songs 
  #has_many :song_genres 


  def slug
    data = self.name.downcase 
    new_data = data.split(" ")
    new_data.join('-')
  end
  
  def self.find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
  end
  
end