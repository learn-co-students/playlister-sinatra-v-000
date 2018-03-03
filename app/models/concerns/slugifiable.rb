module Slugifiable
  module InstanceMethods
    def slug
      self.name.parameterize if self.name
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect{|model| model.slug == slug}
    end
  end

end
