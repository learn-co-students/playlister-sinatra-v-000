module Slugifiable
  module InstanceMethods
    def slug
      name.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      all.find { |instance| instance.slug == slug }
    end
  end
end
