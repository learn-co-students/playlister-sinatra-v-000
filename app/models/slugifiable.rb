module Slugifiable
  module InstanceMethods
    def slug
      # self.name.downcase.split(" ").join("-")
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find { |a| a.slug == slug }
    end
  end
end
