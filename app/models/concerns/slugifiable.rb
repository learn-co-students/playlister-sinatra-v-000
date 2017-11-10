module Slugifiable
  module InstanceMethods
    def slug
      name = self.name.downcase
      name_slug = name.gsub(/[[:punct:]]/, "")
      slug = name_slug.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find { |x| x.slug == slug }
    end
  end
end
