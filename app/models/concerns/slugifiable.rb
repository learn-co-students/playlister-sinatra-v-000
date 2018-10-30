module Slugifiable
  module InstanceMethods
    def slug
      slug = self.name.downcase.gsub(" ", '-')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.where("LOWER(name)=?", slug.gsub("-", " ")).first
    end
  end
end
