module SlugModule
  module InstanceMethods

    def slug
      slugged = self.name.gsub(/[^0-9A-Za-z]/, '-').downcase
      slugged
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      self.all.detect do |s|
        s if s.slug == slug
      end
    end
  end
end
