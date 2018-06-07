module Slug
  module InstanceMethods
    def slug
      a = self.name.downcase.split(" ")
      a_slug = a.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|a|a.slug == slug}
    end
  end
end
