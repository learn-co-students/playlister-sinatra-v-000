module Slugifiable
  attr_accessor :slug

  module InstanceMethods
    def slug
      @slug = self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.each do |slugifiable|
        if slugifiable.slug == slug
          return slugifiable
        end
      end
    end
  end
end
