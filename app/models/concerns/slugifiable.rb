module Slugifiable
  module InstanceMethods
    def slug
      name.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      unslugged = slug.split("-").map(&:capitalize)*" "
      self.find_by(name: unslugged)
    end
  end
end
