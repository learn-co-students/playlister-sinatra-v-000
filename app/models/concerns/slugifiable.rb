module Slugifiable
  
  module InstanceMethods
    def slug
      self.name.downcase.gsub(/\s*[^A-Za-z0-9\.]\s*/,"-")
    end
  end
  
  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|o| o.slug == slug}
    end
  end
  
end