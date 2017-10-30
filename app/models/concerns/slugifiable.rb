module Slugifiable

  module InstanceMethods

    def slug
      name.downcase.gsub(" ", "-")
    end

  end  #  End of Module
  
  module ClassMethods

    def find_by_slug(slug)
       self.all.find {|s| s.slug == slug}
    end

  end  #  End of Module


end  #  End of Module