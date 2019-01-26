module Slugify

  module ClassMethods
    def find_by_slug(slug)
      self.find { |name| name.slug == slug }
    end
  end

  module InstanceMethods
    def slug
      self.name.gsub(/\s/, "-").gsub(/[^0-9A-Za-z\-]/, '').downcase
    end
  end

end
