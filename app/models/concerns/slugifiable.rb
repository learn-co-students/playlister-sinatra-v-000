module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      self.find_by(name: slug.split("-").map{|x| x == "the" ? x : x.capitalize}.join(" "))
    end
  end

  module InstanceMethods
    def slug
      self.name.downcase.split(" ").join("-")
    end
  end

end
