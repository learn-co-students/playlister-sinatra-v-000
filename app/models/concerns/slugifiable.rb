module Slugifiable
  module InstanceMethods
    def slug
      @slug = slugify(self.name)
    end
    
    def slugify(name)
      name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
  end
  
  module ClassMethods
    def find_by_slug(slug)
      self.all.detect{|v| v.slug == slug}
    end
  end
end