module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.gsub(/[\s\W]/, "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect{|object| object.slug == slug}
    end
  end

end
