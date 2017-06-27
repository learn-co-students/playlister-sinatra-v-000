module Slug
  module InstanceMethods
    def slug
      self.name.downcase.split.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      unslug = slug.split("-").join(" ")
      self.where('lower(name) = ?', unslug).first
    end
  end
end
