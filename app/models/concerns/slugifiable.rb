module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      #iterate through db, return that object and then call .slug on it, then see if it matches slug
    end
  end

  module InstanceMethods
    def slug
      slugified = self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      slugified
    end
  end
end
