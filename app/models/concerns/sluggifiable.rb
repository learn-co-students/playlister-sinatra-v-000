module Sluggifiable 

  module ClassSlug
    def find_by_slug(slug)
      self.all.find{ |find| find.slug == slug}
    end
  end

  module InstanceSlug
    def slug
      self.name.split(" ").map(&:downcase).join("-")
    end
  end

end
