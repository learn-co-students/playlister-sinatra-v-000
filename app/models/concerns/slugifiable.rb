module Slugifiable
  module InstanceMethods
    def slug
      name = self.name
      name = name.downcase
      a = name.split
      name = a.join('-')
      return name
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      a = slug.split('-')
      name = a.join(" ")
      self.find_by(name: name)

    end
  end
end
