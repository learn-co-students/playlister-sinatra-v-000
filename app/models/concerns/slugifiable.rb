module Slugifiable

  module InstanceMethods
    def slug
      # slug = self.name.gsub("/[\p{P}\p{S}]/")

      slug = self.name.downcase.gsub(" ","-")
      # slug
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find { |thing| thing.slug == slug }
    end
  end
end
