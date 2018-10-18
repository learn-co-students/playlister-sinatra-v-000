module Slugify

  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|i| i.slug == slug}
    end
  end
end