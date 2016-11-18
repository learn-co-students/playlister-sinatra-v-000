module Slugifiable

  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    # no need to put self.find_by_slug since declared as class method
    def find_by_slug(queried_slug)
      self.all.find{ |x| x.slug == queried_slug }
    end
  end
end
