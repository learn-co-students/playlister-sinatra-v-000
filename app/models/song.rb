class Song < ActiveRecord::Base
  include Slugifiable
  
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres 
  
  def slug
    data = self.name.downcase 
    new_data = data.split(" ")
    new_data.join('-')
  end
  
  def self.find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
  end
  
end