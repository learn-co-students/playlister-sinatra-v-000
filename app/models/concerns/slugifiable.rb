module Slug
  module ClassMethods
    def find_by_slug(slug)
      unsluged = slug.titleize
      self.find_by(name: unsluged)
    end
  end

  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

end
