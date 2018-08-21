module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.gsub(/ /, "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find do |object|
        object.slug == slug
      end
    end
  end
end
