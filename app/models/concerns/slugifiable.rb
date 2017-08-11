
module Slugified

  module InstanceMethods
    def slug
      self.name.gsub(/\W/, '-').downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find do |item|
        item.slug == slug
      end
    end
  end
end
