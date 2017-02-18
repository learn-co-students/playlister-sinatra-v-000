module Slugifiable
  module InstanceMethods
    def add_slug
      update slug: name.downcase.split(' ').join('-').delete('.')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      find_by slug: slug
    end
  end
end
