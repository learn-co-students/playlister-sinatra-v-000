module Slugifiable
  module InstanceMethods
    def slug
      name = self.name
      name.split.join("-").downcase
    end
  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.each do |s|
        if s.slug == slug
          return s
        end
      end
    end

  end
end