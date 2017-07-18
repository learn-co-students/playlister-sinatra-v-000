module Sluggable

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect{|instance| instance.slug == slug}
    end
  end

  module InstanceMethods
    def slug
      name.downcase.split.join("-")
    end
  end

end