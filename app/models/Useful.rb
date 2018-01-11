module Useful
  module InstanceMethods
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      hey = self.all.each {|hey| hey.slug == slug}
      hey.first
    end
  end

end
