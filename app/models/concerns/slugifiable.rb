module Slugifiable
  module InstanceMethods
    def slug
      self.name.downcase.gsub(/\W+/, '-')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|i| i.slug == slug}
    end
  end
end
