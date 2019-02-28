module Slugafiable
  module InstanceMethods
    def slug
      name = self.name
      name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods

    def self.find_by_slug(slug)
      self.all.find{|instance|  instance.slug == slug}
    end
  end
end
