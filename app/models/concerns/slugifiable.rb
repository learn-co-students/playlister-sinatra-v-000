module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      self.all.each do |val|
        if val.slug == slug
          return val
        end
      end
    end
  end

  module InstanceMethods
    def slug
      slug = self.name.downcase.gsub(" ", "-")
    end
  end
end
