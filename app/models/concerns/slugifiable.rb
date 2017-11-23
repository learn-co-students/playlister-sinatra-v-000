module Slugifiable
  module InstanceMethods
    def slug
      self.name.split(" ").map!{|e| e.downcase}.join("-")
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      find_name = slug.split("-").map!{|e| e.capitalize}.join(" ")
      #self.find_by name: find_name
      self.find_by name: find_name
    end
  end
end
