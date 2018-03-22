module Slugify
  module InstanceMethod
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethod
    def find_by_slug(slug)
      self.all.find{|a| a.slug == slug}
    end
  end
end
