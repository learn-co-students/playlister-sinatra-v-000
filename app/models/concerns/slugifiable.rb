module Concerns
  module Slugifiable
    def slug
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end
  module Slugfindable
    def find_by_slug(slug)
      self.all.detect{|item| item.slug == slug}
    end
  end
end
