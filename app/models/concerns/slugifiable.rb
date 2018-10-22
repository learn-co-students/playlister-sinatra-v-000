require 'slugify'

module Slugifiable
  module InstanceMethods

    def slug
      self.name.slugify
    end
  end
end

module Slugifiable
  module ClassMethods

    def find_by_slug(slug)
       self.all.find{ |instance| instance.slug == slug }
    end
  end
end
