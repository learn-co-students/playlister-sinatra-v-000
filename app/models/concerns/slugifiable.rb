module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.gsub(' ', '-')
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      self.detect{|slug| slug.name == name}
    end
  end

end
