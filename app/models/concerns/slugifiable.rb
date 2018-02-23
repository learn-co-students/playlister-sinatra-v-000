module Slugifiable
  module InstanceMethods

    def slug
      self.name.gsub(" ", "-").downcase
    end

  end

  module ClassMethods

    def find_by_slug(slug)
      self.all.detect {|song| song.slug == slug}
    end

  end

end
