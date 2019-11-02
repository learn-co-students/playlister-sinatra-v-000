module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end

  end

  module ClassMethods
    def find_by_slug(slug)
      slugged = slug.gsub("-", " ")
      s = slugged.split(" ").map(&:capitalize).join(' ')
      self.find_by(name: s)
    end
  end
end
