module Slugifiable

  module InstanceMethods

    def slug
      if !!self.name
        self.name.gsub(" ", "-").downcase
      end
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.find { |object| object.slug == slug}
    end

  end

end
