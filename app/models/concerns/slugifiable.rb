module Slugifiable 
  module InstanceMethods
    def slug
    end
  end
  #<#Artist>.slug
  module ClassMethods
    def find_by_slug(slug)
    end
  end
  #Artist.find_by_slug(:slug)
end
