module Slug
  module InstanceMethod
    def slug
      self.name.downcase.gsub(' ','-')
    end
  end

  module ClassMethod
    def find_by_slug(slug)
      self.all.detect {|i| i.slug == slug}
    end
  end
end
