module Slugifiable


  module ClassMethods
    def find_by_slug(slug)
     self.all.detect do |artist|
       artist.slug == slug
     end
    end
  end


  module InstanceMethods
    def slug
      name.strip.downcase.gsub(" ", "-").gsub(/[^\w-]/,"")
    end
  end



end
