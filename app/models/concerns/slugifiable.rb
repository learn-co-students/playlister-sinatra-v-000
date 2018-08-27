module Concerns
  module Slugifiable
    def slug
      text = self.name.split(" ").join("-").downcase
    end
  end
  
  module ClassMethods
    def find_by_slug(text)
      text = text.split("-").join(" ").titleize
      object = self.find_by(:name => text)    
    end
  end
end