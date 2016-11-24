module Slugifiable

  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end

  end

  module ClassMethods
    def find_by_slug(my_slug)
      self.all.find{ |x| x.slug == my_slug }
    end
  end


end
