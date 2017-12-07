module Slug
  module InstanceMethods

    def slug
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      all.select do |artist|
        artist.slug == slug
      end.first
    end
  end
end
