module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-").gsub(/[^a-zA-Z0-9-]/, "")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
       self.all.find{|t| t.slug == slug}
    end
  end


end