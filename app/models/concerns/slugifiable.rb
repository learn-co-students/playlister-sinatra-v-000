module Slugifiable

  module InstanceMethods
    def slug
      self.name.gsub((/\W/), "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|string| string.slug == slug}
    end
  end

end
