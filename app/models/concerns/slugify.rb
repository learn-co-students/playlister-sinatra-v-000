# Slugify functionality
module Slugify
  module ClassMethods
    def find_by_slug(slug)
      all.find { |instance| instance.slug == slug }
    end
  end

  module InstanceMethods
    def slug
      name.downcase.strip.tr(' ', '-').gsub(/[^\w-]/, '')
    end
  end
end
