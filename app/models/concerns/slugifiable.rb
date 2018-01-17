class Slugify
  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|i| i.slug == slug} # case-sensitive so "unsluging" is too complicated
    end

  end

  module InstanceMethods
    def slug
      slug = self.name.gsub(' ', '-').downcase
      slug
    end
  end

end
