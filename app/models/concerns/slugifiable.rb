module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      self.all.find{ |object| object.slug == slug}
    end
  end

  module InstanceMethods
    def slug
      name.downcase.gsub(" ", "-")
    end
  end

end
