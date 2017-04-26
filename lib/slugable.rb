module Slugable
  module ClassMethods
    def find_by_slug(slug)
      all.find do |o|
        o.slug==slug
      end
    end
  end
  module InstanceMethods
    def slug
      name.gsub(' ', '-').downcase
    end
  end
end
