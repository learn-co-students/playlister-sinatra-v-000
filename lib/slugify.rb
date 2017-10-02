module Slugify
  module Slug
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end

  module FindBySlug
    def find_by_slug(slug)
      self.all.find{|s| s.slug == slug}
    end
  end

end
