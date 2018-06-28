module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(/[\s\t\r\n\f]/,'-').gsub(/\W/,'-').downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.detect {|a| a.slug == slug}
    end
  end
end
