module Slugifiable

  module Slug

  def slug
    self.name.gsub(" ","-").downcase
  end
end

  module FindBySlug
    def find_by_slug(slug)
      self.all.find do |song|
        song.slug == slug
      end
    end
  end
end
