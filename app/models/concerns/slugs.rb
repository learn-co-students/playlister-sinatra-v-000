module Slugs
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(arg)
      self.all.find{|e| e.slug == arg}
    end
      
  end
end