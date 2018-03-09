module Concerns
  module Slugify
    def slug
      self.name.downcase.gsub(" ",'-')
    end
  end
  module Findable
    def find_by_slug(slug)
      slug = slug.gsub("-", " ")
      self.all.detect{|i| i.name.downcase == slug}

    end
  end
end
