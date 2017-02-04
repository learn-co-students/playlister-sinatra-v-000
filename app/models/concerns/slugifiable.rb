module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      @unslug = slug.split("-").map(&:capitalize).join(' ')
      self.find_by_name(@unslug)
    end
  end

end