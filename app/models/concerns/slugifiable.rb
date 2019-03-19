module Slugifiable

  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|o| o.slug == slug}
    end
  end

  module InstanceMethods
    def slug
      slug= self.name.downcase.gsub(" ", "-")
    end
  end
end
