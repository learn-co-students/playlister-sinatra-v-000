
module Slug
  module InstanceMethods
    def slug
      slug = self.name.downcase.split(" ").join("-")
      slug
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect{ |object| object.slug == slug }
    end
  end

end
