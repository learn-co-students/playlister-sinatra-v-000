module Slug
  module InstanceMethods
    def slug
      a = self.name.downcase.split(" ")
      a_slug = a.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      a= slug.split("-")
      a = a.map!{|a|a.capitalize}.join(" ")
      b = self.find_by(name: a)
    end
  end
end
