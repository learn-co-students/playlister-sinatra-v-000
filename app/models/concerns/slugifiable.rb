module Slugifiable
  module InstanceMethods
    def slug
      @slug ||= name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find do |artist|
        artist.slug == slug
      end
    end
  end
end
