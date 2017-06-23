module Slugifiable

  module InstanceMethods
    def slug
      name_array = name.downcase.split
      name_slug = name_array.join("-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name = slug.gsub("-", " ")
      self.find_by('lower(name) = ?', name)
    end
  end

end
