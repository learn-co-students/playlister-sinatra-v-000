module Slugifiable
  module ClassMethod
    def find_by_slug(slug)
      self.find_by(name: slug.split("-").join(" ").titleize)
    end
  end
  module InstanceMethod
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end
end