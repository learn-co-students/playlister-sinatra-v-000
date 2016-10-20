module Slugifiable

  module InstanceMethods

    def slug
      self.name.downcase.gsub(" ", "-")
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      name= slug.split("-").map(&:capitalize).join(" ")
      find_by(name: name)
    end

  end

end
