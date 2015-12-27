module Slugable
  module InstanceMethods
    def slug
      name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      all.find{|artist| artist.name == normalize_slug(slug)}
    end

    def normalize_slug(slug)
      slug.split("-").map(&:capitalize).join(" ")
    end
  end
end
