module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(/\s+/, "-").delete('^a-zA-Z0-9\-').downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.each {|a| return a if a.slug == slug}
    end
  end
end
