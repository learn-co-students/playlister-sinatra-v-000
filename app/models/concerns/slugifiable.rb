module Slugifiable
  module InstanceMethods
    def slug
      self.name.split(" ").join("-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name = slug.split("-").map {|w| w.capitalize }.join(" ")
      self.find_by(name: name)
    end
  end
end