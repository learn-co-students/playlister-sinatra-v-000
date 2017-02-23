module Slugifiable  
  module ClassMethods

    def find_by_slug(slug)
      name = slug.gsub("-", " ").split(" ").each{|w| w.capitalize!}.join(" ").strip
      self.find_by_name(name)
    end
  end

  module InstanceMethods
    def slug
      self.name.downcase.strip.gsub(" ", "-")
    end

  end
end
