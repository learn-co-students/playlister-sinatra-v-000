module Slugify
  module InstanceMethods
    def slug 
      self.name.to_s.gsub(" ","-").downcase
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      self.all.find do |name|
        name.slug == slug
      end
    end
  end
end