module Slugifiable
  module Instances

    def slug
        self.name.gsub(" ", "-").downcase
    end

  end

  module Class

    def find_by_slug(slug)
      self.all.detect {|instance| instance.slug == slug}
    end

  end
end
