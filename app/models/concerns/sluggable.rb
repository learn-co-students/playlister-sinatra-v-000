module Sluggable
  module InstanceMethods
    def slug
      name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      all.find{|instance| instance.name.downcase == normalize(slug).downcase}
    end

    def normalize(slug)
      slug.split("-").map(&:capitalize).join(" ")
    end
  end
end
