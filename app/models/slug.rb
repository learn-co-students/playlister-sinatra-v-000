module Slug

  module InstanceMethods

    def slug
      obj = self.name.downcase
      obj.gsub(" ", "-")
    end
  end


  module ClassMethods

    def find_by_slug(slug)
      self.all.find{|obj| obj.slug == slug}
    end
  end

end
