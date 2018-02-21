module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(/[^0-9A-Za-z]/,"-")
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      slug
    end
  end
end
