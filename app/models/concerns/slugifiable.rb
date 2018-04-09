module Slugifiable
  module InstanceMethods
    def slug
      name.downcase.tr(" ", "-")
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      name = slug.titleize.tr("-", " ")
      self.find_by(name: name)
    end
  end
end
