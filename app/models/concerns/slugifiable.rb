module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ","-").gsub(/[^a-zA-Z0-9-]/, "")
    end
  end

  module ClassMethods
    def find_by_slug(search_slug)
      self.all.detect{|i| i.slug == search_slug}
    end
  end
end
