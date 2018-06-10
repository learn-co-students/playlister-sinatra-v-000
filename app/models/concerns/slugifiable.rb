module Slugifiable

  module SlugMethod
    def slug
      self.name.gsub("","-").downcase
    end
  end

  module FindBySlug
    def find_by_slug(slug)
      self.all.find {|instance| instance.slug == slug}
    end
  end
end 
