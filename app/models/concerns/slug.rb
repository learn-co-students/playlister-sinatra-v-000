module Slug

  module Instance

    def slug
      self.name.gsub(" ", "-").downcase
    end

  end

  module Class

    def find_by_slug(slug)
      self.all.each do |music|
        name = music.slug
        if name == slug
          return music
        end
      end
    end

  end

end
