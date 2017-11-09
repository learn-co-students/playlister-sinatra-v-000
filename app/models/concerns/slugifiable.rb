#It's Ruby convention to put modules in a concerns/ folder nested under lib/

module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
    end

    #not as good
    # def self.find_by_slug(slug)
    #   self.find_by(name: slug.sub("-", " ").gsub(/[A-Za-z']+/,&:capitalize))
    #end
  end
end
