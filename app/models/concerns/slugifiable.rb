module Slugifiable
  module ClassMethods
    def self.find_by_slug(slug)
      Artist.all.find{|artist| artist.slug == slug}
    end
  end
  
  module InstanceMethods
    def slug 
      self.name.gsub(" ", "-").downcase
    end
  end
end