module Slugifiable
  module SlugClass
    def find_by_slug(slug)
      name = slug.split('-').map(&:capitalize).join(' ')
      self.find_by(name: name)
    end
  end


  module SlugInstance
    attr_accessor :slug

    def slug
      @slug = self.name.downcase.gsub(" ", "-")
    end
  end
end
