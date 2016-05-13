module Slugifiable

  module ClassMethods
    def find_by_slug(slug)
      self.all.find do |i|
        i.slug == slug
      end
    end
  end

  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end


end
