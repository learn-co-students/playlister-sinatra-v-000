module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      name = slug.split("-").map(&:capitalize).join(" ")
      self.where('lower(name) = ?', name.downcase).first
    end
  end
end
