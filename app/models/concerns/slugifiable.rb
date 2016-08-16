module Slugifiable
  module InstanceMethod
    def slug
      self.name.gsub(/\W/, "-").downcase
    end
  end

  module ClassMethod
    def find_by_slug(slug)
      self.all.detect {|i| i.slug == slug}
    end
  end
end
