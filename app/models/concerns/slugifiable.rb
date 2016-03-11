module Slugifiable

  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(name)
      self.all.detect do |i|
        i.slug == name
      end
    end
  end
end
