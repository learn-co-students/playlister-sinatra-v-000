module Slugifiable
  module InstanceMethods
    def slug
      name.parameterize
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      # is there a better way to do this?
      self.all.detect {|i| i.name.parameterize == slug}
    end
  end
end