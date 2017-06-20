module Slugifiable

  module InstanceMethods
    def slug
      name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      # binding.pry
      # self.find_by(name: deslug(slug))
      self.all.find {|i| i.slug == slug}

    end

    def deslug(slug)
      slug.gsub("-", " ").split.map{|i| i.capitalize}.join(" ")
    end
  end
end
