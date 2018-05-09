module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.split(/\s/).join('-').split(/[^a-zA-Z\d-]/).join('')
    end
  end
  
  module ClassMethods
    def find_by_slug(slug_to_find)
      self.all.find{|s| s.slug == slug_to_find}
    end
  end
end
