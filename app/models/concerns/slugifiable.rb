module Concerns
  module Slugifiable
    
    def find_by_slug(object)
      binding.pry
      object.name.downcase.gsub('-', ' ')
    end
    
    def slug(object)
      
    end
    
  end
end