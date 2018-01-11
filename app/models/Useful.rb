module Useful
  module InstanceMethods
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|hey| hey.slug == slug}
    end
  end

end
