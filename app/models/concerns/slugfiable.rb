module Slugifiable

  module InstanceMethods
    def slug
      name = self.name.downcase.gsub(' ','-')
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      Class.all.find do |name|
        name.slug == slug
      end
    end
  end

end
