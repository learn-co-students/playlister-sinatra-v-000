module Slug

  class Slugging
    def slug
      name.gsub(" ", "-").downcase
    end

    def self.find_by_slug(slug)
       self.all.find{|artist| artist.slug == slug}
    end
  end

end
