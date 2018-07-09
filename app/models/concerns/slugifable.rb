module Slugifiable

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|value| value.slug == slug}
    end
  end

  module InstanceMethods
    def slug
      self.name.split(" ").join("-").downcase
    end
  end

end
