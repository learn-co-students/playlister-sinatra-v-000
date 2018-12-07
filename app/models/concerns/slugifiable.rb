module Concerns

  module Slugifiable

    def slug
      self.name.downcase.split(" ").join("-")
    end

    def self.find_by_slug(slug)
      name = slug.split("-").join(" ").titleize
      self.find_by_name(name)
    end

  end

end
