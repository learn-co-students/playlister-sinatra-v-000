module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|artist| artist.slug == slug}
    end
  end

   module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end
end 