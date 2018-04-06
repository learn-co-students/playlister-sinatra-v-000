module Slugify 
  class Slug

    def slug
      self.name.split(" ").join("-").downcase
    end
    
  end
end