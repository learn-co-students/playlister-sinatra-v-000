module Slugifiable

  module InstanceMethods #include
    def slug
      self.name.downcase.gsub(" ","-")
    end
  end

  module ClassMethods #extend
    def find_by_slug(slug)
      self.all.find {|s| s.slug == slug}
    end

  end

end
