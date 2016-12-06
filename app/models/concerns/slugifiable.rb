module Slugifiable
  module InstanceMethods

    def slug
      self.name.gsub(" ","-").downcase
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      all.each do |x|
        return x if x.slug == slug
      end
    end

  end

end
