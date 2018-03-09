module Slugifiable
  module InstanceMethods
    def slug
      str = self.name
      str = str.downcase
      return str.gsub " ", "-"
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect{|inst|
        slug == inst.slug
      }
    end
  end
end
