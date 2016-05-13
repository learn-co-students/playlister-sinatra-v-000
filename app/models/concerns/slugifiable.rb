module Slugifiable
  module Instance
    def slug
      self.name.gsub(" ","-").downcase
    end
  end

  module Class
    def find_by_slug(slug)
      self.all.find{|instance| instance.slug == slug }
    end
  end
end