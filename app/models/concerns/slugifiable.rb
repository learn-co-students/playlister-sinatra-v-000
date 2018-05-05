#require 'slugify'
module Slugifiable
  module InstanceMethods
    def slug
      name.slugify
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find do |obj|
        obj.name.downcase == slug.gsub('-', ' ')
      end
    end
  end
end
