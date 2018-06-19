module Slugifiable

  module InstanceMethod
    def slug
      self.name.gsub(" ","-").downcase
    end
  end

  module ClassMethod
    def find_by_slug(slug)
      self.all.find {|instance| instance.slug == slug}
    end
  end

end
