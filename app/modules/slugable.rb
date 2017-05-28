module Slugable
  module InstanceMethods
    def slug
      self.name.gsub(/\ |[$.+'()&]/, '-').downcase
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      self.all.detect do |i|
        i.slug == slug
      end
    end
  end
end
