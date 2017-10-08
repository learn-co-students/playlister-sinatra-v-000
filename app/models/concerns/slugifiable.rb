module Slugifiable

  module Instance
    def slug
     slug = self.name.downcase.split(" ").join("-")
    end
  end

  module Class
    def find_by_slug(slug)
      unslug = slug.split("-").join(" ")
      self.find_by("lower(name)= ?", unslug.downcase)
    end
  end
end
