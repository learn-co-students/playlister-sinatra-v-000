module Slugifiable

#instance method - @artist.slug
#include Slugifiable::Instance
  module Instance
    def slug
      self.name.to_s.gsub(" ", "-").downcase
    end
  end

#class method - 'undefined method fbs for Artist'
#extend Slugifiable::Class
  module Class
    def find_by_slug(slug)
      self.all.find {|x| x == slug}
    end
  end

end
