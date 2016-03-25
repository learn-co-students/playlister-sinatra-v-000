module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect{|n| n.slug == slug}
    end
 end

end