class Song < ActiveRecord::Base 
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  # include Slugify::InstanceMethods
  # extend Slugify::ClassMethods
  # A Song can belong to ONE Artist and multiple genres
  
  
    def slug #take in name and convert to slug
      name = self.name
      splt_name = name.gsub(" ", "-")
    end 
    

    def self.find_by_slug(slug_name) 
      name = slug_name.gsub("-", " ")
      test1 = self.find_by(:name => name)
    end
  
  
  
end