module Slugifiable

    def slug
      self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def find_by_slug(slug)
      self.all.detect do |artist|
        artist.slug == slug
      end
    end

end
