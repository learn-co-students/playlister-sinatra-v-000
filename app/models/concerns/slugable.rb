module Slugable
  module ClassMethods
    def find_by_slug(sl)
      self.all.detect{ |instance| instance.slug == sl }
  end
  end

  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-").delete("/\W/")
    end
  end
end