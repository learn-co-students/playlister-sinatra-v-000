module Slugifiable
  module InstanceMethods
    def slug
      self.name.split(" ").map!{|e| e.downcase}.join("-")
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      find_name = slug.split("-").map!{|e| e}.join(" ")
      #self.find_by name: find_name
      #need to iterate over all instances to find slug
      self.all.find{|e| e.slug == slug}
    end
  end
end
