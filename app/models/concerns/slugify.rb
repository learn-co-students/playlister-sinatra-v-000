module Slugify
  module InstanceMethods 
    def slug 
      self.name.downcase.gsub(" ", "-")
    end
  end 

  module ClassMethods
    def find_by_slug(slug)
      Genre.all.find {|genre| genre.slug == slug} 
    end
  end 
end 