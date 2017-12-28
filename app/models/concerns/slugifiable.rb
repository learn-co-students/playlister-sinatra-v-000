require 'pry'

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
=begin
    def find_by_slug(slug)
      slug = slug.split("-").map(&:capitalize)*' '
      self.all.find_by(name: slug)
    end
=end

    def find_by_slug(slug)
      self.all.find{ |instance| instance.slug == slug }
    end
  end
end
