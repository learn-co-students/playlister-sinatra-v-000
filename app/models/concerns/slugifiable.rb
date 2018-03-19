module Slugifiable

  module InstanceMethods
    def slug
      # binding.pry
      self.name.downcase.gsub(" ", "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      # binding.pry
      self.all.find{ |object| object.slug == slug}
    end
  end
end
