module Slug
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      all.select do |model|
        model.slug == slug
      end.first
    end
  end
end
