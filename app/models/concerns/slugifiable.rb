module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(/[\W\s]/, "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find { |o| o.slug == slug }
    end
  end
end