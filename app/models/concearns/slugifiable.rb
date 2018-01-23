module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|i| i.slug == slug}
    end
  end

  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ","-")
    end
  end
end
