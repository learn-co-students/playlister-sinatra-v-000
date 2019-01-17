module Slugifiable

  module InstanceMethods
    def slug
      data = self.name.downcase 
      new_data = data.split(" ")
      new_data.join('-')
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
    end
  end
end
