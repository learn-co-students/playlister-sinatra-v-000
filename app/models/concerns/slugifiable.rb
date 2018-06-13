module Slugifiable

  module InstanceMethods

    def slug
      name.gsub(" ", "-").downcase
    end

  end

  module ClassMethods

    def self.find_by_slug(slug)
      self.all.find {|artist| artist.slug == slug}
    end

  end

end
