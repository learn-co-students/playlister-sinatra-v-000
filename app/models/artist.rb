class Artist < ActiveRecord::Base 
  has_many :songs 
  has_many :genres, through: :songs
  # include Slugify::InstanceMethods
  # extend Slugify::ClassMethods
  

    def slug #take in name and convert to slug
      name = self.name
      splt_name = name.gsub(" ", "-")
    end 
    

    def self.find_by_slug(slug_name) 
      name = slug_name.gsub("-", " ")
      test1 = self.find_by(:name => name)
    
    end
    
end