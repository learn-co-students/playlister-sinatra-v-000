module Slugifiable
  module InstanceMethods
    def slug
      self.name.split.join('-').downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      all.find {|a| a.slug == slug}
    end
  end
end
