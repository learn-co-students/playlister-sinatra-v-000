module Sluggable
  module InstanceMethods
    def slug
      name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      all.find{|object| object.slug == slug}
    end
  end
end