module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.scan(/[a-z0-9]+/).join('-')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find { |e| e.slug == slug }
    end
  end
end
