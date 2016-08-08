module Slugifiable

  module InstanceMethods

    def slug
      self.name.gsub(" ", "-")
    end

  end

  module ClassMethods

    def find_by_slug

    end

  end

end
