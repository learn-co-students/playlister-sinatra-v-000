module Slugifiable

    def slug
      self.name.downcase.tr(" ","-")
    end

  module ClassMethod
    def find_by_slug(slug)

      self.all.find{|instance| instance.slug == slug}

    end
  end

end
