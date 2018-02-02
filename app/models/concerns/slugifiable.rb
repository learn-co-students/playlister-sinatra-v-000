module Slugifiable
  module InstanceMethods
    def slug
      slug = self.name.downcase.gsub(" ", "-")
      slug
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      lower_name = slug.split("-").join(" ")
      self.where(["LOWER(name) = ?", lower_name]).take
    end
  end
end
