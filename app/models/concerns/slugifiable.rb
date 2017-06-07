module Concerns
  module Slugifiable
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module SlugFindable
    def find_by_slug(slug)
      self.all.detect{|obj| obj.slug == slug}
    end
  end
end
