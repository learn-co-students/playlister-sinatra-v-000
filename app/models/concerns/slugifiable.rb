module Slugifiable
  module InstanceMethods
    def slug
      name.downcase.split.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name = slug.split("-").map(&:capitalize).join(' ')
      self.all.detect { |a| a.name == name }
    end
  end
end
