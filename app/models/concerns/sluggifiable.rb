module Sluggifiable 

  module ClassSlug
    def slug
      self.name.split(" ").map(&:downcase).join("-")
    end
  end

  module InstanceSlug
    def self.find_by_slug(slug)
      self.all.find{ |find| find.slug == slug}
    end
  end

end