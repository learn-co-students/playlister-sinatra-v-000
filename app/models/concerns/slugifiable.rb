module Slugifiable
  module InstanceMethods
    def slug
      self.name.strip.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      slug_name = slug.gsub(" ", "-")
      self.where("lower(name) = ?", slug_name).first
    end
  end
end
