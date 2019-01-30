module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      self.all.find {|s| s.slug == slug}
    end
  end
end